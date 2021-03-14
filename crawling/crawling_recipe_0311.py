import requests
from bs4 import BeautifulSoup
import pandas as pd
import csv
import os
import time

# cat4=63 밑반찬 o 
# cat4=56 메인반찬
# cat4=54 국/탕
# cat4=55 찌개
# cat4=53 면/만두
# cat4=52 밥/죽/떡
# cat4=61 퓨전

## 수정할 곳
recipe_type = str(63)
recipe_range = range(1, 3)
file_name = 'recipe_' + recipe_type + '.csv'
##

# 공백제거
def removeSpace(_str):
    return _str.replace('  ', '').replace('\n', '').strip()

# 타이틀과 재료 크롤링 함수
def getTitleAndIngrediant(dom):
    cont_ingre = dom.find('div',class_='cont_ingre2')
    divs = cont_ingre.find_all('li')
    title = removeSpace(dom.find('div',class_="view2_summary st3").find('h3').text)
    i = 0
    ingre = []
    for div in divs:
        i += 1
        ingre.append(str(i)+')'+removeSpace(div.text))
    return title, ingre

# 레시피 크롤링 함수
def getContent(dom):
    view_step = dom.find('div',class_='view_step')
    divs = view_step.find_all('div',{'class':"media-body"})
    i = 0
    contents = []
    for div in divs:
        i += 1
        contents.append(str(i)+')'+ removeSpace(div.text))
    return contents

# 데이터프레임으로 데이터 생성하는 함수
def makeData(pageUrl, id_number):
    try:
        recvd = requests.get(pageUrl, verify=False, timeout=10)
        dom = BeautifulSoup(recvd.text,'lxml')
        title, r_ingre = getTitleAndIngrediant(dom)
        r_content = getContent(dom)

        df = pd.DataFrame({'id_number': [id_number], 'recipe_name' : [title], 'recipe_ingre' : [r_ingre], 'recipe_contents' : [r_content]})
        if not os.path.exists(file_name):
            df.to_csv(file_name, index=False, mode='w', encoding='utf-8')
        else :
            df.to_csv(file_name, index=False, mode='a', encoding='utf-8', header = False)

    except AttributeError as e:
        pass

# 만개의 레시피 url 크롤링 함수
def main(url):
    recvd = requests.get(url, verify = False, timeout = 10) 
    dom = BeautifulSoup(recvd.text,'lxml')
    lis = dom.find_all('li',{'class':"common_sp_list_li"})
    for li in lis:
        pageUrl='https://www.10000recipe.com'+li.find('a')['href']
        makeData(pageUrl, pageUrl.replace('https://www.10000recipe.com/recipe/',''))

# 시작 url
url='https://www.10000recipe.com/recipe/list.html?cat4=' + recipe_type + '&order=reco&page={}'

# 페이지 범위
if __name__=='__main__':
    for page in recipe_range:
        main(url.format(page))
        time.sleep(3)

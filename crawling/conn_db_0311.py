import scipy.io
import csv
import pymysql
# config = { "user": "root", "password": "1234", "host": "sarte.kr", "database": "food", "port": "3306" }

# cat4=63 밑반찬 
# cat4=56 메인반찬
# cat4=54 국/탕
# cat4=55 찌개
# cat4=53 면/만두
# cat4=52 밥/죽/떡
# cat4=61 퓨전

conn = pymysql.connect(host='sarte.kr', user='root', password='1234', db='food', charset='utf8')
curs = conn.cursor()
conn.commit()

# f = open('recipe_ingre.csv','r')
f = open('recipe_52.csv', 'rt', encoding='UTF8')
csvReader = csv.reader(f)
for row in csvReader:
    try:
        code = row[0]
        name = row[1]
        ingre = row[2]
        content = row[3]
        sql = "insert into recipe_info (recipe_code, recipe_name, recipe_ingredients, recipe_content) values (%s, %s, %s, %s)"
        curs.execute(sql, (code, name, ingre, content))
    except IndexError:
        pass
    

#db의 변화 저장
conn.commit()
f.close()
conn.close()

# food table의 food_name 칼럼과 recipe_info의 recipe_name의 칼럼을 비교해서
# food_name에 해당하는 단어가 들어간 recipe_name을 찾아서
# recipe_info의 food_name에 넣어준다

# UPDATE recipe_info a, (SELECT r.id, f.food_name FROM recipe_info r JOIN (SELECT * from food WHERE food_cate1 = '음식') f ON REGEXP_REPLACE(r.recipe_name, CONCAT('(.*)(', f.food_name, ')(.*)'), '\\2') = f.food_name) b
# SET a.food_name = b.food_name
# WHERE a.id = b.id;
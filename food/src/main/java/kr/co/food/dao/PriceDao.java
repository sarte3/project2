package kr.co.food.dao;

import java.util.ArrayList;
import kr.co.food.dto.PriceDto;

public interface PriceDao {

	//가격 증감률 상승,하락 5개씩 추출
	public ArrayList<PriceDto> getBottom5();
	public ArrayList<PriceDto> getTop5();
	
	//특정 재료의 가격 10일치 추출
	public ArrayList<PriceDto> getPrice(String foodname);
	
	//가격 검색
	public ArrayList<PriceDto> getAllPriceList(String sword, int index);
	public Integer getPriceCnt(String sword);
	
}

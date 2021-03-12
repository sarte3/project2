package kr.co.food.dao;

import java.util.ArrayList;
import kr.co.food.dto.PriceDto;

public interface PriceDao {

	public ArrayList<PriceDto> getTop5();
	public ArrayList<PriceDto> getPrice(String foodname);
	
	public ArrayList<PriceDto> getAllPriceList(String sword, int index);
	public Integer getPriceCnt(String sword);
	
}

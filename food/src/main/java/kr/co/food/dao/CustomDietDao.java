package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.CustomDietDto;

public interface CustomDietDao 
{
	public ArrayList<String> getFoodName(String food_cate3, String food_name);
	
	public void write(CustomDietDto dto);
	
	public ArrayList<CustomDietDto> getList(String userid);
	
	public ArrayList<CustomDietDto> getDayList(String userid, String day);
	
	public CustomDietDto content(String id);
	
	public void update(CustomDietDto dto);
	
	public void delete(String id);
}

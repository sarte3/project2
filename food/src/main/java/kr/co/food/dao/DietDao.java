package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.FoodDto;
import kr.co.food.dto.PeopleDto;

public interface DietDao {
	
	public PeopleDto get_people_nut(int nut_id);
	
	public ArrayList<FoodDto> get_100_foods(String cate3);
}

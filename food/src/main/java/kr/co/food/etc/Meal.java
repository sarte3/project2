package kr.co.food.etc;

import java.util.ArrayList;

import kr.co.food.dto.FoodDto;

public class Meal {
	public ArrayList<ArrayList<FoodDto>> food_list = new ArrayList<ArrayList<FoodDto>>();
	public Boolean[] cur_cate = {false, false, true, false, false, false};
	
	
	
	
	public void set_cur_cate(int index) {
		this.cur_cate[index] = true;
	}
}

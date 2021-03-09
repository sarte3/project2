package kr.co.food.etc;

import java.util.ArrayList;

import kr.co.food.dto.FoodDto;

public class Meal {
	public ArrayList<ArrayList<FoodDto>> food_list = new ArrayList<ArrayList<FoodDto>>();
	public Boolean[] cur_cate = {false, false, false, false, false, false};
	public double[] cur_nut = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	public int[] cnt_rejection = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
	public int cate_idx = 0;
	public ArrayList<FoodDto> meals = new ArrayList<FoodDto>();
	
	
	
	public void set_cur_cate(int index) {
		this.cur_cate[index] = true;
	}
}

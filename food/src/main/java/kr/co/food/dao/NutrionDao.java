package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.EnutritionDto;
import kr.co.food.dto.NutrionDto;


public interface NutrionDao {
	public NutrionDto n_view(String food_code);
	public ArrayList<NutrionDto>list(String sword,int index);
	public Integer getCnt(String sword);
	public ArrayList<EnutritionDto>e_list();
	public ArrayList<NutrionDto>fclist();
}


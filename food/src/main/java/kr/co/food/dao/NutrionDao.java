package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.NutrionDto;


public interface NutrionDao {
	public NutrionDto n_view(String food_code);
	public ArrayList<NutrionDto>list(int index);
	
	public Integer get_record_cnt();//총레코드의 갯수
	public Integer get_page_cnt();//총페이지의 갯수
	//r검색부분
	public ArrayList<NutrionDto> slist(String sear,String sword);
}


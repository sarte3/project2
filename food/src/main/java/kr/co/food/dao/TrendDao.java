package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.TrendDto;

public interface TrendDao
{
	public ArrayList<TrendDto> getList();
	
	public ArrayList<TrendDto> getTrendList(String sword, int index);
		
	public Integer getTrendCnt(String sword);
	
}

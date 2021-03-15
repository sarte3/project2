package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.FnqDto;

public interface FnqDao 
{
	public void write(FnqDto dto);
	
	public Integer getCnt();
	
	public ArrayList<FnqDto> getList(int index);
	
	public FnqDto getContent(String fnq_id);
	
	public void update(FnqDto dto);
	
	public void delete(String fnq_id);
	
	public ArrayList<FnqDto> getList5();
}

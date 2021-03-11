package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.WeekDto;

public interface WeekDao {

	public ArrayList<WeekDto> getList(int type);
	public WeekDto getMeal (int week_no);

}

package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.NoticeDto;

public interface NoticeDao {
	public void write_ok(NoticeDto ndto);
	public ArrayList<NoticeDto> list(String sword, int index);
	public Integer getCnt(String sword);
	
	public NoticeDto content(String notice_id);
	public void readnum(String notice_id);
	public NoticeDto update(String notice_id);
	public void update_ok(NoticeDto ndto);
	public void delete(String notice_id);

	//인덱스용
	public ArrayList<NoticeDto> inlist();
}

package kr.co.food.dao;

import kr.co.food.dto.MemberDto;

public interface MemberDao {

	public void join(MemberDto dto);

	public Integer login_ok(String userid, String pwd);
}

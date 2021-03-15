package kr.co.food.dao;

import kr.co.food.dto.MemberDto;

public interface MemberDao {

	public void join(MemberDto dto);

	public Integer login_ok(String userid, String pwd);
	
	public MemberDto getUserInfo(String userid);

	public void mypage_update(MemberDto dto);
	
	public void member_out(String userid);
	
	public Integer get_userid_chk(String userid);
	
	public Integer get_email_chk(String email);
	
	public String get_userid(String name, String email);
	
	public String get_pwd(String userid, String name, String email);
}

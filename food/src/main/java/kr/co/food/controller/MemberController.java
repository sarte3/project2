package kr.co.food.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController 
{
	@Autowired
	public SqlSession sqlsession;
	
	@RequestMapping("/member/member")
	public String member()
	{
		return "/member/member";
	}
	
}

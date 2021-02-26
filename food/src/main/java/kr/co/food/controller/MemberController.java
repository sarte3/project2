package kr.co.food.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.MemberDao;
import kr.co.food.dto.MemberDto;

@Controller
public class MemberController 
{
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/member/member")
	public String member()
	{
		return "/member/member";
	}
	
	@RequestMapping("/member/member_ok")
	public String member_ok(MemberDto dto)
	{
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.join(dto);
		
		return "redirect:/index";
	}
	
}

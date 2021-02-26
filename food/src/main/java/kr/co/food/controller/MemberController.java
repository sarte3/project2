package kr.co.food.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		return "redirect:/login";
	}
	
	@RequestMapping("/member/login")
	public String login(HttpServletRequest req, Model model)
	{
		model.addAttribute("chk", req.getParameter("chk"));
		return "/member/login";
	}
	
	@RequestMapping("/member/login_ok")
	public String login_ok(HttpServletRequest req, HttpSession session)
	{
		String userid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		int chk = dao.login_ok(userid, pwd);
		
		if(chk==1) 
		{
			session.setAttribute("userid", userid);
			return "redirect:/index";
		}
		else 
		{
			return "redirect:/member/login?chk=1";
		}
		
		
		
	}
	
}

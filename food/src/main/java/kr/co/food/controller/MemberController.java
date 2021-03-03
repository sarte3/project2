package kr.co.food.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
		
		return "redirect:/member/login";
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
	
	@RequestMapping("/member/mypage")
	public String mypage(HttpSession session, Model model)
	{
		String userid="";
		
		try 
		{
			userid=session.getAttribute("userid").toString();
		}
		catch(Exception e) 
		{
			return "redirect:/member/login";
		}
		
		
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		MemberDto dto = dao.getUserInfo(userid);
		
		model.addAttribute("dto", dto);
		
		return "/member/mypage";
		
	}
	
	@RequestMapping("/member/mypage_update")
	public String mypage_update(HttpSession session, Model model)
	{
		String userid="";
		
		try 
		{
			userid=session.getAttribute("userid").toString();
		}
		catch(Exception e) 
		{
			return "redirect:/member/login";
		}
		
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		MemberDto dto = dao.getUserInfo(userid);
		
		model.addAttribute("dto", dto);
		
		return "/member/mypage_update";
	}
	
	@RequestMapping("/member/mypage_update_ok")
	public String mypage_update(HttpSession session, MemberDto dto)
	{
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		dao.mypage_update(dto);
		
		return "redirect:/member/mypage";
	}
	
	
	@RequestMapping("/member/member_out")
	public String member_out(HttpSession session)
	{
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		
		dao.member_out(session.getAttribute("userid").toString());
		
		session.invalidate();
		return "redirect:/index";
	}
}


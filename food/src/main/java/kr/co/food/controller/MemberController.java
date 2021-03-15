package kr.co.food.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.MemberDao;
import kr.co.food.dto.MemberDto;
import kr.co.food.etc.Mail_Send;

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
			MemberDto mdto=dao.getUserInfo(userid);
			session.setAttribute("userid", userid);
			session.setAttribute("name", mdto.getName());
			
			if(userid.equals("admin")) 
			{
				return "redirect:/admin/main";
			}
			else {
				return "redirect:/index";
			}
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
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "redirect:/index";
	}
	
	@RequestMapping("/member/userid_dupcheck")
	public void userid(HttpServletRequest request, PrintWriter out)
	{
		String userid=request.getParameter("userid");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int n=mdao.get_userid_chk(userid);
		out.print(n);
	}
	
	@RequestMapping("/member/email_dupcheck")
	public void email(HttpServletRequest request, PrintWriter out)
	{
		String email=request.getParameter("email");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		int n=mdao.get_email_chk(email);
		out.print(n);
	}
	
	@RequestMapping("/member/userid_search")
	public String userid_search()
	{
		return "/member/userid_search";
	}
	
	@RequestMapping("/member/userid_view")
	public String userid_search_ok(HttpServletRequest request, Model model)
	{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
        String userid=mdao.get_userid(name, email);
        if(userid == null) 
        {
        	model.addAttribute("chk",2);
        }
        else
        {
        	int n=userid.length()-3;
        	String star="";
        	for(int i=1;i<=n;i++)
        		star=star+"*";
        	userid=userid.substring(0,3)+star;
        	model.addAttribute("chk",1);
        	model.addAttribute("userid",userid);
        }
        return "/member/userid_view";
		
	}
	
	@RequestMapping("/member/pwd_search")
	public String pwd_search()
	{
		return "/member/pwd_search";
	}
	
	@RequestMapping("/member/pwd_view")
	public String pwd_view(MemberDto mdto, Model model) throws Exception
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String pwd=mdao.get_pwd(mdto.getUserid(),mdto.getName(),mdto.getEmail());
		
		if(pwd == null)		
		{
			model.addAttribute("chk",2);
		}
		else 
		{
			Mail_Send ms=Mail_Send.getInstance();
			String email=mdto.getEmail();
			String subject="요청하신 고객님의 이메일을 보내드립니다";
			String body="당신의 비밀번호는 "+pwd+" 입니다";
			ms.setEmail(email, subject, body);
			model.addAttribute("chk",1);
		}
		
		return "/member/pwd_view";
	}
}


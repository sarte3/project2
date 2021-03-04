package kr.co.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.AdminDao;
import kr.co.food.dao.MemberDao;
import kr.co.food.dto.FoodDto;
import kr.co.food.dto.MemberDto;
import kr.co.food.dto.NoticeDto;
import kr.co.food.dto.NutrionDto;
import kr.co.food.dto.TrendDto;

@Controller
public class AdminController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/admin/main")
	public String main(Model model) 
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		
		int food=dao.getFoodCnt();
		int user=dao.getUserCnt();
		int recipe=dao.getRecipeCnt();
		int trend=dao.getTrendCnt();
		
		model.addAttribute("food", food);
		model.addAttribute("user", user);
		model.addAttribute("recipe", recipe);
		model.addAttribute("trend", trend);
		
		model.addAttribute("flist", dao.getFood5());
		model.addAttribute("ulist", dao.getUser5());
		model.addAttribute("tlist", dao.getTrend5());
		model.addAttribute("rlist", dao.getRecipe5());
		
		return "/admin/main";
	}
	
	
	@RequestMapping("/admin/notice_list")
	public String notice_list(Model model, HttpServletRequest req)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int page,index;
		if(req.getParameter("page")==null)
		{
			index=0;
			page=1;
		}
		else
		{
			page=Integer.parseInt(req.getParameter("page"));
			index=(page-1)*10;
		}

		int pstart=page/10;
		if(page%10 ==0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;

		int chong=dao.getNoticeCnt();
		int page_cnt=chong/10;
		
		if(chong%10 !=0)
			page_cnt++;
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		ArrayList<NoticeDto> list=dao.getNoticeList(index);
		model.addAttribute("list",list);
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);

		return "/admin/notice_list";
	}
	
	@RequestMapping("/admin/notice_write")
	public String notice_write()
	{
		return "/admin/notice_write";
	}
	
	@RequestMapping("/admin/notice_write_ok")
	public String notice_write_ok(NoticeDto dto)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.noticeWrite(dto);
		
		return "redirect:/admin/notice_list";
	}
	
	@RequestMapping("/admin/notice_content")
	public String notice_content(HttpServletRequest req, Model model)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		NoticeDto dto = dao.noticeContent(req.getParameter("notice_id"));
		
		model.addAttribute("dto", dto);
		return "/admin/notice_content";
	}
	
	@RequestMapping("/admin/notice_update")
	public String notice_update(HttpServletRequest req, Model model)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		NoticeDto dto = dao.noticeContent(req.getParameter("notice_id"));
		
		model.addAttribute("dto", dto);
		return "/admin/notice_update";
	}
	
	@RequestMapping("/admin/notice_update_ok")
	public String notice_update_ok(NoticeDto dto)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.noticeUpdate(dto);
		
		return "redirect:/admin/notice_content?notice_id="+dto.getNotice_id();
	}
	
	@RequestMapping("/admin/notice_delete")
	public String notice_delete(HttpServletRequest req)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.noticeDelete(req.getParameter("notice_id"));
		
		return "redirect:/admin/notice_list";
	}
	
	@RequestMapping("/admin/member_list")
	public String member_list(Model model, HttpServletRequest req)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int page,index;
		if(req.getParameter("page")==null)
		{
			index=0;
			page=1;
		}
		else
		{
			page=Integer.parseInt(req.getParameter("page"));
			index=(page-1)*10;
		}

		int pstart=page/10;
		if(page%10 ==0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;

		int chong=dao.getUserCnt();
		int page_cnt=chong/10;//페이지의 갯수
		
		if(chong%10 !=0)
			page_cnt++;
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		ArrayList<MemberDto> list=dao.getUserList(index);
		model.addAttribute("list",list);
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
		
		return "/admin/member_list";
	}
	
	@RequestMapping("/admin/member_out")
	public String member_out(HttpServletRequest req)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.memberOut(req.getParameter("member_id"));
		
		return "redirect:/admin/member_list";
	}
	
	@RequestMapping("/admin/member_write")
	public String member_write()
	{
		return "/admin/member_write";
	}
	
	@RequestMapping("/admin/member_ok")
	public String member_ok(MemberDto dto)
	{
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		dao.join(dto);
		
		return "redirect:/admin/member_list";
	}
	
	@RequestMapping("/admin/trend_list")
	public String trend_list(Model model, HttpServletRequest req)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int page,index;
		if(req.getParameter("page")==null)
		{
			index=0;
			page=1;
		}
		else
		{
			page=Integer.parseInt(req.getParameter("page"));
			index=(page-1)*10;
		}

		int pstart=page/10;
		if(page%10 ==0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;

		int chong=dao.getTrendCnt();
		int page_cnt=chong/10;
		
		if(chong%10 !=0)
			page_cnt++;
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		ArrayList<TrendDto> list=dao.getTrendList(index);
		model.addAttribute("list",list);
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
				
		return "/admin/trend_list";
	}
	
	@RequestMapping("/admin/trend_write")
	public String trend_write()
	{
		return "/admin/trend_write";
	}
	
	@RequestMapping("/admin/trend_write_ok")
	public String trend_write_ok(TrendDto dto)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.trendWrite(dto);
		
		return "redirect:/admin/trend_list";
	}
	
	@RequestMapping("/admin/trend_update")
	public String trend_update(HttpServletRequest req, Model model) 
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		TrendDto dto = dao.trendContent(req.getParameter("trend_id"));
		
		model.addAttribute("dto", dto);
		
		return "/admin/trend_update";
	}
	
	@RequestMapping("/admin/trend_update_ok")
	public String trend_update_ok(TrendDto dto)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.trendUpdate(dto);
		
		return "redirect:/admin/trend_list";
	}
	
	@RequestMapping("/admin/trend_delete")
	public String trend_delete(HttpServletRequest req)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.trendDelete(req.getParameter("trend_id"));
		
		return "redirect:/admin/trend_list";
	}
	

	@RequestMapping("/admin/food_list")
	public String food_list(Model model,HttpServletRequest request)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		int page,index;
		if(request.getParameter("page")==null)
		{
			index=0;
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
			index=(page-1)*10;
		}

		int pstart=page/10;
		if(page%10 ==0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;

		int chong=dao.getFoodCnt();
		int page_cnt=chong/10;//페이지의 갯수
		
		if(chong%10 !=0)
			page_cnt++;
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		ArrayList<NutrionDto> list=dao.getFoodList(index);
		model.addAttribute("list",list);
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
		
		return "/admin/food_list";
	}
	
	@RequestMapping("/admin/food_write")
	public String food_write()
	{
		return "/admin/food_write";
	}
	
	@RequestMapping("/admin/food_write_ok")
	public String food_write_ok(NutrionDto dto)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.foodWrite(dto);
		
		return "redirect:/admin/food_list";
	}
	
	@RequestMapping("/admin/food_update")
	public String food_update(HttpServletRequest req, Model model) 
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		NutrionDto dto = dao.foodContent(req.getParameter("food_no"));
		
		model.addAttribute("dto", dto);
		
		return "/admin/food_update";
	}
	
	@RequestMapping("/admin/food_update_ok")
	public String food_update_ok(NutrionDto dto)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.foodUpdate(dto);
		
		return "redirect:/admin/food_list";
	}
	
	@RequestMapping("/admin/food_delete")
	public String food_delete(HttpServletRequest req)
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		dao.foodDelete(req.getParameter("food_no"));
		
		return "redirect:/admin/food_list";
	}
	

}

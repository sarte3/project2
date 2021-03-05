package kr.co.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.AdminDao;
import kr.co.food.dao.TrendDao;
import kr.co.food.dto.NoticeDto;
import kr.co.food.dto.TrendDto;


@Controller
public class TrendController 
{
	@Autowired
	public SqlSession sqlSession;

	@RequestMapping("/trend/trend_list")
	public String list(Model model) 
	{
		TrendDao dao=sqlSession.getMapper(TrendDao.class);
		ArrayList<TrendDto> list=dao.getList();
		model.addAttribute("list", list);
		
		return "/trend/trend_list";
	}
	
	@RequestMapping("/trend/trend_all_list")
	public String trend_list(Model model, HttpServletRequest req)
	{
		TrendDao dao = sqlSession.getMapper(TrendDao.class);
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

		String sword=req.getParameter("sword");
		if(sword==null)sword="";
		
		int chong=dao.getTrendCnt(sword);
		int page_cnt=chong/10;
		
		
		if(chong%10 !=0)
			page_cnt++;
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		ArrayList<TrendDto> list=dao.getTrendList(sword, index);
		model.addAttribute("list",list);
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("sword",sword);
		
		
		return "/trend/trend_all_list";
	}
	
}

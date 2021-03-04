package kr.co.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.NutrionDao;
import kr.co.food.dto.NutrionDto;


@Controller
public class NutrionController {

	@Autowired
	public SqlSession sqlSession;
	

	@RequestMapping("/nutrition/list")
	public String list(Model model,HttpServletRequest request)
	{
		NutrionDao ndao=sqlSession.getMapper(NutrionDao.class);
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
		int chong=ndao.get_record_cnt();
		int page_cnt=chong/10;//페이지의 갯수
		
		if(chong%10 !=0)
			page_cnt++;
		if(pend>page_cnt)
			pend=page_cnt;
		
		String sear;
		String sword;
		if(request.getParameter("sear")==null)
		{	
			sear="food_name";
			sword="";
			ArrayList<NutrionDto> list=ndao.list(index);
			model.addAttribute("list",list);
		}
		else
		{
			sear=request.getParameter("sear");
			sword=request.getParameter("sword");
			model.addAttribute("list",ndao.slist(sear,sword,index));
			return "/nutrition/list";
		}
		model.addAttribute("sear",sear);
		model.addAttribute("sword",sword);
		 
		//총페이지를 쿼리에서 만들어서 가져오기
		model.addAttribute("page_cnt2",ndao.get_page_cnt());	
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
		return "/nutrition/list";
	}
	@RequestMapping("/nutrition/n_view")
	public String n_view(Model model,HttpServletRequest request) {
		String food_code=request.getParameter("food_code");
		NutrionDao ndao=sqlSession.getMapper(NutrionDao.class);
		ndao.n_view(food_code);
		NutrionDto ndto=ndao.n_view(food_code);
		model.addAttribute("ndto",ndto);
		return "/nutrition/n_view";
	}
}

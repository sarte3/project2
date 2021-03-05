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
	public String trend_list(Model model, HttpServletRequest req)
	{
		NutrionDao ndao = sqlSession.getMapper(NutrionDao.class);
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
		
		int chong=ndao.getCnt(sword);
		int page_cnt=chong/10;
		
		
		if(chong%10 !=0)
			page_cnt++;
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		ArrayList<NutrionDto> list=ndao.list(sword, index);
		model.addAttribute("list",list);
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("sword",sword);
		
		
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

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
		//list메소드에 보낼 index값을 구해야 된다.
		//사용자가 원하는 페이지에 따라 index값은 바뀐다.
		//1페이지=> 0~9 , 2페이지=> 10~19
		int page,index;
		String sear;
		String sword;
		if(request.getParameter("sear")==null)
		{	
			sear="food_name";
			sword="";
		}
		else
		{
			sear=request.getParameter("sear");
			sword=request.getParameter("sword");
		}
		model.addAttribute("list",ndao.slist(sear,sword));
		model.addAttribute("sear",sear);
		model.addAttribute("sword",sword);
		 
		
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
		//pstart,pend구하기 =>사용자가 클릭하는 부분
		int pstart=page/10;
		if(page%10 ==0)
			pstart=pstart-1;
		pstart=(pstart*10)+1;
		int pend=pstart+9;
		
		//view에 사용자가 원하는 페이
		//1페이지 혹은 10페이지 단위의
		
		//총페이지수를 구해서 전달=>마지막페이지
		int chong=ndao.get_record_cnt();
		int page_cnt=chong/10;//페이지의 갯수
		
		if(chong%10 !=0)
			page_cnt++;
		
		//pend(총 출력되는값) 값이 총 페이지보다 크다면 pend값을 총(마지막)페이지로 해야한다.
		if(pend>page_cnt)
			pend=page_cnt;
		
		//총페이지를 쿼리에서 만들어서 가져오기
		model.addAttribute("page_cnt2",ndao.get_page_cnt());
		
		ArrayList<NutrionDto> list=ndao.list(index);
		model.addAttribute("list",list);
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

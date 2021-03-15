package kr.co.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.PriceDao;
import kr.co.food.dto.PriceDto;


@Controller
public class PriceController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/price/price_chart")
	public String price_chart(Model model)
	{
		PriceDao pdao=sqlSession.getMapper(PriceDao.class);
		ArrayList<PriceDto> plist=pdao.getBottom5();
		model.addAttribute("plist", plist);
		
		ArrayList<PriceDto> plist2=pdao.getTop5();
		model.addAttribute("plist2",plist2);
		
		ArrayList foodlist=new ArrayList();
		for(int i=0;i<plist.size();i++) {
			String foodname=plist.get(i).getFood_name();
			foodlist.add(foodname);
		}
		//System.out.println(foodlist);
		ArrayList<PriceDto> food1=pdao.getPrice(foodlist.get(0).toString());
		model.addAttribute("food1",food1);
		ArrayList<PriceDto> food2=pdao.getPrice(foodlist.get(1).toString());
		model.addAttribute("food2",food2);
		ArrayList<PriceDto> food3=pdao.getPrice(foodlist.get(2).toString());
		model.addAttribute("food3",food3);
		ArrayList<PriceDto> food4=pdao.getPrice(foodlist.get(3).toString());
		model.addAttribute("food4",food4);
		ArrayList<PriceDto> food5=pdao.getPrice(foodlist.get(4).toString());
		model.addAttribute("food5",food5);
		
		return "/price/price_chart";
	}
	@RequestMapping("/price/price_list")
	public String price_list(Model model, HttpServletRequest req)
	{
		PriceDao pdao=sqlSession.getMapper(PriceDao.class);
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
		
		int chong=pdao.getPriceCnt(sword);
		int page_cnt=chong/10;
		
		
		if(chong%10 !=0)
			page_cnt++;
		
		if(pend>page_cnt)
			pend=page_cnt;
		
		ArrayList<PriceDto> plist=pdao.getAllPriceList(sword, index);
		model.addAttribute("plist",plist);
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("sword",sword);
		return "/price/price_list";
	}
	@RequestMapping("/price/one_price")
	public String one_price(Model model,HttpServletRequest request)
	{
		String food_name=request.getParameter("food_name");
		PriceDao pdao=sqlSession.getMapper(PriceDao.class);
		ArrayList<PriceDto> food=pdao.getPrice(food_name);
		model.addAttribute("food",food);		
		return "/price/one_price";
	}
}

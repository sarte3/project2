package kr.co.food.controller;

import java.util.ArrayList;

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
		ArrayList<PriceDto> plist=pdao.getTop5();
		model.addAttribute("plist", plist);
		
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
}

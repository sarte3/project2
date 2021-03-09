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
		ArrayList<PriceDto> list=pdao.getTop5();
		model.addAttribute("list", list);
		
		return "/price/price_chart";
	}
}

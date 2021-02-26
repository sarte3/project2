package kr.co.food.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.TrendDao;
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
	
}

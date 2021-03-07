package kr.co.food.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.DietDao;
import kr.co.food.dto.PeopleDto;

@Controller
public class DietController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/diet/reco_index")
	public String reco_index(Model model) {
		DietDao ddao = sqlSession.getMapper(DietDao.class);
		PeopleDto pdto = ddao.get_people_nut(3);
		model.addAttribute("pdto", pdto);
		
		return "/diet/reco_index";
	}
	
}

package kr.co.food.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.DietDao;
import kr.co.food.dto.FoodDto;
import kr.co.food.dto.PeopleDto;
import kr.co.food.etc.DietMaker;

@Controller
public class DietController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/diet/reco_index")
	public String reco_index(Model model) {

		return "/diet/reco_index";
	}
	@RequestMapping("/diet/reco_view")
	public String get_nut_list(HttpServletRequest request, Model model) {
		//사람 아이디 받아 필요 열량소 넘기는 영역
		int nut_id = Integer.parseInt(request.getParameter("nut_id"));
		DietDao ddao = sqlSession.getMapper(DietDao.class);
		PeopleDto pdto = ddao.get_people_nut(nut_id);
		model.addAttribute("pdto", pdto);	
		
		ArrayList<ArrayList<FoodDto>> food_list = DietMaker.get_100_foods(ddao);
		model.addAttribute("food_list", food_list);
		
		return "/diet/reco_view";
	}
		
	
	
	
}

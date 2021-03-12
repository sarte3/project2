package kr.co.food.controller;

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
import kr.co.food.etc.DietMakerSecond;
import kr.co.food.etc.People;

@Controller
public class DietController {
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/diet/reco_index")
	public String reco_index(Model model) {
		
		return "/diet/reco_index";
	}
	@RequestMapping("/diet/test")
	public String test(Model model) {
		
		return "/diet/test";
	}
	@RequestMapping("/diet/reco_view")
	public String reco_view(HttpServletRequest request, Model model) {
		int nut_id = Integer.parseInt(request.getParameter("nut_id"));
		DietDao ddao = sqlSession.getMapper(DietDao.class);
		PeopleDto pdto = ddao.get_people_nut(nut_id);
		People people_tot = new People(pdto, 1.0);
		model.addAttribute("pdto", pdto);
		model.addAttribute("nut_lb",people_tot.nut_lb);
		model.addAttribute("nut_ia",people_tot.nut_ia);
		model.addAttribute("nut_ub",people_tot.nut_ub);
		model.addAttribute("nut_list",DietMakerSecond.nut_list);
		  
		People people_A = new People(pdto, 0.3);
		DietMakerSecond dm1 = new DietMakerSecond();
		ArrayList<FoodDto> mealsA = dm1.get_meal(people_A, ddao);
		for (int i=0; i<6; i++) {
			model.addAttribute("meal_A"+(i+1)+"_name",mealsA.get(i).getFood_name());
			model.addAttribute("meal_A"+(i+1)+"_cate",mealsA.get(i).getFood_cate3());
			model.addAttribute("meal_A"+(i+1), DietMaker.transFdtoToDouble(mealsA, i));
		}
		
		People people_B = new People(pdto, 0.4);
		DietMakerSecond dm2 = new DietMakerSecond();
		ArrayList<FoodDto> mealsB = dm2.get_meal(people_B, ddao);
		for (int i=0; i<6; i++) {
			model.addAttribute("meal_B"+(i+1)+"_name",mealsB.get(i).getFood_name());
			model.addAttribute("meal_B"+(i+1)+"_cate",mealsB.get(i).getFood_cate3());
			model.addAttribute("meal_B"+(i+1), DietMaker.transFdtoToDouble(mealsB, i));
		}
		
		People people_C = new People(pdto, 0.3);
		DietMakerSecond dm3 = new DietMakerSecond();
		ArrayList<FoodDto> mealsC = dm3.get_meal(people_C, ddao);
		for (int i=0; i<6; i++) {
			model.addAttribute("meal_C"+(i+1)+"_name",mealsC.get(i).getFood_name());
			model.addAttribute("meal_C"+(i+1)+"_cate",mealsC.get(i).getFood_cate3());
			model.addAttribute("meal_C"+(i+1), DietMaker.transFdtoToDouble(mealsC, i));
		}
		return "/diet/reco_view";
	}
	
}

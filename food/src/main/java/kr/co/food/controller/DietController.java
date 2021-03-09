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
import kr.co.food.etc.Meal;

@Controller
public class DietController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/diet/reco_index")
	public String reco_index(Model model) {

		return "/diet/reco_index";
	}
	@RequestMapping("/diet/reco_view")
	public String reco_view(HttpServletRequest request, Model model) {
		// 사람 아이디 받아 필요 열량소 넘기는 영역
		int nut_id = Integer.parseInt(request.getParameter("nut_id"));
		int percent = Integer.parseInt(request.getParameter("percent"));
		DietDao ddao = sqlSession.getMapper(DietDao.class);
		PeopleDto pdto = ddao.get_people_nut(nut_id);
		
		pdto = DietMaker.divideByPercent(pdto, percent);
		
		model.addAttribute("pdto", pdto);	
		
		// 카테고리 6개의 음식 리스트 각각 100개를 3차원 리스트로 반환하는 영역
		ArrayList<ArrayList<FoodDto>> food_list = DietMaker.get_100_foods(ddao);
		model.addAttribute("food_list", food_list);
		
		// pdto에 따라 영양소 lb, ia, ub로 분할하여 반환하는 영역
		model.addAttribute("nut_lb", DietMaker.get_nut_lb(pdto));
		model.addAttribute("nut_ia", DietMaker.get_nut_ia(pdto));
		model.addAttribute("nut_ub", DietMaker.get_nut_ub(pdto));
		model.addAttribute("nut_list", DietMaker.nut_list);
		
		// 영양소 인덱스, 현재카테고리 배열을 입력받아 가장 높은 값의 음식과 카테고리 인덱스 반환
		ArrayList<FoodDto> meals = DietMaker.get_meal(ddao, pdto);
		model.addAttribute("meals",meals);
		for (int i=0; i<6; i++) {
			model.addAttribute("meal_"+(i+1)+"_name",meals.get(i).getFood_name());
			model.addAttribute("meal_"+(i+1)+"_cate",meals.get(i).getFood_cate3());
			model.addAttribute("meal_"+(i+1), DietMaker.transFdtoToDouble(meals, i));
		}

		return "/diet/reco_view";
	}
		
	
	
	
}

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
		model.addAttribute("meal_1_name",meals.get(0).getFood_name());
		model.addAttribute("meal_2_name",meals.get(1).getFood_name());
		model.addAttribute("meal_3_name",meals.get(2).getFood_name());
		model.addAttribute("meal_4_name",meals.get(3).getFood_name());
		model.addAttribute("meal_5_name",meals.get(4).getFood_name());
		model.addAttribute("meal_6_name",meals.get(5).getFood_name());
		
		model.addAttribute("meal_1_cate",meals.get(0).getFood_cate3());
		model.addAttribute("meal_2_cate",meals.get(1).getFood_cate3());
		model.addAttribute("meal_3_cate",meals.get(2).getFood_cate3());
		model.addAttribute("meal_4_cate",meals.get(3).getFood_cate3());
		model.addAttribute("meal_5_cate",meals.get(4).getFood_cate3());
		model.addAttribute("meal_6_cate",meals.get(5).getFood_cate3());
		//DietMaker.getFoodNutByIndex();
		
	
		Double[] meal_1 = new Double[27];
		Double[] meal_2 = new Double[27];
		Double[] meal_3 = new Double[27];
		Double[] meal_4 = new Double[27];
		Double[] meal_5 = new Double[27];
		Double[] meal_6 = new Double[27];	
		for (int i=0; i < 27; i++) {
			meal_1[i] = Math.round(DietMaker.getFoodNutByIndex(meals.get(0), i)*100)/100.0;
		}
		for (int i=0; i < 27; i++) {
			meal_2[i] = Math.round(DietMaker.getFoodNutByIndex(meals.get(1), i)*100)/100.0;
		}
		for (int i=0; i < 27; i++) {
			meal_3[i] = Math.round(DietMaker.getFoodNutByIndex(meals.get(2), i)*100)/100.0;
		}
		for (int i=0; i < 27; i++) {
			meal_4[i] = Math.round(DietMaker.getFoodNutByIndex(meals.get(3), i)*100)/100.0;
		}
		for (int i=0; i < 27; i++) {
			meal_5[i] = Math.round(DietMaker.getFoodNutByIndex(meals.get(4), i)*100)/100.0;
		}
		for (int i=0; i < 27; i++) {
			meal_6[i] = Math.round(DietMaker.getFoodNutByIndex(meals.get(5), i)*100)/100.0;
		}
		model.addAttribute("meal_1",meal_1);
		model.addAttribute("meal_2",meal_2);
		model.addAttribute("meal_3",meal_3);
		model.addAttribute("meal_4",meal_4);
		model.addAttribute("meal_5",meal_5);
		model.addAttribute("meal_6",meal_6);
		
		return "/diet/reco_view";
	}
		
	
	
	
}

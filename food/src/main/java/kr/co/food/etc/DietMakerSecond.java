package kr.co.food.etc;

import java.util.ArrayList;
import java.util.Arrays;

import kr.co.food.dao.DietDao;
import kr.co.food.dto.FoodDto;
import kr.co.food.dto.PeopleDto;

public class DietMakerSecond {
	public static String[] nut_list = {"칼로리","탄수화물","식이섬유","지방","리놀레산","a-리놀레산","단백질",
            "비타민A","비타민D","비타민E","비타민K","비타민C","티아민",
            "리보플라빈","비타민B6","엽산","비타민B12","판토텐산","비오틴",
            "칼슘","인","나트륨","칼륨","마그네슘","철","아연","구리"};
	public static Boolean[] cur_cate = {false,false,false,false,false,false};
	public static double[] cur_nut;
	public static int[] cnt_rejection;
	public static ArrayList<ArrayList<FoodDto>> food_list = new ArrayList<ArrayList<FoodDto>>(6);;
	public static int cate_idx;
	public static ArrayList<FoodDto> meals = new ArrayList<FoodDto>(6);
	
	public DietMakerSecond() {
		Arrays.fill(this.cur_cate, false);
		this.cur_nut = new double[27];
		this.cnt_rejection = new int[27];
		this.food_list = new ArrayList<ArrayList<FoodDto>>(6);
		this.cate_idx = 0;
		this.meals = new ArrayList<FoodDto>(6);
	}
	
	public static ArrayList<FoodDto> get_meal(People people,DietDao ddao){
		food_list = get_100_foods(ddao);
		int i = 0;
		while(true) {
			if (i==10000) break;
//			if (i % 100 == 0) {
//				cur_cate = new Boolean[6];
//				Arrays.fill(cur_cate, false);
//				cur_nut = new double[27];
//				cnt_rejection = new int[27];
//				food_list = get_100_foods(ddao);
//				cate_idx = 0;
//				meals = new ArrayList<FoodDto>();
//			}
			if(is_finish()) {
				out_meal();
				break;
			}
			check_nut(people.nut_lb, cur_nut, people.nut_ub, ddao);
			i += 1;
			System.out.println(i+"번try++++++++++++++++++++++++++++++");
		}
		return meals;
	}
	
	public static void out_meal() {
		System.out.println("=================오늘의 식단=================");
		for (FoodDto fdto: meals) {
			System.out.println(fdto.getFood_cate3()+" "+fdto.getFood_name());
		}
	}
	
	public static boolean is_finish() {
		for (boolean b : cur_cate) {
			if (b==false) {
				return false;
			}
		}
		return true;
	}
	
	public static boolean check_nut(double[] nut_lb, double[] cur_nut, double[] nut_ub, DietDao ddao) {
		for (int i=0; i<nut_lb.length; i++) {
			if(cur_nut[i]>= nut_lb[i]) {
				continue;
			}
			FoodDto food = get_food(i, ddao);
			//System.out.println("후보음식: "+ food.getFood_name());
			if(is_under_ub(nut_ub, food)) {
				System.out.println("영양성분 만족 ====>"+food.getFood_name()+food.getFood_cate3());
				add_food(food, ddao);
				return true;
			} else if(meals.size()==0) {
				del_from_foodlist(food, cate_idx, ddao);
			}
			
		}
		return false;
		
	}
	
	public static void del_from_foodlist(FoodDto fdto, int cate_idx, DietDao ddao) {
		food_list.get(cate_idx).remove(fdto);
		if(food_list.get(cate_idx).size()<10) {
			food_list = get_100_foods(ddao);
		}
	}
	
	
	public static void add_food(FoodDto fdto, DietDao ddao) {
		for (int i=0; i<cur_nut.length; i++) {
			cur_nut[i] += getFoodNutByIndex(fdto,i);
		}
		meals.add(fdto);
		cur_cate[cate_idx] = true;
		food_list.get(cate_idx).remove(fdto);
		if(food_list.get(cate_idx).size()<10) {
			food_list = get_100_foods(ddao);
		}
	}
	
	
	
	public static boolean is_under_ub(double[] nut_ub, FoodDto fdto) {
		boolean status = true;
		for(int i=0; i<cur_nut.length; i++) {
			if(nut_ub[i] < 1.0) {
				continue;
			}
			if(cur_nut[i]+getFoodNutByIndex(fdto,i)>nut_ub[i]) {
				add_rejection(i);
				System.out.println(nut_list[i]+"초과 ===> "+(cnt_rejection[i])+"회 거절");
				status = false;
			}
		}
		return status;
	}
	public static void add_rejection(int nut_idx) {
		cnt_rejection[nut_idx] += 1;
		if(cnt_rejection[nut_idx]==4) {
			if(meals.size()==0) {
				cnt_rejection = new int[27];
				return;
			}
			double max_value = 0.0;
			int max_idx = 0;
			for (int i=0; i< meals.size(); i++) {
				if (getFoodNutByIndex(meals.get(i), nut_idx) > max_value) {
					max_value = getFoodNutByIndex(meals.get(i), nut_idx);
					max_idx = i;
				}
			}
			FoodDto topfood = meals.get(max_idx);
			meals.remove(topfood);
			for (int i=0; i<cur_nut.length; i++) {
				cur_nut[i] -= getFoodNutByIndex(topfood,i);
			}
			String[] food_cates = {"반찬1","주식","국물","반찬2","반찬3","부식"};
			int cate_idx = 0;
			for (String cate : food_cates) {
				if (cate.equals(topfood.getFood_cate3())) {
					break;
				}
				cate_idx += 1;
			}
			cur_cate[cate_idx] = false;
			cnt_rejection[nut_idx] = 0;
			System.out.println(nut_list[nut_idx]+", 4회초과=> <"+topfood.getFood_name()+"> 삭제");
//			for (int i=0; i<cur_nut.length; i++) {
//				System.out.println(cur_nut[i]);
//			}
//			
			
		}
		
		
	}
	
	public static FoodDto get_food(int nut_idx, DietDao ddao) {
		ArrayList<FoodDto> cate3 = new ArrayList<FoodDto>();
		for (int i=0; i < cur_cate.length; i++) {
			if(cur_cate[i]) {
				continue;
			} else {
				cate3 = food_list.get(i);
				cate_idx = i;
				break;
			}
		}
		double max_value = 0.0;
		int max_i = 0;
		for (int i=0; i< cate3.size(); i++) {
			if (getFoodNutByIndex(cate3.get(i), nut_idx) > max_value) {
				max_value = getFoodNutByIndex(cate3.get(i), nut_idx);
				max_i = i;
			}
		}

//		System.out.println(cate3.size());
		return cate3.get(max_i);
	}
	
	public static double getFoodNutByIndex(FoodDto fdto, int idx) {
		switch(idx) {
		case 0: return fdto.getFood_energy();
		case 1: return fdto.getFood_carbo();
		case 2: return fdto.getFood_fiber();
		case 3: return fdto.getFood_lipid();
		case 4: return fdto.getFood_linoleic_acid();
		case 5: return fdto.getFood_a_linoleic_acid();
		case 6: return fdto.getFood_pro();
		case 7: return fdto.getFood_vitA();
		case 8: return fdto.getFood_vitD();
		case 9: return fdto.getFood_vitE();
		case 10: return fdto.getFood_vitK();
		case 11: return fdto.getFood_vitC();
		case 12: return fdto.getFood_thia();
		case 13: return fdto.getFood_ribo();
		case 14: return fdto.getFood_vitB6();
		case 15: return fdto.getFood_folic();
		case 16: return fdto.getFood_vitB12();
		case 17: return fdto.getFood_panto();
		case 18: return fdto.getFood_bio();
		case 19: return fdto.getFood_ca();
		case 20: return fdto.getFood_p();
		case 21: return fdto.getFood_na();
		case 22: return fdto.getFood_k();
		case 23: return fdto.getFood_mg();
		case 24: return fdto.getFood_fe();
		case 25: return fdto.getFood_zn();
		case 26: return fdto.getFood_cu();
		default:
			return 0.0;
		}
	}
	
	
	public static ArrayList<ArrayList<FoodDto>> get_100_foods(DietDao ddao){
		ArrayList<FoodDto> cate1 = ddao.get_100_foods("반찬1");
		ArrayList<FoodDto> cate2 = ddao.get_100_foods("주식");
		ArrayList<FoodDto> cate3 = ddao.get_100_foods("국물");
		ArrayList<FoodDto> cate4 = ddao.get_100_foods("반찬2");
		ArrayList<FoodDto> cate5 = ddao.get_100_foods("반찬3");
		ArrayList<FoodDto> cate6 = ddao.get_100_foods("부식");
		ArrayList<ArrayList<FoodDto>> food_list = new ArrayList<ArrayList<FoodDto>>();
		food_list.add(cate1);
		food_list.add(cate2);
		food_list.add(cate3);
		food_list.add(cate4);
		food_list.add(cate5);
		food_list.add(cate6);
		return food_list;
	}

}

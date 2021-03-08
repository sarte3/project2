package kr.co.food.etc;

import java.util.ArrayList;


import kr.co.food.dao.DietDao;
import kr.co.food.dto.FoodDto;
import kr.co.food.dto.PeopleDto;

public class DietMaker {
	public static String[] nut_list = {"칼로리","탄수화물","식이섬유","지방","리놀레산","a-리놀레산","단백질",
            "비타민A","비타민D","비타민E","비타민K","비타민C","티아민",
            "리보플라빈","비타민B6","엽산","비타민B12","판토텐산","비오틴",
            "칼슘","인","나트륨","칼륨","마그네슘","철","아연","구리"};
	
	public static void main(String[] args) {
		
		
	}
	
	public static void get_meal(DietDao ddao) {
		Meal meal = new Meal();
		meal.food_list = get_100_foods(ddao);
		get_food(meal, 1);
		
		
	}
	
	public static FoodDto get_food(Meal meal, int nut_idx) {
		Boolean[] cur_cate = meal.cur_cate;
		int cate_idx = -1;
		ArrayList<FoodDto> temp = new ArrayList<FoodDto>();
		for (int i=0; i < cur_cate.length; i++) {
			if(cur_cate[i]) {
				continue;
			} else {
				temp = meal.food_list.get(i);
				cate_idx = i;
				break;
			}
		}
		int max_value = -1;
		int max_idx = -1;
		for (int i=0; i< temp.size(); i++) {
			if (getFoodNutByIndex(temp.get(i), nut_idx) > max_value) {
				max_idx = i;
			}
		}
		return temp.get(max_idx);
		
		
		
	
		
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
		
	public static double[] get_nut_lb(PeopleDto pdto) {
		double[] nut_lb = {pdto.getEnergy()*0.9,
				pdto.getCarbo_LB(), pdto.getFiber_LB(), pdto.getLipid_LB(),
				pdto.getLinoleic_acid_LB(), pdto.getA_linoleic_acid_LB(),
				pdto.getPro_LB(), pdto.getVitA_LB(), pdto.getVitD_LB(),
				pdto.getVitE_LB(), pdto.getVitK_LB(), pdto.getVitC_LB(),
				pdto.getThia_LB(), pdto.getRibo_LB(), pdto.getVitB6_LB(),
				pdto.getFolic_LB(), pdto.getVitB12_LB(), pdto.getPanto_LB(),
				pdto.getBio_LB(), pdto.getCa_LB(), pdto.getP_LB(),
				pdto.getNa_LB(), pdto.getK_LB(), pdto.getMg_LB(), 
				pdto.getFe_LB(), pdto.getZn_LB(), pdto.getCu_LB()};
		return nut_lb;
	}
	public static double[] get_nut_ia(PeopleDto pdto) {
		double[] nut_ia = {pdto.getEnergy()*1.0,
		        pdto.getCarbo_IA(), pdto.getFiber_IA(), pdto.getLipid_IA(),
		        pdto.getLinoleic_acid_IA(), pdto.getA_linoleic_acid_IA(),
		        pdto.getPro_IA(), pdto.getVitA_IA(), pdto.getVitD_IA(),
		        pdto.getVitE_IA(), pdto.getVitK_IA(), pdto.getVitC_IA(),
		        pdto.getThia_IA(), pdto.getRibo_IA(), pdto.getVitB6_IA(),
		        pdto.getFolic_IA(), pdto.getVitB12_IA(), pdto.getPanto_IA(),
		        pdto.getBio_IA(), pdto.getCa_IA(), pdto.getP_IA(),
		        pdto.getNa_IA(), pdto.getK_IA(), pdto.getMg_IA(), 
		        pdto.getFe_IA(), pdto.getZn_IA(), pdto.getCu_IA()};
		return nut_ia;
	}
	public static double[] get_nut_ub(PeopleDto pdto) {
		double[] nut_ub = {pdto.getEnergy()*1.1,
		        pdto.getCarbo_UB(), pdto.getFiber_UB(), pdto.getLipid_UB(),
		        pdto.getLinoleic_acid_UB(), pdto.getA_linoleic_acid_UB(),
		        pdto.getPro_UB(), pdto.getVitA_UB(), pdto.getVitD_UB(),
		        pdto.getVitE_UB(), pdto.getVitK_UB(), pdto.getVitC_UB(),
		        pdto.getThia_UB(), pdto.getRibo_UB(), pdto.getVitB6_UB(),
		        pdto.getFolic_UB(), pdto.getVitB12_UB(), pdto.getPanto_UB(),
		        pdto.getBio_UB(), pdto.getCa_UB(), pdto.getP_UB(),
		        pdto.getNa_UB(), pdto.getK_UB(), pdto.getMg_UB(), 
		        pdto.getFe_UB(), pdto.getZn_UB(), pdto.getCu_UB()};
		return nut_ub;
	}
	
}

package kr.co.food.etc;

import java.util.ArrayList;
import java.util.Arrays;

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
	
	public static ArrayList<FoodDto> get_meal(DietDao ddao, PeopleDto pdto) {
		Meal meal = new Meal();
		double[] nut_lb = get_nut_lb(pdto);
		double[] nut_ub = get_nut_ub(pdto);
		meal.food_list = get_100_foods(ddao);
		int i = 0;
		while (true) {
			if (i==10000000) {
				break;
			}

			if (i % 10 == 0) {
				meal.meals = new ArrayList<FoodDto>();
				meal.cur_nut = new double[27];
				meal.cnt_rejection = new int[27];
				meal.cur_cate = new Boolean[6];
				Arrays.fill(meal.cur_cate, false);
				//System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+i);
			}
			if (is_finish(meal)) {
				out_meal(meal);
				break;
			}
			check_nut(nut_lb, meal, nut_ub, ddao);
			i += 1;
		}
		return meal.meals;

	}

	
	public static Double[] transFdtoToDouble(ArrayList<FoodDto> meals, int idx) {
		Double[] meal = new Double[27];
		for (int i=0; i < 27; i++) {
			meal[i] = Math.round(DietMaker.getFoodNutByIndex(meals.get(idx), i)*100)/100.0;
		}
		return meal; 
	}
	
	
	
	public static void out_meal(Meal meal) {
		System.out.println("=================오늘의 식단=================");
		for (FoodDto fdto: meal.meals) {
			System.out.println(fdto.getFood_cate3()+" "+fdto.getFood_name());
		}
	}
	
	public static boolean is_finish(Meal meal) {
		for (boolean b : meal.cur_cate) {
			if (b==false) {
				return false;
			}
		}
		return true;
	}
	
	public static boolean check_nut(double[] nut_lb, Meal meal, double[] nut_ub, DietDao ddao) {
		for (int i=0; i<nut_lb.length; i++) {
			if(meal.cur_nut[i]>=nut_lb[i]) {
				continue;
			}
			FoodDto food = get_food(meal, i);
			System.out.println("후보음식: "+ food.getFood_name());
			if (is_under_ub(meal, food, nut_ub)) {
				System.out.println("영양성분 만족 ====>"+food.getFood_name()+food.getFood_cate3());
				add_food(meal, food, meal.cate_idx);
				return true;
			} else if (meal.meals.size()==0) {
				meal = del_from_foodlist(food, meal, meal.cate_idx, ddao);
				continue;
			} else {
				meal = del_from_foodlist(food, meal, meal.cate_idx, ddao);
				System.out.println(nut_list[i]+"초과===>"+(meal.cnt_rejection[i]+1)+"회 거절");
				add_rejection(meal, i);
				continue;
			}
		}
		return false;
	}
	

	public static Meal del_from_foodlist(FoodDto fdto, Meal meal, int cate_idx, DietDao ddao) {
		meal.food_list.get(cate_idx).remove(fdto);
		if(meal.food_list.get(cate_idx).size()<10) {
			meal.food_list = get_100_foods(ddao);
		}
		//System.out.println("$$$$$$$$$$$$$$$$$$$"+meal.food_list.get(cate_idx).get(0).getFood_cate3());
		return meal;
	}

	
	public static void add_rejection(Meal meal, int nut_idx) {
		meal.cnt_rejection[nut_idx] += 1;
		if(meal.cnt_rejection[nut_idx]==4) {
			if(meal.meals.size()==0) {
				meal.cnt_rejection = new int[27];
				return;
			}
			ArrayList<FoodDto> temp = meal.meals;
			double max_value = -1.0;
			int max_idx = -1;
			for (int i=0; i< temp.size(); i++) {
				if (getFoodNutByIndex(temp.get(i), nut_idx) > max_value) {
					max_value = getFoodNutByIndex(temp.get(i), nut_idx);
					max_idx = i;
				}
			}
			FoodDto topfood = temp.get(max_idx);
			meal.meals.remove(topfood);
			for (int i=0; i<meal.cur_nut.length; i++) {
				meal.cur_nut[i] -= getFoodNutByIndex(topfood,i);
			}
			String[] food_cates = {"반찬1","주식","국물","반찬2","반찬3","부식"};
			int cate_idx = 0;
			for (String cate : food_cates) {
				if (cate.equals(topfood.getFood_cate3())) {
					break;
				}
				cate_idx += 1;
			}
			meal.cur_cate[cate_idx] = false;
			meal.cnt_rejection[nut_idx] = 0;
			System.out.println(nut_list[nut_idx]+", 4회초과"+topfood.getFood_name()+"삭제");
		}
	}
	
	public static void add_food(Meal meal, FoodDto fdto, int cate_idx) {
		for (int i=0; i<meal.cur_nut.length; i++) {
			meal.cur_nut[i] += getFoodNutByIndex(fdto,i);
		}
		meal.meals.add(fdto);
		meal.cur_cate[cate_idx] = true;
		meal.food_list.get(cate_idx).remove(fdto);
	}
	
	public static boolean is_under_ub(Meal meal, FoodDto fdto, double[] nut_ub) {
		for(int i=0; i<meal.cur_nut.length; i++) {
			if(nut_ub[i]<0.1) {
				continue;
			} 
			if(meal.cur_nut[i]+ getFoodNutByIndex(fdto,i)> nut_ub[i]) {
				return false;
			}
		}
		return true;
	}
	
	
	public static FoodDto get_food(Meal meal, int nut_idx) {
		ArrayList<FoodDto> temp = new ArrayList<FoodDto>();
		for (int i=0; i < meal.cur_cate.length; i++) {
			if(meal.cur_cate[i]) {
				continue;
			} else {
				temp = meal.food_list.get(i);
				//System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+temp.size());
				//System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+temp.get(i).getFood_cate3());
				meal.cate_idx = i;
				break;
			}
		}
		double max_value = -1.0;
		int max_i = 0;
		for (int i=0; i< temp.size(); i++) {
			if (getFoodNutByIndex(temp.get(i), nut_idx) > max_value) {
				max_value = getFoodNutByIndex(temp.get(i), nut_idx);
				max_i = i;
				
			}
		}

		return temp.get(max_i);
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
		double[] nut_lb = {pdto.getEnergy()*0.8,
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
		double[] nut_ub = {pdto.getEnergy()*1.3,
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
	public static PeopleDto divideByPercent(PeopleDto pdto, int percent) {
		PeopleDto temPdto = new PeopleDto();
		temPdto = pdto;
		pdto.setEnergy((int)(pdto.getEnergy()*percent/100.0));
		pdto.setCarbo_LB((int)(pdto.getCarbo_LB()*percent/100.0));
		pdto.setCarbo_IA((int)(pdto.getCarbo_IA()*percent/100.0));
		pdto.setCarbo_UB((int)(pdto.getCarbo_UB()*percent/100.0));
		pdto.setFiber_LB((int)(pdto.getFiber_LB()*percent/100.0));
		pdto.setFiber_IA((int)(pdto.getFiber_IA()*percent/100.0)); 
		pdto.setFiber_UB((int)(pdto.getFiber_UB()*percent/100.0));
		pdto.setLipid_LB((int)(pdto.getLipid_LB()*percent/100.0));
		pdto.setLipid_IA((int)(pdto.getLipid_IA()*percent/100.0)); 
		pdto.setLipid_UB((int)(pdto.getLipid_UB()*percent/100.0));
		pdto.setLinoleic_acid_LB((int)(pdto.getLinoleic_acid_LB()*percent/100.0));
		pdto.setLinoleic_acid_IA((int)(pdto.getLinoleic_acid_IA()*percent/100.0));
		pdto.setLinoleic_acid_UB((int)(pdto.getLinoleic_acid_UB()*percent/100.0));
		pdto.setA_linoleic_acid_LB((int)(pdto.getA_linoleic_acid_LB()*percent/100.0));
		pdto.setA_linoleic_acid_IA((int)(pdto.getA_linoleic_acid_IA()*percent/100.0));
		pdto.setA_linoleic_acid_UB((int)(pdto.getA_linoleic_acid_UB()*percent/100.0));
		pdto.setPro_LB((int)(pdto.getPro_LB()*percent/100.0));
		pdto.setPro_IA((int)(pdto.getPro_IA()*percent/100.0));
		pdto.setPro_UB((int)(pdto.getPro_UB()*percent/100.0));
		pdto.setVitA_LB ((int)(pdto.getVitA_LB()*percent/100.0));
		pdto.setVitA_IA ((int)(pdto.getVitA_IA()*percent/100.0));
		pdto.setVitA_UB ((int)(pdto.getVitA_UB()*percent/100.0));
		pdto.setVitD_LB ((int)(pdto.getVitD_LB()*percent/100.0));
		pdto.setVitD_IA ((int)(pdto.getVitD_IA()*percent/100.0));
		pdto.setVitD_UB ((int)(pdto.getVitD_UB()*percent/100.0));
		pdto.setVitE_LB ((int)(pdto.getVitE_LB()*percent/100.0));
		pdto.setVitE_IA ((int)(pdto.getVitE_IA()*percent/100.0));
		pdto.setVitE_UB ((int)(pdto.getVitE_UB()*percent/100.0));
		pdto.setVitK_LB ((int)(pdto.getVitK_LB()*percent/100.0));
		pdto.setVitK_IA ((int)(pdto.getVitK_IA()*percent/100.0));
		pdto.setVitK_UB ((int)(pdto.getVitK_UB()*percent/100.0));
		pdto.setVitC_LB ((int)(pdto.getVitC_LB()*percent/100.0));
		pdto.setVitC_IA ((int)(pdto.getVitC_IA()*percent/100.0));
		pdto.setVitC_UB ((int)(pdto.getVitC_UB()*percent/100.0));
		pdto.setThia_LB ((int)(pdto.getThia_LB()*percent/100.0));
		pdto.setThia_IA ((int)(pdto.getThia_IA()*percent/100.0));
		pdto.setThia_UB ((int)(pdto.getThia_UB()*percent/100.0));
		pdto.setRibo_LB ((int)(pdto.getRibo_LB()*percent/100.0));
		pdto.setRibo_IA ((int)(pdto.getRibo_IA()*percent/100.0));
		pdto.setRibo_UB ((int)(pdto.getRibo_UB()*percent/100.0));
		pdto.setVitB6_LB((int)(pdto.getVitB6_LB()*percent/100.0));
		pdto.setVitB6_IA((int)(pdto.getVitB6_IA()*percent/100.0));
		pdto.setVitB6_UB((int)(pdto.getVitB6_UB()*percent/100.0));
		pdto.setFolic_LB((int)(pdto.getFolic_LB()*percent/100.0));
		pdto.setFolic_IA((int)(pdto.getFolic_IA()*percent/100.0));
		pdto.setFolic_UB((int)(pdto.getFolic_UB()*percent/100.0));
		pdto.setVitB12_LB((int)(pdto.getVitB12_LB()*percent/100.0));
		pdto.setVitB12_IA((int)(pdto.getVitB12_IA()*percent/100.0));
		pdto.setVitB12_UB((int)(pdto.getVitB12_UB()*percent/100.0));
		pdto.setPanto_LB((int)(pdto.getPanto_LB()*percent/100.0));
		pdto.setPanto_IA((int)(pdto.getPanto_IA()*percent/100.0));
		pdto.setPanto_UB((int)(pdto.getPanto_UB()*percent/100.0));
		pdto.setBio_LB((int)(pdto.getBio_LB()*percent/100.0));
		pdto.setBio_IA((int)(pdto.getBio_IA()*percent/100.0));
		pdto.setBio_UB((int)(pdto.getBio_UB()*percent/100.0));
		pdto.setCa_LB((int)(pdto.getCa_LB()*percent/100.0));
		pdto.setCa_IA((int)(pdto.getCa_IA()*percent/100.0));
		pdto.setCa_UB((int)(pdto.getCa_UB()*percent/100.0));
		pdto.setP_LB((int)(pdto.getP_LB()*percent/100.0));
		pdto.setP_IA((int)(pdto.getP_IA()*percent/100.0));
		pdto.setP_UB((int)(pdto.getP_UB()*percent/100.0));
		pdto.setNa_LB((int)(pdto.getNa_LB()*percent/100.0));
		pdto.setNa_IA((int)(pdto.getNa_IA()*percent/100.0));
		pdto.setNa_UB((int)(pdto.getNa_UB()*percent/100.0));
		pdto.setK_LB((int)(pdto.getK_LB()*percent/100.0));
		pdto.setK_IA((int)(pdto.getK_IA()*percent/100.0));
		pdto.setK_UB((int)(pdto.getK_UB()*percent/100.0));
		pdto.setMg_LB((int)(pdto.getMg_LB()*percent/100.0));
		pdto.setMg_IA((int)(pdto.getMg_IA()*percent/100.0));
		pdto.setMg_UB((int)(pdto.getMg_UB()*percent/100.0));
		pdto.setFe_LB((int)(pdto.getFe_LB()*percent/100.0));
		pdto.setFe_IA((int)(pdto.getFe_IA()*percent/100.0));
		pdto.setFe_UB((int)(pdto.getFe_UB()*percent/100.0));
		pdto.setZn_LB((int)(pdto.getZn_LB()*percent/100.0));
		pdto.setZn_IA((int)(pdto.getZn_IA()*percent/100.0));
		pdto.setZn_UB((int)(pdto.getZn_UB()*percent/100.0));
		pdto.setCu_LB((int)(pdto.getCu_LB()*percent/100.0));
		pdto.setCu_IA((int)(pdto.getCu_IA()*percent/100.0));
		pdto.setCu_UB((int)(pdto.getCu_UB()*percent/100.0));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@"+pdto.getEnergy());
		return temPdto;
		
	}
	
}

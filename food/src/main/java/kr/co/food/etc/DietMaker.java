package kr.co.food.etc;

import kr.co.food.dto.PeopleDto;

public class DietMaker {
	public static void main(String[] args) {
		
		
	}
	
		
	public double[] get_nut_lb(PeopleDto pdto) {
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
	public double[] get_nut_ia(PeopleDto pdto) {
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
	public double[] get_nut_ub(PeopleDto pdto) {
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

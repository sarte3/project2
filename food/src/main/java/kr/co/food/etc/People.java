package kr.co.food.etc;

import kr.co.food.dto.PeopleDto;

public class People { 
	public double[] nut_lb = new double[27];
	public double[] nut_ia = new double[27];
	public double[] nut_ub = new double[27];
	
	public People (PeopleDto pdto, double ratio) {
		nut_lb[0] = pdto.getEnergy()*0.8*ratio;
		nut_ia[0] = pdto.getEnergy()*1.0*ratio;
		nut_ub[0] = pdto.getEnergy()*1.3*ratio;
		nut_lb[1] = pdto.getCarbo_LB()*ratio;
		nut_ia[1] = pdto.getCarbo_IA()*ratio;
		nut_ub[1] = pdto.getCarbo_UB()*ratio;
		nut_lb[2] = pdto.getFiber_LB()*ratio;
		nut_ia[2] = pdto.getFiber_IA()*ratio;
		nut_ub[2] = pdto.getFiber_UB()*ratio;
		nut_lb[3] = pdto.getLipid_LB()*ratio;
		nut_ia[3] = pdto.getLipid_IA()*ratio;
		nut_ub[3] = pdto.getLipid_UB()*ratio;
		nut_lb[4] = pdto.getLinoleic_acid_LB()*ratio;
		nut_ia[4] = pdto.getLinoleic_acid_IA()*ratio;
		nut_ub[4] = pdto.getLinoleic_acid_UB()*ratio;
		nut_lb[5] = pdto.getA_linoleic_acid_LB()*ratio;
		nut_ia[5] = pdto.getA_linoleic_acid_IA()*ratio;
		nut_ub[5] = pdto.getA_linoleic_acid_UB()*ratio;
		nut_lb[6] = pdto.getPro_LB()*ratio;
		nut_ia[6] = pdto.getPro_IA()*ratio;
		nut_ub[6] = pdto.getPro_UB()*ratio;
		nut_lb[7] = pdto.getVitA_LB()*ratio; 
		nut_ia[7] = pdto.getVitA_IA()*ratio; 
		nut_ub[7] = pdto.getVitA_UB()*ratio; 
		nut_lb[8] = pdto.getVitD_LB()*ratio; 
		nut_ia[8] = pdto.getVitD_IA()*ratio; 
		nut_ub[8] = pdto.getVitD_UB()*ratio; 
		nut_lb[9] = pdto.getVitE_LB()*ratio; 
		nut_ia[9] = pdto.getVitE_IA()*ratio; 
		nut_ub[9] = pdto.getVitE_UB()*ratio; 
		nut_lb[10] = pdto.getVitK_LB()*ratio; 
		nut_ia[10] = pdto.getVitK_IA()*ratio; 
		nut_ub[10] = pdto.getVitK_UB()*ratio; 
		nut_lb[11] = pdto.getVitC_LB()*ratio; 
		nut_ia[11] = pdto.getVitC_IA()*ratio; 
		nut_ub[11] = pdto.getVitC_UB()*ratio; 
		nut_lb[12] = pdto.getThia_LB()*ratio; 
		nut_ia[12] = pdto.getThia_IA()*ratio; 
		nut_ub[12] = pdto.getThia_UB()*ratio; 
		nut_lb[13] = pdto.getRibo_LB()*ratio; 
		nut_ia[13] = pdto.getRibo_IA()*ratio; 
		nut_ub[13] = pdto.getRibo_UB()*ratio; 
		nut_lb[14] = pdto.getVitB6_LB()*ratio;
		nut_ia[14] = pdto.getVitB6_IA()*ratio;
		nut_ub[14] = pdto.getVitB6_UB()*ratio;
		nut_lb[15] = pdto.getFolic_LB()*ratio;
		nut_ia[15] = pdto.getFolic_IA()*ratio;
		nut_ub[15] = pdto.getFolic_UB()*ratio;
		nut_lb[16] = pdto.getVitB12_LB()*ratio;
		nut_ia[16] = pdto.getVitB12_IA()*ratio;
		nut_ub[16] = pdto.getVitB12_UB()*ratio;
		nut_lb[17] = pdto.getPanto_LB()*ratio;
		nut_ia[17] = pdto.getPanto_IA()*ratio;
		nut_ub[17] = pdto.getPanto_UB()*ratio;
		nut_lb[18] = pdto.getBio_LB()*ratio;
		nut_ia[18] = pdto.getBio_IA()*ratio;
		nut_ub[18] = pdto.getBio_UB()*ratio;
		nut_lb[19] = pdto.getCa_LB()*ratio;
		nut_ia[19] = pdto.getCa_IA()*ratio;
		nut_ub[19] = pdto.getCa_UB()*ratio;
		nut_lb[20] = pdto.getP_LB()*ratio;
		nut_ia[20] = pdto.getP_IA()*ratio;
		nut_ub[20] = pdto.getP_UB()*ratio;
		nut_lb[21] = pdto.getNa_LB()*ratio;
		nut_ia[21] = pdto.getNa_IA()*ratio;
		nut_ub[21] = pdto.getNa_UB()*ratio;
		nut_lb[22] = pdto.getK_LB()*ratio;
		nut_ia[22] = pdto.getK_IA()*ratio;
		nut_ub[22] = pdto.getK_UB()*ratio;
		nut_lb[23] = pdto.getMg_LB()*ratio;
		nut_ia[23] = pdto.getMg_IA()*ratio;
		nut_ub[23] = pdto.getMg_UB()*ratio;
		nut_lb[24] = pdto.getFe_LB()*ratio;
		nut_ia[24] = pdto.getFe_IA()*ratio;
		nut_ub[24] = pdto.getFe_UB()*ratio;
		nut_lb[25] = pdto.getZn_LB()*ratio;
		nut_ia[25] = pdto.getZn_IA()*ratio;
		nut_ub[25] = pdto.getZn_UB()*ratio;
		nut_lb[26] = pdto.getCu_LB()*ratio;
		nut_ia[26] = pdto.getCu_IA()*ratio;
		nut_ub[26] = pdto.getCu_UB()*ratio;
	}
	
	
}

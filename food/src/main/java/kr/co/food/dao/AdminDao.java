package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.*;

public interface AdminDao 
{
	public Integer getFoodCnt();
	
	public Integer getUserCnt();
	
	public Integer getRecipeCnt();
	
	public Integer getTrendCnt();
	
	public ArrayList<TrendDto> getTrend5();
	
	public ArrayList<MemberDto> getUser5();
	
	public ArrayList<NutrionDto> getFood5();
	
	public ArrayList<RecipeDto> getRecipe5();
	
}

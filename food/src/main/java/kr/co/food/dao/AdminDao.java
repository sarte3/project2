package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.MemberDto;
import kr.co.food.dto.NoticeDto;
import kr.co.food.dto.NutrionDto;
import kr.co.food.dto.RecipeDto;
import kr.co.food.dto.TrendDto;

public interface AdminDao 
{
	public Integer getFoodCnt();
	
	public Integer getUserCnt();
	
	public Integer getRecipeCnt();
	
	public Integer getTrendCnt();
	
	public Integer getNoticeCnt();
	
	public ArrayList<TrendDto> getTrend5();
	
	public ArrayList<MemberDto> getUser5();
	
	public ArrayList<NutrionDto> getFood5();
	
	public ArrayList<RecipeDto> getRecipe5();
	
	public ArrayList<NoticeDto> getNoticeList(int index);
	
	public ArrayList<TrendDto> getTrendList(int index);
	
	public ArrayList<MemberDto> getUserList(int index);
	
	public ArrayList<NutrionDto> getFoodList(int index);
	
	public ArrayList<RecipeDto> getRecipeList(int index);
	
	public void memberOut(String member_id);
	
	public void trendWrite(TrendDto dto);
	
	public TrendDto trendContent(String trend_id);
	
	public void trendUpdate(TrendDto dto);
	
	public void trendDelete(String trend_id);

	public void foodWrite(NutrionDto dto);
	
	public NutrionDto foodContent(String food_no);
	
	public void foodUpdate(NutrionDto dto);
	
	public void foodDelete(String food_no);
	
	public void noticeWrite(NoticeDto dto);
	
	public NoticeDto noticeContent(String notice_id);
	
	public void noticeUpdate(NoticeDto dto);
	
	public void noticeDelete(String notice_id);
	
	public void recipeWrite(RecipeDto dto);
	
	public RecipeDto recipeContent(String id);
	
	public void recipeUpdate(RecipeDto dto);
	
	public void recipeDelete(String id);
}

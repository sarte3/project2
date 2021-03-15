package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.RecipeDto;

public interface RecipeDao {
	
	public RecipeDto getRecipeInfo(int recipe_code);
	
	public RecipeDto getRecipeInfoByFoodName(String food_name);
	
	public ArrayList<RecipeDto> getRecipeListWithKeyword(String recipe_word, int index);
	
	public Integer getRecipeCntWithKeyword(String recipe_word);
	
	public ArrayList<RecipeDto> getRecipeList(int index);
	
	public Integer getRecipeCnt();
	
	public ArrayList<RecipeDto> recipe_info_content(String recipe_name);
	
}

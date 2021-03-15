package kr.co.food.dto;

public class RecipeDto {
	
	private int id;
	private String recipe_code, recipe_name, recipe_ingredients, recipe_content, food_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRecipe_code() {
		return recipe_code;
	}
	public void setRecipe_code(String recipe_code) {
		this.recipe_code = recipe_code;
	}
	public String getRecipe_name() {
		return recipe_name;
	}
	public void setRecipe_name(String recipe_name) {
		this.recipe_name = recipe_name;
	}
	public String getRecipe_ingredients() {
		return recipe_ingredients;
	}
	public void setRecipe_ingredients(String recipe_ingredients) {
		this.recipe_ingredients = recipe_ingredients;
	}
	public String getRecipe_content() {
		return recipe_content;
	}
	public void setRecipe_content(String recipe_content) {
		this.recipe_content = recipe_content;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	
}

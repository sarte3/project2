package kr.co.food.dto;

public class PriceDto {

	private int price_id,food_price;
	private String price_date,food_name,unit,food_code;
	private float price_percent;
	public int getPrice_id() {
		return price_id;
	}
	public void setPrice_id(int price_id) {
		this.price_id = price_id;
	}
	public int getFood_price() {
		return food_price;
	}
	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}
	public String getPrice_date() {
		return price_date;
	}
	public void setPrice_date(String price_date) {
		this.price_date = price_date;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getFood_code() {
		return food_code;
	}
	public void setFood_code(String food_code) {
		this.food_code = food_code;
	}
	public float getPrice_percent() {
		return price_percent;
	}
	public void setPrice_percent(float price_percent) {
		this.price_percent = price_percent;
	}
	
}

package kr.co.food.dto;

public class Predict_priceDto {
  private int pred_id,pred_price;
  private String pred_date,food_name,unit,food_code;
  private float price_percent;
public int getPred_id() {
	return pred_id;
}
public void setPred_id(int pred_id) {
	this.pred_id = pred_id;
}
public int getPred_price() {
	return pred_price;
}
public void setPred_price(int pred_price) {
	this.pred_price = pred_price;
}
public String getPred_date() {
	return pred_date;
}
public void setPred_date(String pred_date) {
	this.pred_date = pred_date;
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

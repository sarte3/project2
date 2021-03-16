package kr.co.food.dao;

import java.util.ArrayList;

import kr.co.food.dto.Predict_priceDto;

public interface Predict_priceDao {
	public ArrayList<Predict_priceDto> getPredictPrice(String foodname);
}

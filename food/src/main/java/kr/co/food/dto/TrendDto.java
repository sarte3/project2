package kr.co.food.dto;

public class TrendDto 
{
	private int trend_id, trend_month_vol, trend_blog_vol, trend_view_vol;
	private String trend_keyword, food_code;
	
	public String getFood_code() {
		return food_code;
	}
	public void setFood_code(String food_code) {
		this.food_code = food_code;
	}
	public int getTrend_id() {
		return trend_id;
	}
	public void setTrend_id(int trend_id) {
		this.trend_id = trend_id;
	}
	public int getTrend_month_vol() {
		return trend_month_vol;
	}
	public void setTrend_month_vol(int trend_month_vol) {
		this.trend_month_vol = trend_month_vol;
	}
	public int getTrend_blog_vol() {
		return trend_blog_vol;
	}
	public void setTrend_blog_vol(int trend_blog_vol) {
		this.trend_blog_vol = trend_blog_vol;
	}
	public int getTrend_view_vol() {
		return trend_view_vol;
	}
	public void setTrend_view_vol(int trend_view_vol) {
		this.trend_view_vol = trend_view_vol;
	}
	public String getTrend_keyword() {
		return trend_keyword;
	}
	public void setTrend_keyword(String trend_keyword) {
		this.trend_keyword = trend_keyword;
	}
	
	
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>트렌드 입력</h1>
	<form method="post" name="frm" action="trend_write_ok">
		<div class="mb-3">
			<label for="trend_keyword" class="form-label">트렌드 키워드</label>
			<input type="text" class="form-control" id="trend_keyword" name="trend_keyword">
		</div>
		<div class="mb-3">
			<label for="trend_month_vol" class="form-label">월간 검색량</label>
			<input type="text" class="form-control"
				id="trend_month_vol" name="trend_month_vol">
		</div>
		<div class="mb-3">
			<label for="trend_blog_vol" class="form-label">월간 블로그 발행량</label>
			<input type="text" class="form-control"
				id="trend_blog_vol" name="trend_blog_vol">
		</div>
		<div class="mb-3">
			<label for="trend_view_vol" class="form-label">월간 뷰 발행량</label>
			<input type="text" class="form-control"
				id="trend_view_vol" name="trend_view_vol">
		</div>
		<div class="mb-3">
			<label for="food_code" class="form-label">음식 코드</label>
			<input type="text" class="form-control"
				id="food_code" name="food_code">
		</div>
		<div class="d-grid gap-2" style="text-align:right;">
  			<button class="btn btn-primary" type="submit">트렌드 입력</button>
		</div>
	</form>
</div>
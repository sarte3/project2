<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>음식 입력</h1>
	<form method="post" name="frm" action="food_write_ok">
		<div class="mb-3">
			<label for="food_name" class="form-label">음식명</label>
			<input type="text" class="form-control" id="food_name" name="food_name">
		</div>
		<div class="mb-3">
			<label for="food_cate2" class="form-label">식품 분류</label>
			<input type="text" class="form-control"
				id="food_cate2" name="food_cate2">
		</div>
		<div class="mb-3">
			<label for="food_serving" class="form-label">1회제공량</label>
			<input type="text" class="form-control"
				id="food_serving" name="food_serving">
		</div>
		<div class="mb-3">
			<label for="food_energy" class="form-label">칼로리</label>
			<input type="text" class="form-control"
				id="food_energy" name="food_energy">
		</div>
		<div class="mb-3">
			<label for="food_carbo" class="form-label">탄수화물</label>
			<input type="text" class="form-control"
				id="food_carbo" name="food_carbo">
		</div>
		<div class="mb-3">
			<label for="food_pro" class="form-label">단백질</label>
			<input type="text" class="form-control"
				id="food_pro" name="food_pro">
		</div>
		<div class="mb-3">
			<label for="food_lipid" class="form-label">지방</label>
			<input type="text" class="form-control"
				id="food_lipid" name="food_lipid">
		</div>
		<div class="mb-3">
			<label for="food_fiber" class="form-label">식이섬유</label>
			<input type="text" class="form-control"
				id="food_fiber" name="food_fiber">
		</div>
		<div class="mb-3">
			<label for="food_vitC" class="form-label">비타민C</label>
			<input type="text" class="form-control"
				id="food_vitC" name="food_vitC">
		</div>
		<div class="mb-3">
			<label for="food_folic" class="form-label">엽산</label>
			<input type="text" class="form-control"
				id="food_folic" name="food_folic">
		</div>
		<div class="mb-3">
			<label for="food_ca" class="form-label">칼슘</label>
			<input type="text" class="form-control"
				id="food_ca" name="food_ca">
		</div>
		<div class="mb-3">
			<label for="food_na" class="form-label">나트륨</label>
			<input type="text" class="form-control"
				id="food_na" name="food_na">
		</div>
		<div class="mb-3">
			<label for="food_mg" class="form-label">마그네슘</label>
			<input type="text" class="form-control"
				id="food_mg" name="food_mg">
		</div>
		<div class="mb-3">
			<label for="food_zn" class="form-label">아연</label>
			<input type="text" class="form-control"
				id="food_zn" name="food_zn">
		</div>
		<div class="d-grid gap-2" style="text-align:right;">
  			<button class="btn btn-primary" type="submit">음식 입력</button>
		</div>
	</form>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>레시피 수정</h1>
	<form method="post" name="frm" action="recipe_update_ok">
		<input type="hidden" value="${dto.id}" name="id">
		<div class="mb-3">
			<label for="food_name" class="form-label">음식 이름</label> <input
				type="text" class="form-control" id="food_name"
				name="food_name" value="${dto.food_name}">
		</div>
		<div class="mb-3">
			<label for="recipe_code" class="form-label">레시피 코드</label> <input
				type="text" class="form-control" id="recipe_code"
				name="recipe_code" value="${dto.recipe_code}">
		</div>
		<div class="mb-3">
			<label for="recipe_name" class="form-label">레시피 이름</label> <input
				type="text" class="form-control" id="recipe_name" name="recipe_name" value="${dto.recipe_name}">
		</div>
		<div class="mb-3">
			<label for="recipe_ingredients" class="form-label">레시피 재료</label>
			<textarea class="form-control" id="recipe_ingredients" name="recipe_ingredients" 
				rows="10">${dto.recipe_ingredients }</textarea>
		</div>
		<div class="mb-3">
			<label for="recipe_content" class="form-label">레시피 내용</label>
			<textarea class="form-control" id="recipe_content" name="recipe_content" 
				rows="10">${dto.recipe_content }</textarea>
		</div>
		<div class="d-grid gap-2" style="text-align: right;">
			<button class="btn btn-primary" type="submit">레시피 수정</button>
		</div>
	</form>
</div>
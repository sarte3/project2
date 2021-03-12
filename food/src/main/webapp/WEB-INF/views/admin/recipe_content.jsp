<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="section" class="right_col">
<h1>레시피 상세보기</h1>
	<table class="table">
		<tbody>
			<tr>
				<th>레시피 코드</th>
				<td>${dto.recipe_code }</td>
			</tr>
			<tr>
				<th>음식 이름</th>
				<td>${dto.food_name }</td>
			</tr>
			<tr>
				<th>레시피 이름</th>
				<td>${dto.recipe_name }</td>
			</tr>
			<tr>
				<th>레시피 재료</th>
				<td>${dto.recipe_ingredients }</td>
			</tr>
			<tr>
				<th>레시피 내용</th>
				<td>${dto.recipe_content }</td>
			</tr>
			<tr>
			<td colspan="2">
			<c:if test="${userid=='admin'}">
			<div id="btn">
			<button type="button" class="btn btn-primary"
							onclick="location='/food/admin/recipe_update?id=${dto.id}'">수정</button>
						<button type="button" class="btn btn-danger"
							onclick="location='/food/admin/recipe_delete?id=${dto.id}'">삭제</button>
			</div>
			</c:if>
			</td>
			</tr>
		</tbody>
	</table>
</div>
<style>
#btn{
	width:200px;
	margin:auto;
}
</style>
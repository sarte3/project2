<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>

</style>
<script src="../resources/chartjs/dist/Chart.js"></script>
<div id="section" class="right_col">
<h2>맞춤형 식단 추천</h2>
<h3>식단 대상</h3>
<table class="table">
	<tbody>
		<tr>
			<th>아이디</th>
			<th>대상</th>
			<th>열량</th>
		</tr>
		<tr>
			<th>${pdto.nut_id}</th>
			<th>${pdto.nut_desc}</th>
			<th>${pdto.energy}</th>
		</tr>
	</tbody>
</table>

<h3>영양소</h3>
<table class="table">
	<tbody>
		<tr>
			<th width="70px">구분</th>
			<c:forEach var="i" begin="0" end="${fn:length(nut_list)-1}">
			<th>${nut_list[i]}</th>
			</c:forEach>
		</tr>
		<tr>
			<td>하한선</td>
			<c:forEach var="i" begin="0" end="${fn:length(nut_lb)-1}">
			<td>${nut_lb[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>적정선</td>
			<c:forEach var="i" begin="0" end="${fn:length(nut_ia)-1}">
			<td>${nut_ia[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>상한선</td>
			<c:forEach var="i" begin="0" end="${fn:length(nut_ub)-1}">
			<td>${nut_ub[i]}</td>
			</c:forEach>
		</tr>
	</tbody>
</table>
<h3>나의 식단</h3>
<table class="table">
	<tbody>
		<tr>
			<th width="70px">구분</th>
			<th>음식명</th>
			<c:forEach var="i" begin="0" end="${fn:length(nut_list)-1}">
			<th>${nut_list[i]}</th>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A1_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_A1_name}">${meal_A1_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A1[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A2_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_A2_name}">${meal_A2_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A2[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A3_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_A3_name}">${meal_A3_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A3[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A4_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_A4_name}">${meal_A4_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A4[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A5_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_A5_name}">${meal_A5_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A5[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A6_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_A6_name}">${meal_A6_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A6[i]}</td>
			</c:forEach>
		</tr>
		<tr> 
			<th>합계</th>
			<th>아침식사</th>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${Math.round((meal_A1[i]+meal_A2[i]+meal_A3[i]+meal_A4[i]+meal_A5[i]+meal_A6[i])*100)/100.0}</td>
			</c:forEach>
		</tr>
	</tbody>
</table> 
<table class="table">
	<tbody>
		<tr>
			<th width="70px">구분</th>
			<th>음식명</th>
			<c:forEach var="i" begin="0" end="${fn:length(nut_list)-1}">
			<th>${nut_list[i]}</th>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B1_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_B1_name}">${meal_B1_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B1[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B2_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_B2_name}">${meal_B2_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B2[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B3_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_B3_name}">${meal_B3_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B3[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B4_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_B4_name}">${meal_B4_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B4[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B5_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_B5_name}">${meal_B5_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B5[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_B6_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_B6_name}">${meal_B6_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_B6[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<th>합계</th>
			<th>점심식사</th>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${Math.round((meal_B1[i]+meal_B2[i]+meal_B3[i]+meal_B4[i]+meal_B5[i]+meal_B6[i])*100)/100.0}</td>
			</c:forEach>
		</tr>
	</tbody>
</table>
<table class="table">
	<tbody>
		<tr>
			<th width="70px">구분</th>
			<th>음식명</th>
			<c:forEach var="i" begin="0" end="${fn:length(nut_list)-1}">
			<th>${nut_list[i]}</th>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C1_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_C1_name}">${meal_C1_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C1[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C2_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_C2_name}">${meal_C2_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C2[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C3_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_C3_name}">${meal_C3_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C3[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C4_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_C4_name}">${meal_C4_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C4[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C5_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_C5_name}">${meal_C5_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C5[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_C6_cate}</td>
			<td><a href="/food/recipe_info/recipe_food_name?food_name=${meal_C6_name}">${meal_C6_name}</a></td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_C6[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<th>합계</th>
			<th>저녁식사</th>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${Math.round((meal_C1[i]+meal_C2[i]+meal_C3[i]+meal_C4[i]+meal_C5[i]+meal_C6[i])*100)/100.0}</td>
			</c:forEach>
		</tr>
	</tbody>
</table>



</div>
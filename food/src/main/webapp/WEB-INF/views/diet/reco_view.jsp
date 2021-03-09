<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>

</style>
<script src="../resources/chartjs/dist/Chart.js"></script>
<div id="section" class="right_col">
<h2>reco_view.jsp</h2>
<h3>사람정보</h3>
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
			<th>구분</th>
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
			<th>구분</th>
			<th>음식명</th>
			<c:forEach var="i" begin="0" end="${fn:length(nut_list)-1}">
			<th>${nut_list[i]}</th>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A1_cate}</td>
			<td>${meal_A1_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A1[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A2_cate}</td>
			<td>${meal_A2_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A2[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A3_cate}</td>
			<td>${meal_A3_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A3[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A4_cate}</td>
			<td>${meal_A4_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A4[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A5_cate}</td>
			<td>${meal_A5_name}</td>
			<c:forEach var="i" begin="0" end="${fn:length(meal_A1)-1}">
			<td>${meal_A5[i]}</td>
			</c:forEach>
		</tr>
		<tr>
			<td>${meal_A6_cate}</td>
			<td>${meal_A6_name}</td>
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
</div>
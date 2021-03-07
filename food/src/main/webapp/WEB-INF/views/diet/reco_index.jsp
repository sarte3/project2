<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

</style>
<script src="../resources/chartjs/dist/Chart.js"></script>
<div id="section" class="right_col">
<h2>reco_index.jsp</h2>
<h3>${pdto.nut_desc }</h3>
<canvas id="canvas"></canvas>
	<table class="table">
	<tbody>
		<tr>
			<th>음식명</th>
			<th>월 검색량</th>
			<th>월별 블로그 작성량</th>
			<th>월별 View 작성량</th>
		</tr>
		<c:forEach var="fdto" items="${flist}">
		<tr>
			<td>${fdto.food_code}</td>
			<td>${fdto.food_cate3}</td>
			<td>${fdto.food_name}</td>
			<td>${fdto.food_energy}</td>
		</tr>
		</c:forEach>
	</tbody>
	
	</table>

</div>
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

<h3>음식불러오기</h3>
<table class="table">
	<tbody>
		<tr>
			<th>반찬1</th>
			<th>반찬2</th>
		</tr>
		<tr>
			<th>${result[0][0]}</th>
			<th>${result[1][0]}</th>
		</tr>
	</tbody>
</table>
</div>
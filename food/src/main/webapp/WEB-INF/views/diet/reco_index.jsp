<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
tbody {font-size:15px;}
</style>
<script src="../resources/chartjs/dist/Chart.js"></script>
<div id="section" class="right_col">
<h2>조건 입력</h2>
<form method="post" action="reco_view">
	<table class="table">
	<tbody>
		<tr>
			<td>연령</td>
			<td colspan="2">
				<!-- 영아, 유아에 맞는 식단 찾는 방법은 상이하여 우선 임신부 value로 함 -->
				<input type="radio" name="nut_id" value="8">영아(6~11)&nbsp;&nbsp;
				<input type="radio" name="nut_id" value="8">유아(3~5)&nbsp;&nbsp;
				<input type="radio" name="nut_id" value="2">남,청소년(15~18)&nbsp;&nbsp;
				<input type="radio" name="nut_id" value="3">여,청소년(15~18)&nbsp;&nbsp;
				<input type="radio" name="nut_id" value="4">남,성인(30~49)&nbsp;&nbsp;
				<input type="radio" name="nut_id" value="5">여,성인(30~49)&nbsp;&nbsp;
				<input type="radio" name="nut_id" value="6">남,노인(75~)&nbsp;&nbsp;
				<input type="radio" name="nut_id" value="7">여,노인(75~)&nbsp;&nbsp;
				<input type="radio" name="nut_id" value="8">임신부&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="식단추천">
			</td>
		</tr>
	</tbody>
	</table>
</form>

</div>
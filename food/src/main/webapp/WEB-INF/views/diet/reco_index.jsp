<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
tbody {font-size:17px;}

#t_container {padding-left:300px; width:1600px;}

</style>
<script src="../resources/chartjs/dist/Chart.js"></script>
<div id="section" class="right_col">
<h2>조건 입력</h2>
<form method="post" action="reco_view">
	<div id="t_container">
	<table class="table">
	<tbody>
		<tr>
			<td>연령 및 성별</td>
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
		<!-- 아래 선택항목은 현재 코드내에서 실제 식단 추천에 반영하지 않음 -->
		<tr>
			<td>기간 선택</td>
			<td colspan="2">
				<input type="radio" name="" value="0">한끼 (1끼)&nbsp;&nbsp;
				<input type="radio" name="" value="1">하루치(3끼)&nbsp;&nbsp;
				<input type="radio" name="" value="2">3일치 (9끼)&nbsp;&nbsp;
				<input type="radio" name="" value="3">일주일치 - 주말미포함(15끼)&nbsp;&nbsp;
				<input type="radio" name="" value="4">일주일치 - 주말미포함(15끼)&nbsp;&nbsp;
				<input type="radio" name="" value="5">일주일치 - 주말포함(21끼)&nbsp;&nbsp;
				<input type="radio" name="" value="6">한달치 (90끼)&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>음식 가짓수</td>
			<td colspan="2">
				<input type="radio" name="" value="0">제한없음&nbsp;&nbsp;
				<input type="radio" name="" value="1">밥1, 국1, 반찬2&nbsp;&nbsp;
				<input type="radio" name="" value="2">밥1, 국1, 반찬3&nbsp;&nbsp;
				<input type="radio" name="" value="3">밥1, 국1, 반찬3, 부식&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>알레르기 유무</td>
			<td colspan="2">
				<input type="radio" name="" value="0">선택안함&nbsp;&nbsp;
				<input type="radio" name="" value="1">갑각류&nbsp;&nbsp;
				<input type="radio" name="" value="2">견과&nbsp;&nbsp;
				<input type="radio" name="" value="3">달걀&nbsp;&nbsp;
				<input type="radio" name="" value="4">밀&nbsp;&nbsp;
				<input type="radio" name="" value="5">우유&nbsp;&nbsp;
				<input type="radio" name="" value="6">조개&nbsp;&nbsp;
				<input type="radio" name="" value="7">콩&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td>특별식단 유무</td>
			<td colspan="2">
				<input type="radio" name="" value="0">선택안함&nbsp;&nbsp;
				<input type="radio" name="" value="1">당뇨식&nbsp;&nbsp;
				<input type="radio" name="" value="2">임신성 당뇨&nbsp;&nbsp;
				<input type="radio" name="" value="3">고단백면역(치료중)&nbsp;&nbsp;
				<input type="radio" name="" value="4">고단백면역(치료후)&nbsp;&nbsp;
				<input type="radio" name="" value="5">건강관리&nbsp;&nbsp;
				<input type="radio" name="" value="6">베지테리안&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="식단추천">
			</td>
		</tr>
	</tbody>
	</table>
	</div>
</form>

</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

</style>
<script src="../resources/chartjs/dist/Chart.js"></script>
<div id="section" class="right_col">
<h2>reco_index.jsp</h2>
<form method="post" action="reco_view">
	<table class="table">
	<tbody>
		<tr>
			<td>아이디 고르기</td>
			<td colspan="2">
				<input type="radio" name="nut_id" value="0">영아(6~11)
				<input type="radio" name="nut_id" value="1">유아(3~5)
				<input type="radio" name="nut_id" value="2">남,청소년(15~18)
				<input type="radio" name="nut_id" value="3">여,청소년(15~18)
				<input type="radio" name="nut_id" value="4">남,성인(30~49)
				<input type="radio" name="nut_id" value="5">여,성인(30~49)
				<input type="radio" name="nut_id" value="6">남,노인(75~)
				<input type="radio" name="nut_id" value="7">여,노인(75~)
				<input type="radio" name="nut_id" value="8">임신부
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="가입하기">
			</td>
		</tr>
	</tbody>
	</table>
</form>

</div>
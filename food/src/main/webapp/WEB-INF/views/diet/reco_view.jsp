<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</div>
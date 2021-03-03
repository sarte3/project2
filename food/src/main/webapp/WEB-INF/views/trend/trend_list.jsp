<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="../resources/chartjs/dist/Chart.js"></script>
<div id="section" class="right_col">
<h1>음식 트렌드</h1>
<canvas id="canvas"></canvas>
<table class="table">
	<tbody>
		<tr>
			<th>음식명</th>
			<th>월 검색량</th>
			<th>월별 블로그 작성량</th>
			<th>월별 View 작성량</th>
		</tr>
		<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.trend_keyword }</td>
			<td>${dto.trend_month_vol }</td>
			<td>${dto.trend_blog_vol }</td>
			<td>${dto.trend_view_vol }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<script>
window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};

var label = new Array();
var trend_month_vol = new Array();
var trend_blog_vol = new Array();
var trend_view_vol = new Array();
<c:forEach var="dto" items="${list}">
	label.push("${dto.trend_keyword}");
	trend_month_vol.push("${dto.trend_month_vol}");
	trend_blog_vol.push("${dto.trend_blog_vol}");
	trend_view_vol.push("${dto.trend_view_vol}");
</c:forEach>

var barChartData = {
	labels: label,
	datasets: [{
		label: '월간 검색량',
		backgroundColor: window.chartColors.red,
		data: trend_month_vol
	}, {
		label: '블로그 월간 작성량',
		backgroundColor: window.chartColors.blue,
		data: trend_blog_vol
	}, {
		label: 'View 월간 작성량',
		backgroundColor: window.chartColors.green,
		data: trend_view_vol
	}]

};
	var ctx = document.getElementById('canvas').getContext('2d');
	window.myBar = new Chart(ctx, {
		type: 'bar',
		data: barChartData,
		options: {
			title: {
				display: true,
				text: '음식 트렌드'
			},
			tooltips: {
				mode: 'index',
				intersect: false
			},
			responsive: false,
			scales: {
				xAxes: [{
					stacked: true,
				}],
				yAxes: [{
					stacked: true
				}]
			}
		}
	});


</script>
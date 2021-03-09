<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="../resources/chartjs/dist/Chart.js"></script>

<div id="section" class="right_col">
  <canvas id="canvas" width="400"></canvas>
  
  <table class="table">
    <tbody>
		<tr>
			<th> 재료명 </th>
			<th> 단 위 </th>
			<th> 가 격 </th>
			<th> 가격 증감률 </th>
		</tr>
		<c:forEach var="pdto" items="${list}">
		<tr>
			<td> ${pdto.food_name} </td>
			<td> ${pdto.unit} </td>
			<td> ${pdto.food_price} </td>
			<td style="color:blue"> ${pdto.price_percent} ▼ </td>
		</tr>
		</c:forEach> 
	</tbody>
  </table>
</div>
<script>
	function newDate(days) {
		return moment().add(days, 'd').toDate();
	}

	var color = Chart.helpers.color;
	var config = {
		type: 'line',
		data: {
			labels: [ // Date Objects
				"2021-02-23",
				"2021-02-24",
				"2021-02-25",
				"2021-02-26",
				"2021-03-02",
				"2021-03-03",
				"2021-03-04"
			],
			datasets: [
				{
				label: 'My First dataset',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				fill: false,
				data: [1,2,3,4,5,6,7]
				}, 
				{
				label: 'My Second dataset',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				fill: false,
				data: [7,6,5,4,3,2,1]
				}
				]
		},
		options: {
			title: {
				text: 'Chart.js Time Scale'
			},
			scales: {
				xAxes: [{
					type: 'time',
					time: {
						parser: timeFormat,
						// round: 'day'
						tooltipFormat: 'll HH:mm'
					},
					scaleLabel: {
						display: true,
						labelString: 'Date'
					}
				}],
				yAxes: [{
					scaleLabel: {
						display: true,
						labelString: 'value'
					}
				}]
			},
		}
	};

	window.onload = function() {
		var ctx = document.getElementById('canvas').getContext('2d');
		window.myLine = new Chart(ctx, config);

	};

</script>	
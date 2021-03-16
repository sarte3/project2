<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="../resources/chartjs/dist/Chart.js"></script>
 
<canvas id="one_price_canvas" width="1100px"></canvas>

<script>
var label = new Array();
var food_price = new Array();
var food_name= new Set();
<c:forEach var="food" items="${food}">
	label.push("${food.price_date}");
	food_price.push("${food.food_price}");
	food_name.add("${food.food_name}");
</c:forEach>
food_price=food_price.reverse();
label=label.reverse();

<c:forEach var="f2" items="${f2}">
	label.push("${f2.pred_date}"+"예측값")
	food_price.push("${f2.pred_price}")
</c:forEach>

new Chart(document.getElementById("one_price_canvas"),
		{"type":"line",
		"data":{"labels":label,
			"datasets":[{"data":food_price,"fill":false,"borderColor":"#17a2b8","lineTension":0.1},
			]},
		"options":{title: {display:true, text:food_name.values().next().value+" 가격 그래프"},responsive:false, 
			legend: {display:false} }});
</script>			
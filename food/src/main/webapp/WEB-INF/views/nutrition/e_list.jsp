<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 th ,td{
    border: 1px solid #444444;
    padding: 10px;
    width : 5%;
  }
  th{background-color:white;}
  thead {
  position: fixed;
  top:90px;
  
  height:30px;
	}
  table{width:1460px;}
  div.box{height:2500px;}
</style>
    
 <div class="right_col" height="1500">
 <h2 align="center">필수 섭취 영양 성분 표</h2>
 <h1 align="center"> --</h1>
<table align="center"> 
	<thead align="center">
	    <th>성별</th>
	 	<th>나이</th>
	 	<th>임신여부</th>
	 	<th>칼로리</th>
		<th>탄수화물</th>
		<th>단백질</th>
		<th>지방</th>
		<th>수분</th>
		<th>칼슘</th>
		<th>인</th>
		<th>비타민C</th>
		<th>나트륨</th>
		<th>염소</th>
		<th>칼륨</th>
		<th>철분</th>
		<th>마그네슘</th>
		<th>아연</th>
	</thead>
<c:forEach var="edto" items="${e_list}">
<tr align="center">
<c:if test="${edto.e_gender == 0}">
	<td>영유아</td>
</c:if>
<c:if test="${edto.e_gender == 1}">
	<td>남성</td>
</c:if>
<c:if test="${edto.e_gender == 2}">
	<td>여성</td>
</c:if>
	<td>${edto.e_age}</td>
<c:if test="${edto.e_pregnancy == 0}">
	<td>X</td>
</c:if>
<c:if test="${edto.e_pregnancy == 1}">
	<td>임산부</td>
</c:if>
<c:if test="${edto.e_pregnancy == 2}">
	<td>수유부</td>
</c:if>
	<td>${edto.e_energy}kcal</td>
	<td>${edto.e_carbo}g</td>
	<td>${edto.e_pro}g</td>
	<td>${edto.e_fat}g</td>
	<td>${edto.e_h2o}g</td>
	<td>${edto.e_cal}g</td>
	<td>${edto.e_p}g</td>
	<td>${edto.e_vitc}g</td>
	<td>${edto.e_na}g</td>
	<td>${edto.e_cl}g</td>
	<td>${edto.e_k}g</td>
	<td>${edto.e_fe}g</td>
	<td>${edto.e_mg}g</td>
	<td>${edto.e_zn}g</td>
</tr>
</c:forEach>

</table>
</div>
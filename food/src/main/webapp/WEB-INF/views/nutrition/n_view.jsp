<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="right_col" >
 <table width="600" align="center" border="1">
   <tr>
     <td>식품명</td> <td> ${ndto.food_name} </td>
   </tr> 
   <tr>
     <td>식품분류</td> <td> ${ndto.food_jung} </td>
   </tr>
   <tr>
     <td> 1회제공량 </td> <td>${ndto.food_use}</td>
   </tr>
   <tr>
     <td> 총제공량단위 </td> <td>${ndto.food_dan} </td>
   </tr>
   <tr>
     <td> 칼로리</td> <td> ${ndto.food_kcal} kcal</td>
   </tr>
   <tr>
     <td>탄수화물</td> <td> ${ndto.food_carbo} g</td>
   </tr>
   <tr>
     <td> 단백질 </td> <td> ${ndto.food_pro} g</td>
   </tr>
   <tr>
     <td> 지방 </td> <td> ${ndto.food_fat} g</td>
   </tr>
</table>   
</div>
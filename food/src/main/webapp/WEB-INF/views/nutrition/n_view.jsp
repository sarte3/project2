<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="right_col" >
 <table width="600" align="center" border="1">
   <tr>
     <td>식품명</td> <td> ${ndto.food_name} </td>
   </tr> 
   <tr>
     <td>식품분류</td> <td> ${ndto.food_cate2} </td>
   </tr>
   <tr>
     <td> 1회제공량 </td> <td>${ndto.food_serving}</td>
   </tr>
   <tr>
     <td> 칼로리</td> <td> ${ndto.food_energy} kcal</td>
   </tr>
   <tr>
     <td>탄수화물</td> <td> ${ndto.food_carbo} g</td>
   </tr>
   <tr>
     <td> 단백질 </td> <td> ${ndto.food_pro} g</td>
   </tr>
   <tr>
     <td> 지방 </td> <td> ${ndto.food_lipid} g</td>
   </tr>
   <tr>
     <td> 식이섬유 </td> <td> ${ndto.food_fiber} g</td>
   </tr>
   <tr>
     <td> 비타민B </td> <td> ${ndto.food_vitB} g</td>
   </tr>
   <tr>
     <td> 비타민C </td> <td> ${ndto.food_vitC} g</td>
   </tr>
   <tr>
     <td> 엽산 </td> <td> ${ndto.food_folic} g</td>
   </tr>
   <tr>
     <td> 칼슘 </td> <td> ${ndto.food_ca} g</td>
   </tr>
   <tr>
     <td> 나트륨 </td> <td> ${ndto.food_na} g</td>
   </tr>
   <tr>
     <td> 마그네슘 </td> <td> ${ndto.food_mg} g</td>
   </tr>
   <tr>
     <td> 아연 </td> <td> ${ndto.food_zn} g</td>
   </tr>
</table>   
</div>

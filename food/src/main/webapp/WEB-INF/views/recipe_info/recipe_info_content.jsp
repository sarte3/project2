<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="right_col" >
<table width="600" align="center" border="1">
<c:forEach var="dto" items="${dto}">
	<tr>
		<td>레시피 재료</td>  <td>레시피 순서</td> 
	</tr> 
	<tr>
		<td> ${dto.recipe_ingredients} </td> <td> ${dto.recipe_content} </td> 
	</tr>
</c:forEach>
</table>   
</div>

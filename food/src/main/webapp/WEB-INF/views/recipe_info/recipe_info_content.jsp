<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div style="right_col" >
<table width="600" align="center" border="1">

<tr>
	<td>레시피 재료</td>  <td>레시피 순서</td> 
</tr> 
<tr>
	<td width="150px">
	<c:set var="test" value="${dto.recipe_ingredients }"/>
	<c:set var="test2" value="${fn:replace(test,',', '<br>')}"/>
	<c:set var="test3" value='${fn:replace(test2,"\'", "")}'/>
	<c:set var="test4" value="${fn:replace(test3, '[', '')}"/>
	${fn:replace(test4, "]", "")}</td> 
	<td width="400px">
	<c:set var="test" value="${dto.recipe_content}"/>
	<c:set var="test2" value="${fn:replace(test,',', '<br>')}"/>
	<c:set var="test3" value='${fn:replace(test2,"\'", "")}'/>
	<c:set var="test4" value="${fn:replace(test3, '[', '')}"/>
	${fn:replace(test4, "]", "")}</td> 
</tr>
</table>   
</div>

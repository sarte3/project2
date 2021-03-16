<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="right_col">
<table width="1200" align="left" border="1">
<tr>
	<td align="center" style="font-size:25px" width="35%">요리 재료</td>  <td align="center" style="font-size:25px" width="65%">조리 순서</td> 
</tr> 
<tr>
	<td align="center" width="35%" height="35%">
	<c:set var="test" value="${dto.recipe_ingredients }"/>
	<c:set var="test2" value="${fn:replace(test,',', '<br>')}"/>
	<c:set var="test3" value='${fn:replace(test2,"\'", "")}'/>
	<c:set var="test4" value="${fn:replace(test3, '[', '')}"/>
	${fn:replace(test4, "]", "")}</td> 
	<td width="65%" height="65%">
	<c:set var="test" value="${dto.recipe_content}"/>
	<c:set var="test2" value="${fn:replace(test,',', '<br>')}"/>
	<c:set var="test3" value='${fn:replace(test2,"\'", "")}'/>
	<c:set var="test4" value="${fn:replace(test3, '[', '')}"/>
	${fn:replace(test4, "]", "")}</td> 
</tr>
</table>   
</div>

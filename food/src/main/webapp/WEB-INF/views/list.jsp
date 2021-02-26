<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id=section>

 <c:forEach items="${list }" var="ndto">

     <a onmouseover="fetchPage('n_view?food_code=${ndto.food_code}');">${ndto.food_name}</a>
     
 </c:forEach>

</div>
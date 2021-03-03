<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
  function fetchPage(name){
    fetch(name).then(function(response){
      response.text().then(function(text){
        document.querySelector('article').innerHTML = text;
      })
    });
  }
  </script>
</head>
<body>
<table width="700" align="center" boarder="1">
 <tr>
    <td>음식이름</td>
 </tr>

 <c:forEach items="${list }" var="ndto">
  <tr>
     <td>
     <a onmouseover="fetchPage('n_view?food_code=${ndto.food_code}');">${ndto.food_name}</a>
     </td>
  </tr>
 </c:forEach>
 
   <article>
 
  </article>
 
 </table>
</body>
</html>
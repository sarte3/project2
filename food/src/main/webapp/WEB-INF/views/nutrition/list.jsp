<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  function fetchPage(name){
    fetch(name).then(function(response){
      response.text().then(function(text){
        document.querySelector('article').innerHTML = text;
      })
    });
  }
window.onload=function()
{
	
	document.sea.sear.value="${sear}";
}
  </script>

<div class="right_col" >
<table width="700" align="center" boarder="1">
 <caption> <h3>${page }페이지</h3></caption>
 <tr>
 	<td align="right">
 		<form method="post" action="list" name="sea">
 		  <select name="sear">
 		    <option value="food_name">음식이름</option>
 		  </select>
 		  <input type="text" name="sword" value="${sword}">
           <input type="submit" value="검색">

 		</form>
 	</td>
 </tr>
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
 <tr>
  <td colspan="4" align="center">
 <!-- 10페이지 이전 이동 -->
 <c:if test="${pstart !=1}">
   <a href="list?page=${pstart-1}"> << </a>
   </c:if>
   <c:if test="${pstart ==1 }">
   	<<
   </c:if>
    <!--현재페이지 이전로 이동시작-->
  <c:if test="${page !=1}">
   <a href="list?page=${page-1}"> < </a>
   </c:if>
   <c:if test="${page ==1 }">
   	<
   </c:if>
   <!-- 현재페이지 이전로 이동끝 -->
   <c:forEach var="i" begin="${pstart }" end="${pend }">
     <a href="list?page=${i }">${i}</a>
   </c:forEach>
   <!-- 현재 페이지 이후으로 이동 시작 : 현재페이지가 마지막페이지가 아니아여 된다.-->
        <c:if test="${page != page_cnt}">
          <a href="list?page=${page+1}"> > </a>
        </c:if>
        <c:if test="${page == page_cnt}">
          >
        </c:if>
   <!-- 현재페이지 10페이지이후로 이동끝 -->
    <c:if test="${pend !=page_cnt}">
   <a href="list?page=${pend+1}"> >> </a>
   </c:if>
   <c:if test="${pend ==page_cnt}">
    >> 
   </c:if>
   
  </td>
 </tr>
  </table>
 </div>

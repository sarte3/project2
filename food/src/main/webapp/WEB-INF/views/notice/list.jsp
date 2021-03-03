<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="right_col">
 <table width="700" height="900" align="center" boarder="1">
 <tr>
 	<td>제목</td>
 	<td>조회수</td>
 	<td>작성일</td>
 </tr>

 <c:forEach items="${list }" var="ndto">
  <tr>
     <td><a href="readnum?notice_id=${ndto.notice_id}">${ndto.notice_title}</a></td>
     <td>${ndto.notice_readnum}</td>
     <td>${ndto.notice_writeday}</td>
  </tr>
 </c:forEach>

<tr>
  <td colspan="4"><a href="write">글쓰기</a></td>
 </tr>
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
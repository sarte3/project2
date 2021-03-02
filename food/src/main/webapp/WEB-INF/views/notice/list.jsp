<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 </table>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  }
</style>
<div class="right_col">
<h1 align="center">공지사항</h1>
<div id="search" align="right">
  <form method="post" action="list">
  <input type="text" value="${sword}" name="sword" placeholder="제목" >
  <button type="submit" id="button">검색</button>
  </form>
</div>
 <table width="1000" height="700" align="center" boarder="1px" solid="1px">
 <tr align="center">
 	<td width=70%>제목</td>
 	<td>조회수</td>
 	<td>작성일</td>
 </tr>

 <c:forEach items="${list }" var="ndto">
  <tr align="center">
     <td><a href="readnum?notice_id=${ndto.notice_id}">${ndto.notice_title}</a></td>
     <td>${ndto.notice_readnum}</td>
     <td>${ndto.notice_writeday}</td>
  </tr>
 </c:forEach>

<tr>
  <td colspan="3" align="center"><a href="write">글쓰기</a></td>
 </tr>
 </table>
 	<div id="page_nav" align="center">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${page ==1 }">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true"> <- </a></li>
				</c:if>
				<c:if test="${page !=1 }">
					<li class="page-item"><a class="page-link"
						href="/food/notice/list?page=${page-1}&sword=${sword}"> <- </a></li>
				</c:if>
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${i!=page}">
						<li class="page-item"><a class="page-link"
							href="/food/notice/list?page=${i}&sword=${sword}">${i}</a></li>
					</c:if>
					<c:if test="${i==page}">
						<li class="page-item active"><a class="page-link"
							href="/food/notice/list?page=${i}&sword=${sword}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != page_cnt}">
					<li class="page-item"><a class="page-link"
						href="/food/notice/list?page=${page+1}&sword=${sword}">-></a></li>
				</c:if>
				<c:if test="${page == page_cnt}">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">-></a></li>
				</c:if>

			</ul>
		</nav>
	</div>
</div>
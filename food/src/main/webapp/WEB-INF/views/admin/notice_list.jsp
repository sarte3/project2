<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="section" class="right_col">
	<h1>공지사항 리스트</h1>
	<table class="table table-hover">
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<th scope="row">작성자</th>
				<th scope="row">작성일</th>
				<th scope="row">조회수</th>
			</tr>
			<c:forEach var="dto" items="${list }">
			<tr onclick="location='/food/admin/notice_content?notice_id=${dto.notice_id}'">
				<td>${dto.notice_title }</td>
				<td>${dto.notice_name }</td>
				<td>${dto.notice_writeday }</td>
				<td>${dto.notice_readnum }</td>		
			</tr>
			</c:forEach>
		</tbody>
	</table>
		<div id="page_nav">
	<nav aria-label="Page navigation example">
		<ul class="pagination" style="float:right;">
			<c:if test="${page ==1 }">
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">이전</a></li>
			</c:if>
			<c:if test="${page !=1 }">
				<li class="page-item"><a class="page-link"
					href="/food/admin/notice_list?page=${page-1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pstart }" end="${pend }">
				<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link"
					href="/food/admin/notice_list?page=${i}">${i}</a></li>
				</c:if>
				<c:if test="${i==page}">
				<li class="page-item active"><a class="page-link"
					href="/food/admin/notice_list?page=${i}">${i}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${page != page_cnt}">
				<li class="page-item"><a class="page-link" href="/food/admin/notice_list?page=${page+1}">다음</a></li>
			</c:if>
			<c:if test="${page == page_cnt}">
          				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">다음</a></li>
        	</c:if>
			
		</ul>
	</nav>
	</div>
<style>
#page_nav{
	width:500px;
	margin:0 auto;
}
</style>
</div>
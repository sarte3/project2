<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="section" class="right_col">
	<h1>회원 리스트</h1>
	<table class="table">
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<th scope="row">이름</th>
				<th scope="row">핸드폰</th>
				<th scope="row">이메일</th>
				<th scope="row">나이</th>
				<th scope="row">가입일</th>
				<th scope="row"></th>
			</tr>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.userid }</td>
				<td>${dto.name }</td>
				<td>${dto.phone }</td>
				<td>${dto.email }</td>
				<td>${dto.age }</td>
				<td>${dto.joinday }</td>
				<td><button type="button" class="btn btn-danger" onclick="location='/food/admin/member_out?member_id=${dto.member_id}'">탈퇴</button></td>				
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="page_nav">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${page ==1 }">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">이전</a></li>
				</c:if>
				<c:if test="${page !=1 }">
					<li class="page-item"><a class="page-link"
						href="/food/admin/member_list?page=${page-1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${i!=page}">
						<li class="page-item"><a class="page-link"
							href="/food/admin/member_list?page=${i}">${i}</a></li>
					</c:if>
					<c:if test="${i==page}">
						<li class="page-item active"><a class="page-link"
							href="/food/admin/member_list?page=${i}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != page_cnt}">
					<li class="page-item"><a class="page-link"
						href="/food/admin/member_list?page=${page+1}">다음</a></li>
				</c:if>
				<c:if test="${page == page_cnt}">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">다음</a></li>
				</c:if>

			</ul>
		</nav>
	</div>
</div>
<style>
#page_nav {
	width: 500px;
	margin: 0 auto;
}
</style>

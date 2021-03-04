<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="section" class="right_col">
	<h1>트렌드 리스트</h1>
	<table class="table">
		<tbody>
			<tr>
				<th>음식명</th>
				<th>월 검색량</th>
				<th>월별 블로그 작성량</th>
				<th>월별 View 작성량</th>
				<th></th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.trend_keyword }</td>
					<td>${dto.trend_month_vol }</td>
					<td>${dto.trend_blog_vol }</td>
					<td>${dto.trend_view_vol }</td>
					<td><button type="button" class="btn btn-primary"
							onclick="location='/food/admin/trend_update?trend_id=${dto.trend_id}'">수정</button>
						<button type="button" class="btn btn-danger"
							onclick="location='/food/admin/trend_delete?trend_id=${dto.trend_id}'">삭제</button></td>
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
						href="/food/admin/trend_list?page=${page-1}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${i!=page}">
						<li class="page-item"><a class="page-link"
							href="/food/admin/trend_list?page=${i}">${i}</a></li>
					</c:if>
					<c:if test="${i==page}">
						<li class="page-item active"><a class="page-link"
							href="/food/admin/trend_list?page=${i}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != page_cnt}">
					<li class="page-item"><a class="page-link"
						href="/food/admin/trend_list?page=${page+1}">다음</a></li>
				</c:if>
				<c:if test="${page == page_cnt}">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">다음</a></li>
				</c:if>

			</ul>
		</nav>
	</div>
	<style>
#page_nav {
	width: 500px;
	margin: 0 auto;
}
</style>
</div>
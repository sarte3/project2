<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="section" class="right_col">
	<h1>트렌드 전체 리스트</h1>
<div id="search">
  <form class="form-inline" method="post" action="trend_all_list">
  <input type="text" class="form-control" value="${sword}" name="sword" placeholder="트렌드명" aria-label="trend_keyword" aria-describedby="button">
  <button class="btn btn-primary" type="submit" id="button">검색</button>
  </form>
</div>
	<table class="table">
		<tbody>
			<tr>
				<th>음식명</th>
				<th>월 검색량</th>
				<th>월별 블로그 작성량</th>
				<th>월별 View 작성량</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.trend_keyword }</td>
					<td>${dto.trend_month_vol }</td>
					<td>${dto.trend_blog_vol }</td>
					<td>${dto.trend_view_vol }</td>
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
						href="/food/trend/trend_all_list?page=${page-1}&sword=${sword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${i!=page}">
						<li class="page-item"><a class="page-link"
							href="/food/trend/trend_all_list?page=${i}&sword=${sword}">${i}</a></li>
					</c:if>
					<c:if test="${i==page}">
						<li class="page-item active"><a class="page-link"
							href="/food/trend/trend_all_list?page=${i}&sword=${sword}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != page_cnt}">
					<li class="page-item"><a class="page-link"
						href="/food/trend/trend_all_list?page=${page+1}&sword=${sword}">다음</a></li>
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
#search
{
	float:right;
}
</style>
</div>
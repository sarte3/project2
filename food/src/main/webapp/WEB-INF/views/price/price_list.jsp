<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="section" class="right_col">
	<h1>가격 리스트</h1>
<div id="search">
  <form class="form-inline" method="post" action="price_list">
  <input type="text" class="form-control" value="${sword}" name="sword" placeholder="재료검색" aria-label="price_keyword" aria-describedby="button">
  <button class="btn btn-primary" type="submit" id="button">검색</button>
  </form>
</div>
	<table class="table">
		<tbody>
			<tr>
				<th>날짜</th>
				<th>재료명</th>
				<th>가격</th>
				<th>단위</th>
				<th>가격 증감률</th>
			</tr>
			<c:forEach var="plist" items="${plist}">
				<tr>
					<td>${plist.price_date}</td>
					<td>${plist.food_name}</td>
					<td>${plist.food_price}</td>
					<td>${plist.unit}</td>
					<td>${plist.price_percent}</td>
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
						href="/food/price/price_list?page=${page-1}&sword=${sword}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${i!=page}">
						<li class="page-item"><a class="page-link"
							href="/food/price/price_list?page=${i}&sword=${sword}">${i}</a></li>
					</c:if>
					<c:if test="${i==page}">
						<li class="page-item active"><a class="page-link"
							href="/food/price/price_list?page=${i}&sword=${sword}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != page_cnt}">
					<li class="page-item"><a class="page-link"
						href="/food/price/price_list?page=${page+1}&sword=${sword}">다음</a></li>
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
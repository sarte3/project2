<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="section" class="right_col">
	<h1 align="center">레시피 전체 리스트</h1>
<div id="search">
  <form class="form-inline" method="post" action="recipe_info_list">
  <input type="text" class="form-control" value="${recipe_word}" name="recipe_word" placeholder="레시피검색" aria-label="food_name" aria-describedby="button">
  <button class="btn btn-primary" type="submit" id="button">검색</button>
  </form>
</div>
	<table class="table">
		<tbody>
			<tr>
				<th>레시피 번호</th>
				<th>레시피 이름</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.recipe_code }</td>
					<td>${dto.recipe_name }</td>
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
						href="/food/recipe_info/recipe_info_list?page=${page-1}&recipe_word=${recipe_word}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${i!=page}">
						<li class="page-item"><a class="page-link"
							href="/food/recipe_info/recipe_info_list?page=${i}&recipe_word=${recipe_word}">${i}</a></li>
					</c:if>
					<c:if test="${i==page}">
						<li class="page-item active"><a class="page-link"
							href="/food/recipe_info/recipe_info_list?page=${i}&recipe_word=${recipe_word}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != page_cnt}">
					<li class="page-item"><a class="page-link"
						href="/food/recipe_info/recipe_info_list?page=${page+1}&recipe_word=${recipe_word}">다음</a></li>
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
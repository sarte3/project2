<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="section" class="right_col">
	<h1>레시피 리스트</h1>
	<table class="table table-hover">
		<tbody>
			<tr>
				<th scope="row">레시피코드</th>
				<th scope="row">음식이름</th>
				<th scope="row">레시피이름</th>
			</tr>
			<c:forEach var="dto" items="${list }">
			<tr onclick="location='/food/admin/recipe_content?id=${dto.id}'">
				<td>${dto.recipe_code }</td>
				<td>${dto.food_name }</td>
				<td>${dto.recipe_name }</td>		
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
					href="/food/admin/fnq_list?page=${page-1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pstart }" end="${pend }">
				<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link"
					href="/food/admin/fnq_list?page=${i}">${i}</a></li>
				</c:if>
				<c:if test="${i==page}">
				<li class="page-item active"><a class="page-link"
					href="/food/admin/fnq_list?page=${i}">${i}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${page != page_cnt}">
				<li class="page-item"><a class="page-link" href="/food/admin/fnq_list?page=${page+1}">다음</a></li>
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
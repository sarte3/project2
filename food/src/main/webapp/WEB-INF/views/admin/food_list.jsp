<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="section" class="right_col">
	<h1>음식 리스트</h1>
	<table class="table">
		<tbody>
			<tr>
				<th>음식명</th>
				<th>식품분류</th>
				<th>1회제공량</th>
				<th>칼로리</th>
				<th>탄수화물</th>
				<th>단백질</th>
				<th>지방</th>
				<th>식이섬유</th>
				<th>비타민B</th>
				<th>비타민C</th>
				<th>엽산</th>
				<th>칼슘</th>
				<th>나트륨</th>
				<th>마그네슘</th>
				<th>아연</th>
				<th></th>
			<tr>

				<c:forEach var="ndto" items="${list}">
					<tr>
						<td>${ndto.food_name}</td>
						<td>${ndto.food_cate2}</td>
						<td>${ndto.food_serving}</td>
						<td>${ndto.food_energy}kcal</td>
						<td>${ndto.food_carbo}g</td>
						<td>${ndto.food_pro}g</td>
						<td>${ndto.food_lipid}g</td>
						<td>${ndto.food_fiber}g</td>
						<td>${ndto.food_vitB}g</td>
						<td>${ndto.food_vitC}g</td>
						<td>${ndto.food_folic}g</td>
						<td>${ndto.food_ca}g</td>
						<td>${ndto.food_na}g</td>
						<td>${ndto.food_mg}g</td>
						<td>${ndto.food_zn}g</td>
						<td><button type="button" class="btn btn-primary"
								onclick="location='/food/admin/food_update?food_no=${ndto.food_no}'">수정</button>
							<button type="button" class="btn btn-danger"
								onclick="location='/food/admin/food_delete?food_no=${ndto.food_no}'">삭제</button></td>
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
					href="/food/admin/food_list?page=${page-1}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${pstart }" end="${pend }">
				<c:if test="${i!=page}">
				<li class="page-item"><a class="page-link"
					href="/food/admin/food_list?page=${i}">${i}</a></li>
				</c:if>
				<c:if test="${i==page}">
				<li class="page-item active"><a class="page-link"
					href="/food/admin/food_list?page=${i}">${i}</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${page != page_cnt}">
				<li class="page-item"><a class="page-link" href="/food/admin/food_list?page=${page+1}">다음</a></li>
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
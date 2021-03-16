<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
/*영양성분 content*/
function fetchPage(name){
	    fetch(name).then(function(response){
	      response.text().then(function(text){
	        document.querySelector('recipe').innerHTML = text;
	      })
	    });
	  }

  </script>
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="<%=request.getContextPath()%>/resources/bootstrap/build/css/custom.min.css" rel="stylesheet">
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
.first {
    float: left;
    width:40%;
    box-sizing: border-box;
}

.second{
    float: left;
    margin-left: 5%;
    width:40%;
    box-sizing: border-box;
}
</style>
<div id="section" class="right_col">
	<h1 align="left">레시피 전체 리스트</h1>
<div class="first">
<div id="search" align="right">
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
					<td>
					<a onmouseover="fetchPage('recipe_info_content2?recipe_name=${dto.recipe_name}');">${dto.recipe_name}</a></td>
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
<div class="second">
	<recipe> 
	 <!-- 성분표 나옴 -->
	</recipe>
</div>

</div>


	<!-- jQuery -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/vendors/nprogress/nprogress.js"></script>
    <!-- ECharts -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/vendors/echarts/dist/echarts.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/vendors/echarts/map/js/world.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/build/js/custom.min.js"></script>
	

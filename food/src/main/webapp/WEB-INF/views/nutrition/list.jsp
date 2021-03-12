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
	        document.querySelector('nutrition').innerHTML = text;
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
    border: 1px solid black;
    float: left;
    margin-left: 5%;
    width:40%;
    box-sizing: border-box;
}
</style>
<div class="right_col"  align="center">
<h1 align="center">식품 영양 성분</h1>

<div class="first">
<div id="search" align="right">
  <form method="post" action="list">
  <input type="text" value="${sword}" name="sword" placeholder="식품명" >
  <button type="submit" id="button">검색</button>
  </form>
</div>
<table  boarder="1">
 <tr align="center">
    <td>음식이름</td>
 </tr>

 <c:forEach items="${list }" var="ndto">
  <tr align="center">
     <td>
     <a onmouseover="fetchPage('n_view?food_code=${ndto.food_code}');">${ndto.food_name}</a>
     </td>
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
						href="/food/nutrition/list?page=${page-1}&sword=${sword}"> <- </a></li>
				</c:if>
				<c:forEach var="i" begin="${pstart }" end="${pend }">
					<c:if test="${i!=page}">
						<li class="page-item"><a class="page-link"
							href="/food/nutrition/list?page=${i}&sword=${sword}">${i}</a></li>
					</c:if>
					<c:if test="${i==page}">
						<li class="page-item active"><a class="page-link"
							href="/food/nutrition/list?page=${i}&sword=${sword}">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page != page_cnt}">
					<li class="page-item"><a class="page-link"
						href="/food/nutrition/list?page=${page+1}&sword=${sword}">-></a></li>
				</c:if>
				<c:if test="${page == page_cnt}">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">-></a></li>
				</c:if>

			</ul>
		</nav>
	</div>
 </div>
<div class="second">
	<nutrition> 
	 <!-- 성분표 나옴 -->
	</nutrition>
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
	

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- page content -->
<div class="right_col" role="main">
	<!-- top tiles -->
	<div class="row tile_count">
		<div class="col-md-3 col-sm-3 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-user"></i> 총 사용자</span>
			<div class="count">${user}</div>
		</div>
		<div class="col-md-3 col-sm-3 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-table"></i> 총 음식 수
				</span>
			<div class="count green">${food }</div>
		</div>
		<div class="col-md-3 col-sm-3 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-table"></i> 총 레시피 수</span>
			<div class="count">${recipe }</div>
		</div>
		<div class="col-md-3 col-sm-3 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-table"></i> 총 트렌드 수</span>
			<div class="count">${trend }</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="x_panel tile fixed_height_320">
				<div class="x_title">
					<h2>모든 유저</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Settings 1</a></li>
								<li><a href="#">Settings 2</a></li>
							</ul></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<table class="table">
						<tbody>
							<tr>
								<th>유저아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>핸드폰</th>
							</tr>
							<c:forEach var="dto" items="${ulist}">
								<tr>
									<td>${dto.userid }</td>
									<td>${dto.name }</td>
									<td>${dto.email }</td>
									<td>${dto.phone }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="/food/admin/user_list">더 보기</a>
				</div>
			</div>
		</div>

		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="x_panel tile fixed_height_320 overflow_hidden">
				<div class="x_title">
					<h2>모든 트렌드</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Settings 1</a></li>
								<li><a href="#">Settings 2</a></li>
							</ul></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<table class="table">
						<tbody>
							<tr>
								<th>음식명</th>
								<th>월 검색량</th>
								<th>월별 블로그 작성량</th>
								<th>월별 View 작성량</th>
							</tr>
							<c:forEach var="dto" items="${tlist}">
								<tr>
									<td>${dto.trend_keyword }</td>
									<td>${dto.trend_month_vol }</td>
									<td>${dto.trend_blog_vol }</td>
									<td>${dto.trend_view_vol }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="/food/admin/trend_list">더 보기</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="x_panel tile fixed_height_320">
				<div class="x_title">
					<h2>모든 음식</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Settings 1</a></li>
								<li><a href="#">Settings 2</a></li>
							</ul></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<table class="table">
						<tbody>
							<tr>
								<th>음식 이름</th>
								<th>음식 코드</th>
								<th>음식 카테고리</th>
							</tr>
							<c:forEach var="dto" items="${flist}">
								<tr>
									<td>${dto.food_name }</td>
									<td>${dto.food_code }</td>
									<td>${dto.food_cate2 }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="/food/admin/food_list">더 보기</a>
				</div>
			</div>
		</div>

		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="x_panel tile fixed_height_320 overflow_hidden">
				<div class="x_title">
					<h2>모든 레시피</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Settings 1</a></li>
								<li><a href="#">Settings 2</a></li>
							</ul></li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="x_content">
					<table class="table">
						<tbody>
							<tr>
								<th>레시피명</th>
								<th>레시피 코드</th>
							</tr>
							<c:forEach var="dto" items="${rlist}">
								<tr>
									<td>${dto.recipe_name }</td>
									<td>${dto.recipe_code }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<a href="/food/admin/recipe_list">더 보기</a>
				</div>
			</div>
		</div>
	</div>
</div>
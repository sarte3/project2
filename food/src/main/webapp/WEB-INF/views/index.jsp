<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
<!--
파이차트css-->.chart-container {
	width: 400px;
	height: 400px;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 4px;
}

.chart-container.dark {
	background-color: transparent;
}

#pie_input {
	background-color: #F3F3F3;
	color: #73879C;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/chartjs/dist/Chart.js"></script>
<!-- page content -->
<div class="right_col" role="main">
	<!-- top tiles -->
	<div class="row tile_count">
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-user"></i> Total Users
				Count</span>
			<div class="count">${user }</div>
			<span class="count_bottom"><i class="green">4% </i> From last
				Week</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-clock-o"></i>Total
				Recipe Count</span>
			<div class="count">${recipe }</div>
			<span class="count_bottom"><i class="green"><i
					class="fa fa-sort-asc"></i>3% </i> From last Week</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-user"></i> Total Diet
				Count</span>
			<div class="count green">${diet }</div>
			<span class="count_bottom"><i class="green"><i
					class="fa fa-sort-asc"></i>34% </i> From last Week</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-user"></i> Total Food
				Count</span>
			<div class="count">${food }</div>
			<span class="count_bottom"><i class="red"><i
					class="fa fa-sort-desc"></i>12% </i> From last Week</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-user"></i> Total Trend
				Data</span>
			<div class="count">${trend }</div>
			<span class="count_bottom"><i class="green"><i
					class="fa fa-sort-asc"></i>34% </i> From last Week</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
			<span class="count_top"><i class="fa fa-user"></i> Total Price
				Data</span>
			<div class="count">${price }</div>
			<span class="count_bottom"><i class="green"><i
					class="fa fa-sort-asc"></i>34% </i> From last Week</span>
		</div>
	</div>
	<!-- /top tiles -->

	<!-- 트렌드 -->
	<div class="row">
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_320">
				<div class="x_title">
					<h2>음식 트렌드</h2>
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
					<canvas id="canvas" class="col-md-12 col-sm-12 col-xs-12"
						style="height: 250px;"></canvas>
				</div>
			</div>
		</div>

		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_320 overflow_hidden">
				<div class="x_title">
					<h2>음식 트렌드 순위</h2>
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
				</div>
			</div>
		</div>
		<!--/ 트렌드 -->
		<!-- 필수영양소 -->
		<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="x_panel tile fixed_height_320 overflow_hidden">
				<div class="x_title">
					<h2>필수영양소알아보기</h2>
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
				<div class="chart-container dark">
					<canvas id="pie-chart2"></canvas>
				</div>
				<div id="pie_input" align="center">
					<p />
					<input type="radio" value="0" name="nu" id="0">영유아 <input
						type="radio" value="1" name="nu" id="1">10대남성 <input
						type="radio" value="2" name="nu" id="2">10대여성 <input
						type="radio" value="3" name="nu" id="3">20대남성 <input
						type="radio" value="4" name="nu" id="4">20대여성
					<p />
					<input type="radio" value="5" name="nu" id="5">30대남성 <input
						type="radio" value="6" name="nu" id="6">30대여성 <input
						type="radio" value="7" name="nu" id="7">40대남성 <input
						type="radio" value="8" name="nu" id="8">40대여성 <input
						type="radio" value="9" name="nu" id="9">50대 남 성
					<p />
					<input type="radio" value="10" name="nu" id="10">50대여성 <input
						type="radio" value="11" name="nu" id=11>60대남성 <input
						type="radio" value="12" name="nu" id="12">60대여성 <input
						type="radio" value="13" name="nu" id="13">20대 임산부 <input
						type="radio" value="14" name="nu" id="14">30대 임산부
				</div>
			</div>
		</div>
		<!-- /필수영양소 -->

		<!-- 빠른 식단 -->
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							빠른 식단 <small>나에게 꼭 맞는 추천식단</small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
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
					<div class="x_content" style="height: 600px;">
						<div class="">
							<ul class="to_do">
								<li style="height: 70px;">
									<p>
										<input type="radio" name="meal_age" class="flat" value="1">
										<label for="0">성장기</label>
									</p>
								</li>
								<li style="height: 70px;">
									<p>
										<input type="radio" name="meal_age" class="flat" value="2">
										<label for="1">활동량많은 청소년</label>
									</p>
								</li>
								<li style="height: 70px;">
									<p>
										<input type="radio" name="meal_age" class="flat" value="3">
										<label for="2">성인 젊은 남성</label>
									</p>
								</li>
								<li style="height: 70px;">
									<p>
										<input type="radio" name="meal_age" class="flat" value="4">
										<label for="3">성인 젊은 여성</label>
								</li>
								<li style="height: 70px;">
									<p>
										<input type="radio" name="meal_age" class="flat" value="5">
										<label for="4">저염식</label>
									</p>
								</li>
								<li style="height: 70px;">
									<p>
										<input type="radio" name="meal_age" class="flat" value="6">
										<label for="5">임신부</label>
									</p>
								</li>
								<li style="height: 70px;">
									<p>
										<input type="radio" name="meal_age" class="flat" value="7">
										<label for="6">고단백 저칼로리</label>
									</p>
								</li>
								<li style="height: 70px;">
									<p>
										<input type="radio" name="meal_age" class="flat" value="8">
										<label for="7">노인 건강식</label>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- /빠른 식단 -->

			<!-- 주간식단표 -->
			<div class="col-md-8 col-sm-8 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							주간 식단표 <small>한눈에 알아보기</small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
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

						<div class="row">
							<div class="col-sm-12">
								<div class="temperature">
									<b>3월 2째주</b>
								</div>
							</div>
						</div>
						<div class="row weather-days">
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Mon</h2>
									<h3 class="day">
										<b>아침</b>
									</h3>
									<h6>${meal1.food_1}</h6>
									<h6>${meal1.food_2}</h6>
									<h6>${meal1.food_3}</h6>
									<h6>${meal1.food_4}</h6>
									<h6>${meal1.food_5}</h6>
									<h6>${meal1.food_6}</h6>
									<h3 class="day">
										<b>점심</b>
									</h3>
									<h6>${meal2.food_1}</h6>
									<h6>${meal2.food_2}</h6>
									<h6>${meal2.food_3}</h6>
									<h6>${meal2.food_4}</h6>
									<h6>${meal2.food_5}</h6>
									<h6>${meal2.food_6}</h6>
									<h3 class="day">
										<b>저녁</b>
									</h3>
									<h6>${meal3.food_1}</h6>
									<h6>${meal3.food_2}</h6>
									<h6>${meal3.food_3}</h6>
									<h6>${meal3.food_4}</h6>
									<h6>${meal3.food_5}</h6>
									<h6>${meal3.food_6}</h6>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Tue</h2>
									<h3 class="day">
										<b>아침</b>
									</h3>
									<h6>${meal4.food_1}</h6>
									<h6>${meal4.food_2}</h6>
									<h6>${meal4.food_3}</h6>
									<h6>${meal4.food_4}</h6>
									<h6>${meal4.food_5}</h6>
									<h6>${meal4.food_6}</h6>
									<h3 class="day">
										<b>점심</b>
									</h3>
									<h6>${meal5.food_1}</h6>
									<h6>${meal5.food_2}</h6>
									<h6>${meal5.food_3}</h6>
									<h6>${meal5.food_4}</h6>
									<h6>${meal5.food_5}</h6>
									<h6>${meal5.food_6}</h6>
									<h3 class="day">
										<b>저녁</b>
									</h3>
									<h6>${meal6.food_1}</h6>
									<h6>${meal6.food_2}</h6>
									<h6>${meal6.food_3}</h6>
									<h6>${meal6.food_4}</h6>
									<h6>${meal6.food_5}</h6>
									<h6>${meal6.food_6}</h6>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Wed</h2>
									<h3 class="day">
										<b>아침</b>
									</h3>
									<h6>${meal7.food_1}</h6>
									<h6>${meal7.food_2}</h6>
									<h6>${meal7.food_3}</h6>
									<h6>${meal7.food_4}</h6>
									<h6>${meal7.food_5}</h6>
									<h6>${meal7.food_6}</h6>
									<h3 class="day">
										<b>점심</b>
									</h3>
									<h6>${meal8.food_1}</h6>
									<h6>${meal8.food_2}</h6>
									<h6>${meal8.food_3}</h6>
									<h6>${meal8.food_4}</h6>
									<h6>${meal8.food_5}</h6>
									<h6>${meal8.food_6}</h6>
									<h3 class="day">
										<b>저녁</b>
									</h3>
									<h6>${meal9.food_1}</h6>
									<h6>${meal9.food_2}</h6>
									<h6>${meal9.food_3}</h6>
									<h6>${meal9.food_4}</h6>
									<h6>${meal9.food_5}</h6>
									<h6>${meal9.food_6}</h6>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Thu</h2>
									<h3 class="day">
										<b>아침</b>
									</h3>
									<h6>${meal10.food_1}</h6>
									<h6>${meal10.food_2}</h6>
									<h6>${meal10.food_3}</h6>
									<h6>${meal10.food_4}</h6>
									<h6>${meal10.food_5}</h6>
									<h6>${meal10.food_6}</h6>
									<h3 class="day">
										<b>점심</b>
									</h3>
									<h6>${meal11.food_1}</h6>
									<h6>${meal11.food_2}</h6>
									<h6>${meal11.food_3}</h6>
									<h6>${meal11.food_4}</h6>
									<h6>${meal11.food_5}</h6>
									<h6>${meal11.food_6}</h6>
									<h3 class="day">
										<b>저녁</b>
									</h3>
									<h6>${meal12.food_1}</h6>
									<h6>${meal12.food_2}</h6>
									<h6>${meal12.food_3}</h6>
									<h6>${meal12.food_4}</h6>
									<h6>${meal12.food_5}</h6>
									<h6>${meal12.food_6}</h6>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Fri</h2>
									<h3 class="day">
										<b>아침</b>
									</h3>
									<h6>${meal13.food_1}</h6>
									<h6>${meal13.food_2}</h6>
									<h6>${meal13.food_3}</h6>
									<h6>${meal13.food_4}</h6>
									<h6>${meal13.food_5}</h6>
									<h6>${meal13.food_6}</h6>
									<h3 class="day">
										<b>점심</b>
									</h3>
									<h6>${meal14.food_1}</h6>
									<h6>${meal14.food_2}</h6>
									<h6>${meal14.food_3}</h6>
									<h6>${meal14.food_4}</h6>
									<h6>${meal14.food_5}</h6>
									<h6>${meal14.food_6}</h6>
									<h3 class="day">
										<b>저녁</b>
									</h3>
									<h6>${meal15.food_1}</h6>
									<h6>${meal15.food_2}</h6>
									<h6>${meal15.food_3}</h6>
									<h6>${meal15.food_4}</h6>
									<h6>${meal15.food_5}</h6>
									<h6>${meal15.food_6}</h6>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Sat</h2>
									<h3 class="day">
										<b>아침</b>
									</h3>
									<h6>${meal16.food_1}</h6>
									<h6>${meal16.food_2}</h6>
									<h6>${meal16.food_3}</h6>
									<h6>${meal16.food_4}</h6>
									<h6>${meal16.food_5}</h6>
									<h6>${meal16.food_6}</h6>
									<h3 class="day">
										<b>점심</b>
									</h3>
									<h6>${meal17.food_1}</h6>
									<h6>${meal17.food_2}</h6>
									<h6>${meal17.food_3}</h6>
									<h6>${meal17.food_4}</h6>
									<h6>${meal17.food_5}</h6>
									<h6>${meal17.food_6}</h6>
									<h3 class="day">
										<b>저녁</b>
									</h3>
									<h6>${meal18.food_1}</h6>
									<h6>${meal18.food_2}</h6>
									<h6>${meal18.food_3}</h6>
									<h6>${meal18.food_4}</h6>
									<h6>${meal18.food_5}</h6>
									<h6>${meal18.food_6}</h6>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /주간식단표 -->

		<!-- 가격차트 -->
		<div class="row">
			<div class="col-md-8 col-sm-8">
				<div class="x_panel tile fixed_height_600">
					<div class="x_title">
						<h2>가격차트</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
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
					<div class="x_content" id="notice">
						<div class="dashboard_graph">
							<canvas id="price_canvas" style="height: 400px;"></canvas>

							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
			<!-- /가격차트 -->

			<!-- 가격top5 -->
			<div class="col-md-4 col-sm-4">
				<div class="x_panel tile fixed_height_600">
					<div class="x_title">
						<h2>가격top5</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
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
					<div class="x_content" id="notice">
						<table class="table" style="height: 400px;">
							<tbody>
								<tr>
									<th>재료명</th>
									<th>단 위</th>
									<th>가 격</th>
									<th>가격 증감률</th>
								</tr>
								<c:forEach var="plist" items="${plist}">
									<tr>
										<td>${plist.food_name}</td>
										<td>${plist.unit}</td>
										<td>${plist.food_price}</td>
										<td style="color: blue">${plist.price_percent} %▼</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /가격top5 -->

		<div class="row">
			<!-- 공지사항 -->
			<div class="col-md-6 col-sm-6">
				<div class="x_panel tile fixed_height_320">
					<div class="x_title">
						<h2>공지 사항</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
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
					<div class="x_content" id="notice"
						style="overflow: auto; height: 100%;">
						<h4>
							<a href="<%=request.getContextPath()%>/notice/list">모든공지 보러가기</a>
						</h4>
						<ul class="list-unstyled timeline widget">
							<c:forEach items="${inlist }" var="ndto">
								<li>
									<div class="block">
										<div class="block_content">
											<h2 class="title">
												<a href="notice/content?notice_id=${ndto.notice_id}">${ndto.notice_title}</a>
											</h2>
											<div class="byline">
												<span>${ndto.notice_writeday}</span> by <a>${ndto.notice_name}</a>
											</div>
											<p class="excerpt">
												${ndto.notice_content} <a
													href="notice/content?notice_id=${ndto.notice_id}">...Read&nbsp;More</a>
											</p>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!-- /공지사항 -->

			<!-- FAQ -->
			<div class="col-md-6 col-sm-6">
				<div class="x_panel tile fixed_height_320">
					<div class="x_title">
						<h2>FAQ</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
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
					<div class="x_content" id="notice"
						style="overflow: auto; height: 100%;">
						<h4>
							<a href="<%=request.getContextPath()%>/admin/fnq_list">모든 FAQ 보러가기</a>
						</h4>
						<ul class="list-unstyled timeline widget">
							<c:forEach items="${flist }" var="dto">
								<li>
									<div class="block">
										<div class="block_content">
											<h2 class="title">
												<a href="./admin/fnq_content?fnq_id=${dto.fnq_id}">${dto.fnq_question}</a>
											</h2>
											<div class="byline">
												by <a>${dto.fnq_name}</a>
											</div>
											<p class="excerpt">
												${dto.fnq_answer} <a
													href="./admin/fnq_content?fnq_id=${fnq_id}">...Read&nbsp;More</a>
											</p>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
						
						
					</div>
				</div>
			</div>
			<!-- /FAQ -->
		</div>
		<!-- row -->
	</div>
	<!-- 전체row -->
</div>
<!-- /page content -->

<!-- 트렌드 차트 -->
<script>
	window.chartColors = {
	red : 'rgb(255, 99, 132)',
	orange : 'rgb(255, 159, 64)',
	yellow : 'rgb(255, 205, 86)',
	green : 'rgb(75, 192, 192)',
	blue : 'rgb(54, 162, 235)',
	purple : 'rgb(153, 102, 255)',
	grey : 'rgb(201, 203, 207)',
	deepgray: '#73879c'
};

var label = new Array();
var trend_month_vol = new Array();
var trend_blog_vol = new Array();
var trend_view_vol = new Array();
<c:forEach var="dto" items="${tlist}">
label.push("${dto.trend_keyword}");
trend_month_vol.push("${dto.trend_month_vol}");
trend_blog_vol.push("${dto.trend_blog_vol}");
trend_view_vol.push("${dto.trend_view_vol}");
</c:forEach>

var barChartData = {
	labels : label,
	datasets : [ {
		label : '월간 검색량',
		backgroundColor : window.chartColors.deepgray,
		data : trend_month_vol
	}, {
		label : '블로그 월간 작성량',
		backgroundColor : window.chartColors.blue,
		data : trend_blog_vol
	}, {
		label : 'View 월간 작성량',
		backgroundColor : window.chartColors.green,
		data : trend_view_vol
	} ]

};
var ctx = document.getElementById('canvas').getContext('2d');
window.myBar = new Chart(ctx, {
	type : 'bar',
	data : barChartData,
	options : {
		title : {
			display : false,
			text : '음식 트렌드'
		},
		tooltips : {
			mode : 'index',
			intersect : false
		},
		responsive : false,
		scales : {
			xAxes : [ {
				stacked : true,
			} ],
			yAxes : [ {
				stacked : true
			} ]
		}
	}
});
</script>

<!-- 빠른식단 -->
<script type="text/javascript">
$(document).ready(function(){
	var returnValue;
	var url = location.href;
	var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
	var week_type = 1
	if (!isNaN(parameters[0].substring(10,11))){
		week_type = parameters[0].substring(10,11)
	} 
	
	$("input:radio[name='meal_age']:radio[value='"+week_type+"']").attr("checked",true);
	
	$('input').on('ifChecked', function(event){
		var people_id  = $(this).val()
		location.href = 'index?week_type='+people_id
	})
})
</script>

<!-- 가격차트 -->
<script>
var label = new Array();
var food1_price = new Array();
var food1_name= new Set();
<c:forEach var="food1" items="${food1}">
	label.push("${food1.price_date}");
	food1_price.push("${food1.food_price}");
	food1_name.add("${food1.food_name}");
</c:forEach>
food1_price=food1_price.reverse();
label=label.reverse();

var food2_price = new Array();
var food2_name= new Set();
<c:forEach var="food2" items="${food2}">
	food2_price.push("${food2.food_price}");
	food2_name.add("${food2.food_name}");
</c:forEach>
food2_price=food2_price.reverse();

var food3_price = new Array();
var food3_name= new Set();
<c:forEach var="food3" items="${food3}">
	food3_price.push("${food3.food_price}");
	food3_name.add("${food3.food_name}");
</c:forEach>
food3_price=food3_price.reverse();

var food4_price = new Array();
var food4_name= new Set();
<c:forEach var="food4" items="${food4}">
	food4_price.push("${food4.food_price}");
	food4_name.add("${food4.food_name}");
</c:forEach>
food4_price=food4_price.reverse();

var food5_price = new Array();
var food5_name= new Set();
<c:forEach var="food5" items="${food5}">
	food5_price.push("${food5.food_price}");
	food5_name.add("${food5.food_name}");
</c:forEach>
food5_price=food5_price.reverse();

new Chart(document.getElementById("price_canvas"),
		{"type":"line",
		"data":{"labels":label,
			"datasets":[{"label":food1_name.values().next().value,"data":food1_price,"fill":false,"borderColor":"#17a2b8","lineTension":0.1},
			{"label":food2_name.values().next().value,"data":food2_price,"fill":false,"borderColor":"#20c997","lineTension":0.1},
			{"label":food3_name.values().next().value,"data":food3_price,"fill":false,"borderColor":"#fd7e14","lineTension":0.1},
			{"label":food4_name.values().next().value,"data":food4_price,"fill":false,"borderColor":"#e83e8c","lineTension":0.1},
			{"label":food5_name.values().next().value,"data":food5_price,"fill":false,"borderColor":"#6f42c1","lineTension":0.1},
			]},
		"options":{title: {display:true, text:"저렴해진 재료 추천 top5"},responsive:false, 
			legend: {position:'right',"labels":{padding:20}} }});
	/* window.onload=function aa(){
		alert(food1_name.size);
	}  */
	
/* 나에게 필요한 필수영양소 비율 차트*/
Chart.defaults.global.maintainAspectRatio = false;
Chart.defaults.global.legend.labels.fontStyle = "italic";

var ctx = $("#pie-chart");
var pieLabels = ["탄수화물", "단백질", "지방"];
var pieData = [100,50,80];
var pieColors = [
  "#3498DB",
  "#E74C3C",
  "#26B99A",
];

var ctx2 = $("#pie-chart2");
var pieChart2 = new Chart(ctx2, {
  type: 'doughnut',
  data: {
    labels: pieLabels,
    datasets: [
      {
        data: pieData,
        backgroundColor: pieColors,
        borderColor: "transparent"
      }
    ]
  },
  options: {
    legend: {
      labels: {
        fontColor: "#73879C"
      }
    },    
    cutoutPercentage: 50
  }
});

$('input').change(function(){
   var userCheck = $(this).val();
  if(userCheck == '0'){
    addData(pieChart2,pieLabels0,pieData0);
  } else if(userCheck == '1'){
    addData(pieChart2,pieLabels1,pieData1);
  }else if(userCheck == '2'){
    addData(pieChart2,pieLabels2,pieData2);
  }else if(userCheck == '3'){
    addData(pieChart2,pieLabels3,pieData3);
  }else if(userCheck == '4'){
	  addData(pieChart2,pieLabels4,pieData4);
  }else if(userCheck == '5'){
    addData(pieChart2,pieLabels5,pieData5);
  }else if(userCheck == '6'){
    addData(pieChart2,pieLabels6,pieData6);
  }else if(userCheck == '7'){
    addData(pieChart2,pieLabels7,pieData7);
  }else if(userCheck == '8'){
    addData(pieChart2,pieLabels8,pieData8);
  }else if(userCheck == '9'){
    addData(pieChart2,pieLabels9,pieData9);
  }else if(userCheck == '10'){
    addData(pieChart2,pieLabels10,pieData10);
  }else if(userCheck == '11'){
    addData(pieChart2,pieLabels11,pieData11);
  }else if(userCheck == '12'){
    addData(pieChart2,pieLabels12,pieData12);
  }else if(userCheck == '13'){
    addData(pieChart2,pieLabels13,pieData13);
  }else if(userCheck == '14'){
    addData(pieChart2,pieLabels14,pieData14);
  }
});

var pieLabels0 = ["탄수화물", "단백질", "지방"];
var pieData0 = [100,25,20];
var pieLabels1= ["탄수화물", "단백질", "지방"];
var pieData1 = [100,65,30];
var pieLabels2= ["탄수화물", "단백질", "지방"];
var pieData2 = [100,55,25];
var pieLabels3 = ["탄수화물", "단백질", "지방"];
var pieData3 = [100,65,30];
var pieLabels4 = ["탄수화물", "단백질", "지방"];
var pieData4 = [100,50,25];
var pieLabels5 = ["탄수화물", "단백질", "지방"];
var pieData5 = [100,65,30];
var pieLabels6 = ["탄수화물", "단백질", "지방"];
var pieData6 = [100,50,20];
var pieLabels7 = ["탄수화물", "단백질", "지방"];
var pieData7 = [100,65,30];
var pieLabels8 = ["탄수화물", "단백질", "지방"];
var pieData8 = [100,50,20];
var pieLabels9 = ["탄수화물", "단백질", "지방"];
var pieData9 = [100,65,30];
var pieLabels10 = ["탄수화물", "단백질", "지방"];
var pieData10 = [100,50,25];
var pieLabels11 = ["탄수화물", "단백질", "지방"];
var pieData11 = [100,60,30];
var pieLabels12 = ["탄수화물", "단백질", "지방"];
var pieData12 = [100,50,20];
var pieLabels13 = ["탄수화물", "단백질", "지방"];
var pieData13 = [130,85,20];
var pieLabels14 = ["탄수화물", "단백질", "지방"];
var pieData14 = [130,85,25];

function addData(chart, label, data) {
    chart.data.labels = label;
    chart.data.datasets.forEach((dataset)=>{ //df
        dataset.data=data;
    });
    chart.update();
}
</script>
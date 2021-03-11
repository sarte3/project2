<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/chartjs/dist/Chart.js"></script>

<!-- page content -->
<div class="right_col" role="main">
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
				<div class="x_content">
					<div class="">
						<ul class="to_do">
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "0" onclick='getTargetMeal(this.value)'> 성장기
									어린이
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "1" onclick='getTargetMeal(this.value)'>활동량
									많은 청소년
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "2" onclick='getTargetMeal(this.value)'>성인 젊은
									남성
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "3" onclick='getTargetMeal(this.value)'> 성인 젊은
									여성
							</li>
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "4" onclick='getTargetMeal(this.value)'>저염식
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "5" onclick='getTargetMeal(this.value)'>임신부
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "6" onclick='getTargetMeal(this.value)'>고단백
									저칼로리
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "7" onclick='getTargetMeal(this.value)'>노인
									건강식
								</p>
							</li>
							<li>
								<p>
									<input type="radio" name="meal_age" class="flat"
									value = "8" onclick='getTargetMeal(this.value)'>유기농
									야채식
								</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div id='result'></div>

			<!-- 주간식단표 -->
			<div class="col-md-8 col-sm-8 col-xs-12" height="800">
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
									<b>3월 2째주</b>, 07:30 AM
								</div>
							</div>
						</div>

						<div class="row weather-days">
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Mon</h2>
									<h3 class="degrees">25</h3>
									<canvas id="clear-day" width="32" height="32"></canvas>
									<h3 class="day">아침</h3>
									<h6>${meal1.food_1}</h6>
									<h6>${meal1.food_2}</h6>
									<h6>${meal1.food_3}</h6>
									<h6>${meal1.food_4}</h6>
									<h6>${meal1.food_5}</h6>
									<h6>${meal1.food_6}</h6>
									<h3 class="day">점심</h3>
									<h6>${meal2.food_1}</h6>
									<h6>${meal2.food_2}</h6>
									<h6>${meal2.food_3}</h6>
									<h6>${meal2.food_4}</h6>
									<h6>${meal2.food_5}</h6>
									<h6>${meal2.food_6}</h6>
									<h3 class="day">저녁</h3>
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
									<h3 class="degrees">25</h3>
									<canvas height="32" width="32" id="rain"></canvas>

								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Wed</h2>
									<h3 class="degrees">27</h3>
									<canvas height="32" width="32" id="snow"></canvas>
								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Thu</h2>
									<h3 class="degrees">28</h3>
									<canvas height="32" width="32" id="sleet"></canvas>

								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Fri</h2>
									<h3 class="degrees">28</h3>
									<canvas height="32" width="32" id="wind"></canvas>

								</div>
							</div>
							<div class="col-sm-2">
								<div class="daily-weather">
									<h2 class="day">Sat</h2>
									<h3 class="degrees">26</h3>
									<canvas height="32" width="32" id="cloudy"></canvas>

								</div>
							</div>

							<div class="clearfix"></div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
</div>

<!-- 빠른식단 -->
<script>
	function getTargetMeal(e){
		alert(e)
		document.getElementById("result").innerText = e
	}
</script>

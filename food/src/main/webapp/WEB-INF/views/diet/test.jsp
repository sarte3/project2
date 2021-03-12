<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../resources/chartjs/dist/Chart.js"></script>
<script type="text/javascript">

/*빠른 식단 라디오버튼 함수*/
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
		location.href = 'test?week_type='+people_id
	})
})

</script>
<!-- page content -->
<div class="right_col" role="main">
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
								<input type="radio" name="meal_age" class="flat" value="1">
								<label for="0">성장기</label>
							</p>
						</li>
						<li>
							<p>
								<input type="radio" name="meal_age" class="flat" value="2">
								<label for="1">활동량많은 청소년</label>
							</p>
						</li>
						<li>
							<p>
								<input type="radio" name="meal_age" class="flat" value="3">
								<label for="2">성인 젊은 남성</label>
							</p>
						</li>
						<li>
							<p>
								<input type="radio" name="meal_age" class="flat" value="4"> 
								<label for="3">성인 젊은 여성</label>
						</li>
						<li>
							<p>
								<input type="radio" name="meal_age" class="flat" value="5">
								<label for="4">저염식</label>
							</p>
						</li>
						<li>
							<p>
								<input type="radio" name="meal_age" class="flat" value="6">
								<label for="5">임신부</label>
							</p>
						</li>
						<li>
							<p>
								<input type="radio" name="meal_age" class="flat" value="7">
								<label for="6">고단백 저칼로리</label>
							</p>
						</li>
						<li>
							<p>
								<input type="radio" name="meal_age" class="flat" value="8">
								<label for="7">노인 건강식</label>
							</p>
						</li>
						<li>
							<p>
								<input type="radio" name="meal_age" class="flat" value="9">
								<label for="8">유기농 야채식</label>
							</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

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
							<b>3월 2째주</b>
						</div>
					</div>
				</div>
				<!-- 
							<div class="row">
								<div class="col-sm-4">
									<div class="weather-icon">
										<canvas height="84" width="84" id="partly-cloudy-day"></canvas>
									</div>
								</div>
								<div class="col-sm-8">
									<div class="weather-text">
										<h2>
											Texas <br> <i>Partly Cloudy Day</i>
										</h2>
									</div>
								</div>
							</div>
							 
							<div class="col-sm-12">
								<div class="weather-text pull-right">
									<h3 class="degrees">23</h3>
								</div>
							</div>

							<div class="clearfix"></div>
							-->
				<div class="row weather-days">
					<div class="col-sm-2">
						<div class="daily-weather">
							<h2 class="day">Mon</h2>
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
							<h3 class="day">아침</h3>
							<h6>${meal4.food_1}</h6>
							<h6>${meal4.food_2}</h6>
							<h6>${meal4.food_3}</h6>
							<h6>${meal4.food_4}</h6>
							<h6>${meal4.food_5}</h6>
							<h6>${meal4.food_6}</h6>
							<h3 class="day">점심</h3>
							<h6>${meal5.food_1}</h6>
							<h6>${meal5.food_2}</h6>
							<h6>${meal5.food_3}</h6>
							<h6>${meal5.food_4}</h6>
							<h6>${meal5.food_5}</h6>
							<h6>${meal5.food_6}</h6>
							<h3 class="day">저녁</h3>
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
							<h3 class="day">아침</h3>
							<h6>${meal7.food_1}</h6>
							<h6>${meal7.food_2}</h6>
							<h6>${meal7.food_3}</h6>
							<h6>${meal7.food_4}</h6>
							<h6>${meal7.food_5}</h6>
							<h6>${meal7.food_6}</h6>
							<h3 class="day">점심</h3>
							<h6>${meal8.food_1}</h6>
							<h6>${meal8.food_2}</h6>
							<h6>${meal8.food_3}</h6>
							<h6>${meal8.food_4}</h6>
							<h6>${meal8.food_5}</h6>
							<h6>${meal8.food_6}</h6>
							<h3 class="day">저녁</h3>
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
							<h3 class="day">아침</h3>
							<h6>${meal10.food_1}</h6>
							<h6>${meal10.food_2}</h6>
							<h6>${meal10.food_3}</h6>
							<h6>${meal10.food_4}</h6>
							<h6>${meal10.food_5}</h6>
							<h6>${meal10.food_6}</h6>
							<h3 class="day">점심</h3>
							<h6>${meal11.food_1}</h6>
							<h6>${meal11.food_2}</h6>
							<h6>${meal11.food_3}</h6>
							<h6>${meal11.food_4}</h6>
							<h6>${meal11.food_5}</h6>
							<h6>${meal11.food_6}</h6>
							<h3 class="day">저녁</h3>
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
							<h3 class="day">아침</h3>
							<h6>${meal13.food_1}</h6>
							<h6>${meal13.food_2}</h6>
							<h6>${meal13.food_3}</h6>
							<h6>${meal13.food_4}</h6>
							<h6>${meal13.food_5}</h6>
							<h6>${meal13.food_6}</h6>
							<h3 class="day">점심</h3>
							<h6>${meal14.food_1}</h6>
							<h6>${meal14.food_2}</h6>
							<h6>${meal14.food_3}</h6>
							<h6>${meal14.food_4}</h6>
							<h6>${meal14.food_5}</h6>
							<h6>${meal14.food_6}</h6>
							<h3 class="day">저녁</h3>
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
							<h3 class="day">아침</h3>
							<h6>${meal16.food_1}</h6>
							<h6>${meal16.food_2}</h6>
							<h6>${meal16.food_3}</h6>
							<h6>${meal16.food_4}</h6>
							<h6>${meal16.food_5}</h6>
							<h6>${meal16.food_6}</h6>
							<h3 class="day">점심</h3>
							<h6>${meal17.food_1}</h6>
							<h6>${meal17.food_2}</h6>
							<h6>${meal17.food_3}</h6>
							<h6>${meal17.food_4}</h6>
							<h6>${meal17.food_5}</h6>
							<h6>${meal17.food_6}</h6>
							<h3 class="day">저녁</h3>
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

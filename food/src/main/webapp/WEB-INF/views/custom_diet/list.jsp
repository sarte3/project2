<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<style TYPE="text/css">
td {
	color: #595959;
}

th {
	color: #000000;
}

select {
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
	
}

.navigation {
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.calendar_body .today {
	border: 1px solid white;
	height: 120px;
	background-color: #c9c9c9;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}

.diet {
	
}
</style>
</head>
<body>
	<div id="section" class="right_col">
		<h1>식단 달력</h1>
		<div class="col-md-6">

			<!--날짜 네비게이션  -->
			<div class="navigation">
				<a class="before_after_year"
					href="./list?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
					&lt;&lt; <!-- 이전해 -->
				</a> <a class="before_after_month"
					href="./list?year=${today_info.before_year}&month=${today_info.before_month}">
					&lt; <!-- 이전달 -->
				</a> <span class="this_month"> &nbsp;${today_info.search_year}. <c:if
						test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span> <a class="before_after_month"
					href="./list?year=${today_info.after_year}&month=${today_info.after_month}">
					<!-- 다음달 --> &gt;
				</a> <a class="before_after_year"
					href="./list?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
					<!-- 다음해 --> &gt;&gt;
				</a>
			</div>

			<!-- <div class="today_button_div"> -->
			<!-- <input type="button" class="today_button" onclick="javascript:location.href='/calendar.do'" value="go today"/> -->
			<!-- </div> -->
			<table class="calendar_body">

				<thead>
					<tr bgcolor="#CECECE">
						<td class="day sun">일</td>
						<td class="day">월</td>
						<td class="day">화</td>
						<td class="day">수</td>
						<td class="day">목</td>
						<td class="day">금</td>
						<td class="day sat">토</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="dateList" items="${dateList}"
							varStatus="date_status">
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<c:if test="${dateList.diet_type!=null }">
										<td class="today"
											onclick="location='list?y=${dateList.year}&m=${dateList.month}&d=${dateList.date}'">
											<div class="date">${dateList.date}</div>
											<div>${dateList.diet_type }</div>
										</td>
									</c:if>
									<c:if test="${dateList.diet_type==null }">
										<td class="today">
											<div class="date">${dateList.date}</div>
											<div>${dateList.diet_type }</div>
										</td>
									</c:if>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<c:if test="${dateList.diet_type!=null }">
										<td class="sat_day"
											onclick="location='list?y=${dateList.year}&m=${dateList.month}&d=${dateList.date}'">
											<div class="sat">${dateList.date}</div>
											<div>${dateList.diet_type }</div>
										</td>
									</c:if>
									<c:if test="${dateList.diet_type==null }">
										<td class="sat_day">
											<div class="sat">${dateList.date}</div>
											<div>${dateList.diet_type }</div>
										</td>
									</c:if>
								</c:when>
								<c:when test="${date_status.index%7==0}">
					</tr>
					<tr>
						<c:if test="${dateList.diet_type!=null }">
							<td class="sun_day"
								onclick="location='list?y=${dateList.year}&m=${dateList.month}&d=${dateList.date}'">
								<div class="sun">${dateList.date}</div>
								<div>${dateList.diet_type }</div>
							</td>
						</c:if>
						<c:if test="${dateList.diet_type==null }">
							<td class="sun_day">
								<div class="sun">${dateList.date}</div>
								<div>${dateList.diet_type }</div>
							</td>
						</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${dateList.diet_type!=null }">
								<td class="normal_day"
									onclick="location='list?y=${dateList.year}&m=${dateList.month}&d=${dateList.date}'">
									<div class="date">${dateList.date}</div>
									<div>${dateList.diet_type }</div>
								</td>
							</c:if>
							<c:if test="${dateList.diet_type==null }">
								<td class="normal_day">
									<div class="date">${dateList.date}</div>
									<div>${dateList.diet_type }</div>
								</td>
							</c:if>
						</c:otherwise>
						</c:choose>
						</c:forEach>
				</tbody>

			</table>
		</div>
		<div class="col-md-6">
			<c:if test="${dayList!=null}">

				<table class="table">
					<tbody>
						<tr>
							<th scope="row">날짜</th>
							<th scope="row">구분</th>
							<th scope="row">주식</th>
							<th scope="row">국물</th>
							<th scope="row">반찬1</th>
							<th scope="row">반찬2</th>
							<th scope="row">반찬3</th>
							<th scope="row">부식</th>
							<th scope="row"></th>
						</tr>
						<c:forEach var="dto" items="${dayList }">
							<tr>
								<td>${dto.diet_day }</td>
								<td>${dto.diet_type }</td>
								<td>${dto.main }</td>
								<td>${dto.soup }</td>
								<td>${dto.sub1 }</td>
								<td>${dto.sub2 }</td>
								<td>${dto.sub3 }</td>
								<td>${dto.sub4 }</td>
								<td><button type="button" class="btn btn-primary"
										onclick="location='./update?id=${dto.id}'">수정</button>
									<button type="button" class="btn btn-danger"
										onclick="location='./delete?id=${dto.id}'">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</c:if>
		</div>
	</div>
</body>
</html>

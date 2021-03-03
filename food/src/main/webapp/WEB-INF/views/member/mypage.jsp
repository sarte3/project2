<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> -->
<div id="section" class="right_col">
	<h1>마이 페이지</h1>
	<table class="table">
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td>${dto.userid}</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>${dto.name}</td>
			</tr>
			<tr>
				<th scope="row">이메일</th>
				<td>${dto.email}</td>
			</tr>
			<tr>
				<th scope="row">핸드폰</th>
				<td>${dto.phone}</td>
			</tr>
			<tr>
				<th scope="row">나이</th>
				<td>${dto.age}</td>
			</tr>
		</tbody>
	</table>
	<div class="d-grid gap-2" style="text-align:right;">
  		<button class="btn btn-primary" type="button" onclick="location='mypage_update'">정보 수정</button>
  		<button class="btn btn-danger" type="button" onclick="location='member_out'">회원 탈퇴</button>
	</div>
</div>

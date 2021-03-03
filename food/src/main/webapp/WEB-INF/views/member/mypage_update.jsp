<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>회원 정보 수정</h1>
	<form method="post" name="frm" action="mypage_update_ok">
		<div class="mb-3">
			<label for="userid" class="form-label">아이디</label>
			<input type="text" class="form-control" id="userid" name="userid" value="${dto.userid }">
		</div>
		<div class="mb-3">
			<label for="pwd1" class="form-label">비밀번호</label>
			<input type="password" class="form-control"
				id="pwd1" name="pwd">
		</div>
		<div class="mb-3">
			<label for="pwd2" class="form-label">비밀번호 확인</label>
			<input type="password" class="form-control"
				id="pwd2" name="pwd2">
		</div>
			<div class="mb-3">
			<label for="name" class="form-label">이름</label>
			<input type="text" class="form-control"
				id="name" name="name" value="${dto.name }">
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label>
			<input type="text" class="form-control"
				id="email" name="email" value="${dto.email}">
		</div>
		<div class="mb-3">
			<label for="phone" class="form-label">핸드폰</label>
			<input type="text" class="form-control"
				id="phone" name="phone" value="${dto.phone }">
		</div>
		<div class="mb-3">
			<label for="age" class="form-label">나이</label>
			<input type="text" class="form-control"
				id="age" name="age" value="${dto.age }">
		</div>
		<div class="d-grid gap-2" style="text-align:right;">
  			<button class="btn btn-primary" type="submit">정보 수정</button>
  			<button class="btn" type="reset">다시 작성</button>
		</div>
	</form>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#section{
	width:1200px;
	margin:auto;
}
</style>
<div id="section">
	<h1>회원 가입</h1>
	<form>
		<div class="mb-3">
			<label for="userid" class="form-label">아이디</label> 
			<input type="text" class="form-control" id="userid" name="userid">
		</div>
		<div class="mb-3">
			<label for="pwd1" class="form-label">비밀번호</label>
			<input type="password" class="form-control" id="pwd1" name="pwd">
		</div>
		<div class="mb-3">
			<label for="pwd1" class="form-label">비밀번호 확인</label>
			<input type="password" class="form-control" id="pwd1" name="pwd">
		</div>
		<div class="mb-3 form-check">
			<input type="checkbox" class="form-check-input" id="check">
			<label class="form-check-label" for="check">약관에 동의합니다</label>
		</div>
		<button type="submit" class="btn btn-primary">가입하기</button>
	</form>
</div>
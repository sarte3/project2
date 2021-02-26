<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="section">
	<h1>로그인</h1>
	<form method="post" name="frm" action="login_ok">
		<div class="mb-3">
			<label for="userid" class="form-label">아이디</label>
			<input type="text" class="form-control" id="userid" name="userid">
		</div>
		<div class="mb-3">
			<label for="pwd1" class="form-label">비밀번호</label>
			<input type="password" class="form-control"
				id="pwd1" name="pwd">
		</div>
		<c:if test="${chk==1}">
			<div id="login_check" class="form-text">
	  			아이디 혹은 비밀번호를 확인해주세요!
			</div>
		</c:if>
		<div class="d-grid gap-2">
  			<button class="btn btn-primary" type="submit">로그인</button>
		</div>
	</form>
</div>
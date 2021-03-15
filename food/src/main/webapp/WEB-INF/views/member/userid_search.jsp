<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="section" class="right_col">
	<h1>아이디 찾기</h1>
	<form method="post" name="frm" action="userid_view">
		<div class="mb-3">
			<label for="name" class="form-label">이름</label>
			<input type="text" class="form-control" id="name" name="name">
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label>
			<input type="text" class="form-control"
				id="email" name="email">
		</div>
		<div class="d-grid gap-2"  style="text-align:right;">
  			<button class="btn btn-primary" type="submit">아이디 찾기</button>
		</div>
	</form>
</div>
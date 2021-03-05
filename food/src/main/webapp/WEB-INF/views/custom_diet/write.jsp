<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>나만의 식단 짜기</h1>
	<form method="post" name="frm" action="custom_diet_write_ok">
		<input type="hidden" value="${userid}" name="userid">
		<div class="mb-3">
			<label for="main" class="form-label">주식</label> <input
				type="text" class="form-control" id="main"
				name="main">
		</div>
		<div class="mb-3">
			<label for="soup" class="form-label">국물</label> <input
				type="text" class="form-control" id="soup"
				name="soup">
		</div>
		<div class="mb-3">
			<label for="sub1" class="form-label">반찬1</label> <input
				type="text" class="form-control" id="sub1"
				name="sub1">
		</div>
		<div class="mb-3">
			<label for="sub2" class="form-label">반찬2</label> <input
				type="text" class="form-control" id="sub2"
				name="sub2">
		</div>
		<div class="mb-3">
			<label for="sub3" class="form-label">반찬3</label> <input
				type="text" class="form-control" id="sub3"
				name="sub3">
		</div>
		<jsp:include page="calendar.jsp"></jsp:include>
		
		<div class="d-grid gap-2" style="text-align: right;">
			<button class="btn btn-primary" type="submit">자주 묻는 질문과 답 입력</button>
		</div>
	</form>
</div></html>
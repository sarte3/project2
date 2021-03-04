<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>공지사항 입력</h1>
	<form method="post" name="frm" action="notice_write_ok">
		<div class="mb-3">
			<label for="notice_title" class="form-label">제목</label> <input
				type="text" class="form-control" id="notice_title"
				name="notice_title">
		</div>
		<div class="mb-3">
			<label for="notice_name" class="form-label">작성자</label> <input
				type="text" class="form-control" id="notice_name" name="notice_name">
		</div>
		<div class="mb-3">
			<label for="notice_content" class="form-label">내용</label>
			<textarea class="form-control" id="notice_content" name="notice_content" 
				rows="10"></textarea>
		</div>
		<div class="d-grid gap-2" style="text-align: right;">
			<button class="btn btn-primary" type="submit">공지사항 입력</button>
		</div>
	</form>
</div>
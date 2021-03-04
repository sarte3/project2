<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
<h1>공지사항 상세보기</h1>
	<table class="table">
		<tbody>
			<tr>
				<th>제목</th>
				<td>${dto.notice_title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.notice_name }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.notice_content }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.notice_writeday }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${dto.notice_readnum }</td>
			</tr>
			<tr>
			<td colspan="2">
			<div id="btn">
			<button type="button" class="btn btn-primary"
							onclick="location='/food/admin/notice_update?notice_id=${dto.notice_id}'">수정</button>
						<button type="button" class="btn btn-danger"
							onclick="location='/food/admin/notice_delete?notice_id=${dto.notice_id}'">삭제</button>
			</div>
			</td>
			</tr>
		</tbody>
	</table>
</div>
<style>
#btn{
	width:200px;
	margin:auto;
}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
<h1>자주묻는 질문 상세보기</h1>
	<table class="table">
		<tbody>
			<tr>
				<th>질문유형</th>
				<td>${dto.fnq_type }</td>
			</tr>
			<tr>
				<th>질문</th>
				<td>${dto.fnq_question }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.fnq_answer }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.fnq_name }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.fnq_writeday }</td>
			</tr>
			<tr>
			<td colspan="2">
			<div id="btn">
			<button type="button" class="btn btn-primary"
							onclick="location='/food/admin/fnq_update?fnq_id=${dto.fnq_id}'">수정</button>
						<button type="button" class="btn btn-danger"
							onclick="location='/food/admin/fnq_delete?fnq_id=${dto.fnq_id}'">삭제</button>
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
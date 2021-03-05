<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>자주 묻는 질문 수정</h1>
	<form method="post" name="frm" action="fnq_update_ok">
		<input type="hidden" value="${dto.fnq_id}" name="fnq_id">
		<div class="mb-3">
			<label for="fnq_question" class="form-label">질문</label> <input
				type="text" class="form-control" id="fnq_question" value="${dto.fnq_question }"
				name="fnq_question">
		</div>
		<div class="mb-3">
		<label for="fnq_question" class="form-label">질문 유형</label>
			<select id="fnq_type" class="form-select form-select-lg" aria-label="fnq_type" name="fnq_type">
				<option value="회원가입">회원가입</option>
				<option value="레시피">레시피</option>
				<option value="식단">식단</option>
			</select>
		</div>
		<div class="mb-3">
			<label for="fnq_name" class="form-label">작성자</label> <input
				type="text" class="form-control" id="fnq_name" name="fnq_name" value="${dto.fnq_name}">
		</div>
		<div class="mb-3">
			<label for="fnq_answer" class="form-label">답변</label>
			<textarea class="form-control" id="fnq_answer" name="fnq_answer" 
				rows="10">${dto.fnq_answer}</textarea>
		</div>
		<div class="d-grid gap-2" style="text-align: right;">
			<button class="btn btn-primary" type="submit">자주 묻는 질문과 답 수정</button>
		</div>
	</form>
</div>
<script>
window.onload=function(){
	
	var type="${dto.fnq_type}"
	
	var fnq_type=document.getElementById('fnq_type')
	
	for(var i=0;i<fnq_type.options.length;i++)
	{
		if(fnq_type.options[i].value==type)
		{
			fnq_type.options[i].selected=true;	
		}
	}
}
</script>
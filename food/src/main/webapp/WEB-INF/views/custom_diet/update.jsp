<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>나만의 식단 수정</h1>
	<form method="post" name="frm" action="update_ok">
		<input type="hidden" value="${userid}" name="userid">
		<input type="hidden" value="${dto.id }" name="id">
		<div class="mb-3">
			<label for="main" class="form-label">날짜</label> <input
				type="date" class="form-control" id="diet_day"
				name="diet_day" value="${dto.diet_day}">
		</div>
		<div class="mb-3">
		<label for="diet_type" class="form-label">식사 유형</label>
			<select class="form-select form-select-lg" id="diet_type" aria-label="diet_type" name="diet_type">
				<option value="아침식사">아침식사</option>
				<option value="점심식사">점심식사</option>
				<option value="저녁식사">저녁식사</option>
			</select>
		</div>
		<div class="mb-3">
			<label for="main" class="form-label">주식</label> <input
				type="text" class="form-control" id="main"
				name="main" value="${dto.main}">
		</div>
		<div class="mb-3">
			<label for="soup" class="form-label">국물</label> <input
				type="text" class="form-control" id="soup"
				name="soup" value="${dto.soup}">
		</div>
		<div class="mb-3">
			<label for="sub1" class="form-label">반찬1</label> <input
				type="text" class="form-control" id="sub1"
				name="sub1" value="${dto.sub1}">
		</div>
		<div class="mb-3">
			<label for="sub2" class="form-label">반찬2</label> <input
				type="text" class="form-control" id="sub2"
				name="sub2" value="${dto.sub2}">
		</div>
		<div class="mb-3">
			<label for="sub3" class="form-label">반찬3</label> <input
				type="text" class="form-control" id="sub3"
				name="sub3" value="${dto.sub3}">
		</div>
		<div class="mb-3">
			<label for="sub4" class="form-label">부식</label> <input
				type="text" class="form-control" id="sub4"
				name="sub4" value="${dto.sub4}">
		</div>
		
		<div class="d-grid gap-2" style="text-align: right;">
			<button class="btn btn-primary" type="submit">식단 수정</button>
		</div>
	</form>
</div>
<script>
window.onload=function(){
	
	var type="${dto.diet_type}"
	
	var fnq_type=document.getElementById('diet_type')
	
	for(var i=0;i<fnq_type.options.length;i++)
	{
		if(fnq_type.options[i].value==type)
		{
			fnq_type.options[i].selected=true;	
		}
	}
}
</script>
<!-- CSS , JS -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

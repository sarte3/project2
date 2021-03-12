<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="section" class="right_col">
	<h1>회원 가입</h1>
	<form method="post" name="frm" action="member_ok">
		<div class="mb-3">
			<label for="userid" class="form-label">아이디</label>
			<input type="text" class="form-control" id="userid" name="userid" onblur="userid_dupcheck(this.value)">
			<span class="mb-3" id="uid">
			
			</span>
		</div>
		<div class="mb-3">
			<label for="pwd1" class="form-label">비밀번호</label>
			<input type="password" class="form-control"
				id="pwd1" name="pwd">
		</div>
		<div class="mb-3">
			<label for="pwd2" class="form-label">비밀번호 확인</label>
			<input type="password" class="form-control"
				id="pwd2" name="pwd2" onblur="pw_check()">
			<span class="mb-3" id=pw>
			
			</span>
		</div>
			<div class="mb-3">
			<label for="name" class="form-label">이름</label>
			<input type="text" class="form-control"
				id="name" name="name">
		</div>
		<div class="mb-3">
			<label for="email" class="form-label">이메일</label>
			<input type="text" class="form-control"
				id="email" name="email" onblur="email_dupcheck(this.value)">
			<span class="mb-3" id="ema">
			
			</span>
		</div>
		<div class="mb-3">
			<label for="phone" class="form-label">핸드폰</label>
			<input type="text" class="form-control"
				id="phone" name="phone">
		</div>
		<div class="mb-3">
			<label for="age" class="form-label">나이</label>
			<input type="text" class="form-control"
				id="age" name="age">
		</div>
		<div class="mb-3 form-check">
			<input type="checkbox" class="form-check-input" id="check1">
			<label class="form-check-label" for="check1">약관에 동의합니다</label>
		</div>
		<div class="d-grid gap-2" style="text-align:right;">
  			<button class="btn btn-primary" type="submit">회원 가입</button>
		</div>
	</form>
</div>
<script>

function pw_check()
{
	pw1 = document.getElementById('pw1').value;
	pw2 = document.getElementById('pw2').value;
	
	if(pw1==pw2){
		document.getElementById('pw').innerText='비밀번호가 일치합니다';		
	}
	else{
		document.getElementById('pw').innerText='비밀번호를 확인해주세요';		
	}
}

function userid_dupcheck(value)
{
	 
	   var chk=new XMLHttpRequest();
	   chk.open("get","userid_dupcheck?userid="+value);
	   chk.send();
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState==4) // 동작이 완료되면
		   {
		         if(chk.responseText==0) // 레코드가 없다 => 사용가능
		         {
		        	 document.getElementById("uid").innerText="사용 가능한 아이디입니다 ";
		        	 document.getElementById("uid").style.color="blue";
		        	 form.userid_chk.value=1;
		         }
		         else
		         {
		        	 document.getElementById("uid").innerText="사용 불가능한 아이디입니다 ";
		        	 document.getElementById("uid").style.color="red";
		        	 form.userid_chk.value=0;
		         }
		   }	   
	   }
}

function email_dupcheck(value)
{
	   var chk=new XMLHttpRequest();
	   chk.open("get","email_dupcheck?email="+value);
	   chk.send();
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState==4)
		   {
			   if(chk.responseText==0)
		         {
		        	 document.getElementById("ema").innerText="사용 가능한 이메일입니다 ";
		        	 document.getElementById("ema").style.color="blue";
		        	 form.email_chk.value=1;
		         }
		         else
		         {
		        	 document.getElementById("ema").innerText="다른 이메일을 입력해주세요 ";
		        	 document.getElementById("ema").style.color="red";
		        	 form.email_chk.value=0;
		         } 
		   }	   
	   }
}
</script>
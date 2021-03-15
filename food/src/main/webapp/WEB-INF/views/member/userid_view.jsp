<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="section" class="right_col">
	<h1>아이디 찾기</h1>
	<c:if test="${chk == 1}">
		<div id="txt">
			<h2 align="center">
				고객님의 아이디 찾기가 완료되었습니다!
			</h2>
			<h2 align="center">아이디 ${userid}</h2> <p>
		</div>
   		
		<div class="d-grid gap-2" style="text-align: right;">
			<button class="btn btn-primary" type="button"
				onclick="location='./login'">로그인</button>
		</div>
	</c:if>
	<c:if test="${chk == 2}">
		<div id="txt">
			<h2 align="center">
				고객님께서 입력하신 정보가 정확한지 확인후 다시 시도해 주세요
			</h2>
		</div>
		<div class="d-grid gap-2" style="text-align: right;">
			<button class="btn btn-primary" type="button"
				onclick="location='./userid_search'">아이디 다시 찾기</button>
		</div>
	</c:if>
</div>
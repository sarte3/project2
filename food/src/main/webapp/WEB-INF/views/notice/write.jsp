<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form method="post" action="write_ok">
    공지제목<input type="text" name="notice_title"><p>
    공지내용<textarea cols="60" rows="30"  name="notice_content"></textarea><p>
    공지관리자이름<input type="text" name="notice_name"><p>
    공지첨부파일<input multiple="multiple" type="file" name="notice_file"><p>
  <button>저장</button>
</form>
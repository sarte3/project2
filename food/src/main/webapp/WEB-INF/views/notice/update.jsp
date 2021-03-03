<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="right_col">
<div align="center">
<form  method="post" action="update_ok" enctype="multipart/form-data" >
  <input type="hidden" name="notice_id" value="${ndto.notice_id}"> 
    공지제목<input type="text" name="notice_title" width="100" value="${ndto.notice_title}"><p>
    공지내용<textarea cols="60" rows="30"  name="notice_content" width="300" >${ndto.notice_content}</textarea><p>
    공지관리자이름<input type="text" name="notice_name" width="100" value="${ndto.notice_name}"><p>
    공지첨부파일<input type="file" name="notice_file" width="100"/><p>
  <input type="submit" value="수정하기" />
</form>
</div>
</div>
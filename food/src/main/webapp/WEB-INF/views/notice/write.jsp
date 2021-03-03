<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div align="center">
<form  method="post" action="write_ok" enctype="multipart/form-data">
    공지제목<input type="text" name="notice_title" width="100"><p>
    공지내용<textarea cols="60" rows="30"  name="notice_content" width="300"></textarea><p>
    공지관리자이름<input type="text" name="notice_name" width="100"><p>
    공지첨부파일<input type="file" name="notice_file" width="100"/><p>
  <input type="submit" value="공지하기" />
</form>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
  <table width="600" align="center" border="1">
   <tr>
     <td width="90"> 제목 </td> <td> ${ndto.notice_title} </td>
   </tr> 
   <tr>
     <td> 이름 </td> <td> ${ndto.notice_name} </td>
   </tr>
   <tr height="300">
     <td> 내용 </td> <td> ${ndto.notice_content} </td>
   </tr>
   <tr>
     <td> 조회수 </td> <td> ${ndto.notice_readnum} </td>
   </tr>
   <tr>
     <td> 작성일 </td> <td> ${ndto.notice_writeday} </td>
   </tr>
   <tr>
     <td colspan="2"> 
      <a href="update?id=${ndto.notice_id}"> 수정 </a>
      <a href="#" onclick="del()"> 삭제 </a>
      <a href="list"> 목록 </a>
     </td>
   </tr>

   </table>
   

package kr.co.food.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.food.dao.NoticeDao;
import kr.co.food.dto.NoticeDto;


@Controller
public class NoticeController {


@Autowired
public SqlSession sqlSession;

@RequestMapping("/notice/write")
public String write() {
	return "/notice/write";
}
@RequestMapping("/notice/write_ok")
public String pwrite_ok(HttpServletRequest request,NoticeDto ndto) throws IOException 
{
	String path=request.getRealPath("/resources/noticeimg");
	int max=1024*1024*10;
	MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());	
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);		
	//request된 값을 dto클래스에 setNotice_ter하기
	 ndto.setNotice_title(multi.getParameter("notice_title"));
     ndto.setNotice_content(multi.getParameter("notice_content"));
     ndto.setNotice_name(multi.getParameter("notice_name"));
     ndto.setNotice_type(multi.getParameter("notice_type"));
     ndto.setNotice_file(multi.getFilesystemName("notice_file"));
	
     ndao.write_ok(ndto);
	return "redirect:/notice/list";
}
@RequestMapping("/notice/list")
public String list(Model model) {
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
	ArrayList<NoticeDto>list=ndao.list();
	model.addAttribute("list",list);
	return "/notice/list";
	
	
}
@RequestMapping("/notice/readnum")
public String list(HttpServletRequest request)
{
	String notice_id=request.getParameter("notice_id");
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
	ndao.readnum(notice_id);
	return "redirect:/notice/content?notice_id="+notice_id;
}
@RequestMapping("/notice/content")
public String content(Model model,HttpServletRequest request)
{
	String notice_id=request.getParameter("notice_id");
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
	ndao.readnum(notice_id);
	NoticeDto ndto=ndao.content(notice_id);
	model.addAttribute("ndto",ndto);

	return "/notice/content";
}
@RequestMapping("/notice/update")
public String update(Model model,HttpServletRequest request)
{
	String notice_id=request.getParameter("notice_id");
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
	NoticeDto ndto=ndao.update(notice_id);
	model.addAttribute("ndto",ndto);
	return "/notice/update";
}

@RequestMapping("/notice/update_ok")
public String update_ok(NoticeDto ndto) 
{
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
	ndao.update_ok(ndto);
	return "redirect:/notice/content?notice_id="+ndto.getNotice_id();
}
@RequestMapping("/notice/delete")
public String delete(HttpServletRequest request)
{
	String notice_id=request.getParameter("notice_id");
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
	return "redirect:/notice/content?notice_id="+notice_id;
	}
}


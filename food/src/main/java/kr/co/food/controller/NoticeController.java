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
import kr.co.food.dao.TrendDao;
import kr.co.food.dto.NoticeDto;
import kr.co.food.dto.TrendDto;


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
	String path=request.getRealPath("resources/noticeimg");
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
     /*
		String notice_title=ndto.getNotice_title();
		String notice_content=ndto.getNotice_content();
		String notice_name=ndto.getNotice_name();
		String notice_type=ndto.getNotice_type();
		String notice_file=ndto.getNotice_file();
		
		for(int i=1; i<=2578; i++)
		{
		ndto.setNotice_title(notice_title+i);
		ndto.setNotice_content(notice_content+i);
		ndto.setNotice_name(notice_name+i);
		ndto.setNotice_type(notice_type+i);
		ndto.setNotice_file(notice_file+i);
		ndao.write_ok(ndto);
		}*/
	return "redirect:/notice/list";
}
@RequestMapping("/notice/list")
public String trend_list(Model model, HttpServletRequest req)
{
	NoticeDao ndao = sqlSession.getMapper(NoticeDao.class);
	int page,index;
	if(req.getParameter("page")==null)
	{
		index=0;
		page=1;
	}
	else
	{
		page=Integer.parseInt(req.getParameter("page"));
		index=(page-1)*10;
	}

	int pstart=page/10;
	if(page%10 ==0)
		pstart=pstart-1;
	pstart=(pstart*10)+1;
	int pend=pstart+9;

	String sword=req.getParameter("sword");
	if(sword==null)sword="";
	
	int chong=ndao.getCnt(sword);
	int page_cnt=chong/10;
	
	
	if(chong%10 !=0)
		page_cnt++;
	
	if(pend>page_cnt)
		pend=page_cnt;
	
	ArrayList<NoticeDto> list=ndao.list(sword, index);
	model.addAttribute("list",list);
	model.addAttribute("pend",pend);
	model.addAttribute("pstart",pstart);
	model.addAttribute("page",page);
	model.addAttribute("page_cnt",page_cnt);
	model.addAttribute("sword",sword);
	
	
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
public String update_ok(HttpServletRequest request,NoticeDto ndto) throws IOException 
{
	String path=request.getRealPath("/resources/noticeimg");
	int max=1024*1024*10;
	MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());	
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);		
	//request된 값을 dto클래스에 setNotice_ter하기
	ndto.setNotice_id(Integer.parseInt(multi.getParameter("notice_id")));
	 ndto.setNotice_title(multi.getParameter("notice_title"));
     ndto.setNotice_content(multi.getParameter("notice_content"));
     ndto.setNotice_name(multi.getParameter("notice_name"));
     ndto.setNotice_type(multi.getParameter("notice_type"));
     ndto.setNotice_file(multi.getFilesystemName("notice_file"));
	
     ndao.update_ok(ndto);
	return "redirect:/notice/content?notice_id="+ndto.getNotice_id();
}
@RequestMapping("/notice/delete")
public String delete(HttpServletRequest request)
{
	String notice_id=request.getParameter("notice_id");
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
	ndao.delete(notice_id);
	return "redirect:/notice/list";
	}
}


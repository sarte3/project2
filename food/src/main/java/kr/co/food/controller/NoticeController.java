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
public String list(Model model,HttpServletRequest request)
{
	NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
	
	//list메소드에 보낼 index값을 구해야 된다.
	//사용자가 원하는 페이지에 따라 index값은 바뀐다.
	//1페이지=> 0~9 , 2페이지=> 10~19
	int page,index;
	if(request.getParameter("page")==null)
	{
		index=0;
		page=1;
	}
	else
	{
		page=Integer.parseInt(request.getParameter("page"));
		index=(page-1)*10;
		
		
	}
	//pstart,pend구하기 =>사용자가 클릭하는 부분
	int pstart=page/10;
	if(page%10 ==0)
		pstart=pstart-1;
	pstart=(pstart*10)+1;
	int pend=pstart+9;
	
	//view에 사용자가 원하는 페이
	//1페이지 혹은 10페이지 단위의
	
	//총페이지수를 구해서 전달=>마지막페이지
	int chong=ndao.get_record_cnt();
	int page_cnt=chong/10;//페이지의 갯수
	
	if(chong%10 !=0)
		page_cnt++;

	//pend(총 출력되는값) 값이 총 페이지보다 크다면 pend값을 총(마지막)페이지로 해야한다.
	if(pend>page_cnt)
		pend=page_cnt;	
	//검색단어가null인경우 처리
	String sear;
	String sword;
	if(request.getParameter("sear")==null)
	{	
		sear="notice_title";
		sword="";
		ArrayList<NoticeDto> list=ndao.list(index);
		model.addAttribute("list",list);
		model.addAttribute("page_cnt2",ndao.get_page_cnt());
		model.addAttribute("pend",pend);
		model.addAttribute("pstart",pstart);
		model.addAttribute("page",page);
		model.addAttribute("page_cnt",page_cnt);
		
		return "/notice/list";
	}
	else
	{
		sear=request.getParameter("sear");
		sword=request.getParameter("sword");
		model.addAttribute("list",ndao.slist(sear,sword,index));
		model.addAttribute("sear",sear);
		model.addAttribute("sword",sword);
		return "/notice/list";
		
	}

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


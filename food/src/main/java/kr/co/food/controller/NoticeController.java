package kr.co.food.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.food.dao.NoticeDao;
import kr.co.food.dto.NoticeDto;
@Controller
public class NoticeController {


@Autowired SqlSession sqlSession;

@RequestMapping("/notice/write")
public String write() {
	return "/notice/write";
}
@RequestMapping("/write_ok")
public String write_ok(HttpServletRequest request) throws IOException
{
	String path=request.getRealPath("resources/img");
	int max=1024*1024*10;
     MultipartRequest multi=new MultipartRequest(request, path, max, "utf-8", new DefaultFileRenamePolicy());		
     multi.getParameter("title");
      multi.getFilesystemName("fname"); //저장되는 파일 이름
      multi.getOriginalFileName("fname");
      
      return "redirect:/upload/list";
   }

}

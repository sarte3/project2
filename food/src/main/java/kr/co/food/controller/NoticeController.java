package kr.co.food.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
public String write_ok(NoticeDto ndto)
{
  NoticeDao ndao=sqlSession.getMapper(NoticeDao.class);
  ndao.write_ok(ndto);
  return "redirect:/notice/list";
  
}

}

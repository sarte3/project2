package kr.co.food.controller;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.TrendDao;
import kr.co.food.dto.TrendDto;

@Controller
public class IndexController {

	@Autowired
	public SqlSession sqlSession;

	@RequestMapping("/")
	public String home() {
		return "redirect:/index";
	}

	@RequestMapping("/index")
	public String index(Model model) {
		TrendDao dao = sqlSession.getMapper(TrendDao.class);
		ArrayList<TrendDto> tlist = dao.getList();
		model.addAttribute("tlist", tlist);

		return "/index";

	}
}
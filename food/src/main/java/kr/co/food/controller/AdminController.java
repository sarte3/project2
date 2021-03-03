package kr.co.food.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.AdminDao;

@Controller
public class AdminController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/admin/main")
	public String main(Model model) 
	{
		AdminDao dao = sqlSession.getMapper(AdminDao.class);
		
		int food=dao.getFoodCnt();
		int user=dao.getUserCnt();
		int recipe=dao.getRecipeCnt();
		int trend=dao.getTrendCnt();
		
		model.addAttribute("food", food);
		model.addAttribute("user", user);
		model.addAttribute("recipe", recipe);
		model.addAttribute("trend", trend);
		
		model.addAttribute("flist", dao.getFood5());
		model.addAttribute("ulist", dao.getUser5());
		model.addAttribute("tlist", dao.getTrend5());
		model.addAttribute("rlist", dao.getRecipe5());
		
		return "/admin/main";
	}
	
}

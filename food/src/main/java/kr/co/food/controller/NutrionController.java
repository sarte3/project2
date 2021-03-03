package kr.co.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.NutrionDao;
import kr.co.food.dto.NutrionDto;


@Controller
public class NutrionController {

	@Autowired
	public SqlSession sqlSession;
	

	@RequestMapping("/nutrition/list")
	public String list(Model model) {
		
		NutrionDao ndao=sqlSession.getMapper(NutrionDao.class);
		ArrayList<NutrionDto> list=ndao.list();
		model.addAttribute("list",list);
		return "/nutrition/list";
	}
	@RequestMapping("/nutrition/n_view")
	public String n_view(Model model,HttpServletRequest request) {
		String food_code=request.getParameter("food_code");
		NutrionDao ndao=sqlSession.getMapper(NutrionDao.class);
		ndao.n_view(food_code);
		NutrionDto ndto=ndao.n_view(food_code);
		model.addAttribute("ndto",ndto);
		return "/nutrition/n_view";
	}
}

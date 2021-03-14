package kr.co.food.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.food.dao.RecipeDao;
import kr.co.food.dto.RecipeDto;

@Controller
public class RecipeController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/recipe_info/recipe_info_list")
	public String recipe_info_list(Model model, HttpServletRequest req) {
		RecipeDao dao = sqlSession.getMapper(RecipeDao.class);
		int page, index;
		if(req.getParameter("page") == null) {
			index = 0;
			page = 1;
		}
		else {
			page = Integer.parseInt(req.getParameter("page"));
			index = (page - 1) * 10;
		}
		
		int pstart = page / 10;
		if(page % 10 == 0)
			pstart = pstart - 1;
		pstart = (pstart * 10) + 1;
		int pend = pstart + 9;
		
		String recipe_word = req.getParameter("recipe_word");
		if(recipe_word == null)recipe_word = "";
		
		int chong = 0;
		if ("".equals(recipe_word)) {
			chong = dao.getRecipeCnt();
		} else {
			chong = dao.getRecipeCntWithKeyword(recipe_word);
		}
		int page_cnt = chong / 10;
		
		if(chong % 10 != 0)
			page_cnt++;
		
		if(pend > page_cnt)
			pend = page_cnt;

		ArrayList<RecipeDto> list = null;
		if ("".equals(recipe_word)) {
			list = dao.getRecipeList(index);
		} else {
			list = dao.getRecipeListWithKeyword(recipe_word, index);
		}
		model.addAttribute("list", list);
		model.addAttribute("pend", pend);
		model.addAttribute("pstart", pstart);
		model.addAttribute("page", page);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("recipe_word", recipe_word);
		
		return "/recipe_info/recipe_info_list";
	}

}

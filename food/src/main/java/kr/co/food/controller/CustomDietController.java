package kr.co.food.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.food.dao.CustomDietDao;
import kr.co.food.dto.CustomDietDto;

@Controller
public class CustomDietController {

	@Autowired
	public SqlSession sqlsession;
	
	@RequestMapping("/custom_diet/write")
	public String write()
	{
		return "/custom_diet/write";
	}
	
	@RequestMapping("/custom_diet/calendar")
	public String calendar()
	{
		return "/custom_diet/calendar";
	}
	
	@RequestMapping(value = "/custom_diet/json", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String json(Locale locale, Model model, HttpServletRequest req) {    
	    
		CustomDietDao dao = sqlsession.getMapper(CustomDietDao.class);
		
		ArrayList<String> list = dao.getFoodName(req.getParameter("food_cate3"), req.getParameter("food_name"));
		
		String[] array = new String[list.size()];

		for(int i=0;i<array.length;i++) {
			array[i]=list.get(i);
			System.out.print(array[i]);
		}
		
        Gson gson = new Gson();

	    return gson.toJson(array);
	}
	
	@RequestMapping("/custom_diet/write_ok")
	public String write_ok(CustomDietDto dto) 
	{
		CustomDietDao dao = sqlsession.getMapper(CustomDietDao.class);
		
		dao.write(dto);
		
		return "redirect:/custom_diet/list";
	}
	
	@RequestMapping("/custom_diet/list")
	public String list() 
	{
		CustomDietDao dao = sqlsession.getMapper(CustomDietDao.class);
		
			
		return "/custom_diet/list";
	}
}

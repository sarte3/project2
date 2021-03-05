package kr.co.food.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
}

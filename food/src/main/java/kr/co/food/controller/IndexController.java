package kr.co.food.controller;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class IndexController{


	@RequestMapping("/")
	public String home()
	{
		return "redirect:/index";
	}
   @RequestMapping("/index")
   public String index() 
   {
      return "/index";
      
   }
}
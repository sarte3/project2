package kr.co.food.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import kr.co.food.dto.DateData;

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
	public String calendar(HttpSession session, Model model, HttpServletRequest request, DateData dateData){
		
		CustomDietDao dao = sqlsession.getMapper(CustomDietDao.class);
		
		ArrayList<CustomDietDto> list = dao.getList(session.getAttribute("userid").toString());
		
		String day="";
		
		if(request.getParameter("y")!=null) 
		{
			day = request.getParameter("y")+"-"+String.valueOf(Integer.parseInt(request.getParameter("m"))+1)+"-"+request.getParameter("d");
		}
		ArrayList<CustomDietDto> dayList = dao.getDayList(session.getAttribute("userid").toString(), day);
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		System.out.println(list.size());
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			
			calendarData = null;
			String diet_type="";
			
			if(i==today_info.get("today")){
				
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
				
				
				for(int j=0;j<list.size();j++) 
				{
					String dietDay = list.get(j).getDiet_day();
					String date[] = dietDay.split("-");	
					System.out.println(dateData.getYear());
					System.out.println(dateData.getMonth());
					System.out.println(i);
					if(dateData.getYear().equals(date[0])&&(Integer.parseInt(dateData.getMonth())+1)==Integer.parseInt(date[1])&&String.valueOf(i).equals(date[2])) {
						
						if(list.get(j).getDiet_type().equals("아침식사")) 
						{
							diet_type=diet_type+"아침식사<br>";
						}
						else if(list.get(j).getDiet_type().equals("점심식사")) 
						{
							diet_type=diet_type+"점심식사<br>";
						}
						else 
						{
							diet_type=diet_type+"저녁식사<br>";
						}
						System.out.println("만족함");
					}
					
				}
				System.out.println(diet_type);
				if(!diet_type.equals(""))calendarData.setDiet_type(diet_type);
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
				
				for(int j=0;j<list.size();j++) 
				{
					String dietDay = list.get(j).getDiet_day();
					String date[] = dietDay.split("-");
					System.out.println(dateData.getYear());
					System.out.println(dateData.getMonth());
					System.out.println(i);
					if(dateData.getYear().equals(date[0])&&(Integer.parseInt(dateData.getMonth())+1)==Integer.parseInt(date[1])&&String.valueOf(i).equals(date[2])) {
						
						if(list.get(j).getDiet_type().equals("아침식사")) 
						{
							diet_type=diet_type+"아침식사<br>";
						}
						else if(list.get(j).getDiet_type().equals("점심식사")) 
						{
							diet_type=diet_type+"점심식사<br>";
						}
						else 
						{
							diet_type=diet_type+"저녁식사<br>";
						}
						System.out.println("만족함");
					}
					
				}
				System.out.println(diet_type);
				if(!diet_type.equals(""))calendarData.setDiet_type(diet_type);
				
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		if(dayList.size()>0)model.addAttribute("dayList", dayList);
		return "/custom_diet/list";
	}
	
	@RequestMapping("/custom_diet/update")
	public String update(Model model, HttpServletRequest req)
	{
		CustomDietDao dao = sqlsession.getMapper(CustomDietDao.class);
		CustomDietDto dto = dao.content(req.getParameter("id"));
		
		model.addAttribute("dto", dto);
		return "/custom_diet/update";
	}
	
	@RequestMapping("/custom_diet/update_ok")
	public String update_ok(CustomDietDto dto)
	{
		CustomDietDao dao = sqlsession.getMapper(CustomDietDao.class);
		dao.update(dto);
		
		return "redirect:/custom_diet/list";
	}

	@RequestMapping("/custom_diet/delete")
	public String delete(HttpServletRequest req)
	{
		CustomDietDao dao = sqlsession.getMapper(CustomDietDao.class);
		dao.delete(req.getParameter("id"));
		
		return "redirect:/custom_diet/list";
	}
}

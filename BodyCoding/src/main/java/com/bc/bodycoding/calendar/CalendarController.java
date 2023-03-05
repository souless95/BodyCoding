package com.bc.bodycoding.calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarDAO;
	
	@GetMapping("calendar.do")
	public String fullCalendar(Model model) {
		model.addAttribute("cList", calendarDAO.loadCList());
		
		return "fullCalendar";
	}
	
	@ResponseBody
	@RequestMapping("/AddCalendar")
	public String addCalendar(@Param("id") String id, HttpServletRequest req, CalendarDTO calendarDTO){
		
		calendarDTO.setTitle(req.getParameter("title"));
		calendarDTO.setStart1(req.getParameter("start"));
		calendarDTO.setEnd(req.getParameter("end"));
		calendarDTO.setId(id);
		
		int result = calendarDAO.insertSchedule(calendarDTO);
		
		if(result==1) {
	         System.out.println("업데이트 성공!");
		}
		System.out.println(calendarDTO.getId());
		return calendarDTO.getId();
	}
	
	@ResponseBody
	@RequestMapping("/deleteCalendar" )
	public String deleteCalendar(HttpServletRequest req, CalendarDTO calendarDTO){
		
		calendarDTO.setId(req.getParameter("lastClickedEventId"));
		
		int result = calendarDAO.deleteSchedule(calendarDTO);
		if(result==1) {
	         System.out.println("삭제 성공!");
		}
		return "calendar.do";
	}
	
	@ResponseBody
	@RequestMapping("/updateCalendar" )
	public String updateCalendar(HttpServletRequest req, CalendarDTO calendarDTO){
		
		calendarDTO.setId(req.getParameter("id"));
		calendarDTO.setStart1(req.getParameter("start"));
		calendarDTO.setEnd(req.getParameter("end"));
		
		int result = calendarDAO.updateSchedule(calendarDTO);
		if(result==1) {
	         System.out.println("업데이트 성공!");
		}
		return "calendar.do";
	}
	
	@ResponseBody
	@RequestMapping("/updateCalendar2" )
	public String updateCalendar2(HttpServletRequest req, CalendarDTO calendarDTO){
		
		calendarDTO.setId(req.getParameter("id"));
		calendarDTO.setEnd(req.getParameter("end"));
		
		int result = calendarDAO.updateSchedule2(calendarDTO);
		if(result==1) {
	         System.out.println("업데이트 성공!");
		}
		return "calendar.do";
	}
}

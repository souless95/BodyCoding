package com.bc.bodycoding.calendar;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import global.dto.MemberDTO;

//calendarDTO = lesson table
@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarDAO;
	
	@GetMapping("calendar.do")
	public String fullCalendar(Model model) {
		
		List<CalendarDTO> cList = calendarDAO.loadCList();
		List<Map<String, Object>> eventList = new ArrayList<Map<String, Object>>();
		for (CalendarDTO fullList : cList) {
		    Map<String, Object> event = new HashMap<String, Object>();
		    event.put("id", fullList.getLesson_idx());
		    event.put("title", fullList.getLesson_name());
		    event.put("start", fullList.getLesson_day().substring(0,10) + "T" + fullList.getLesson_start_time() + ":00+09:00");
		    event.put("end", fullList.getLesson_day().substring(0,10) + "T" + fullList.getLesson_end_time() + ":00+09:00");
		    eventList.add(event);
		}
		model.addAttribute("cList", eventList);
		
		return "fullCalendar";
	}
	
	@GetMapping("/addCalendar1.do")
	public String addCalendar1(Model model) {
		return "addCalendar";
	}
	
	@ResponseBody
	@RequestMapping("/addCalendar2.do")
	public String addCalendar(@Param("lesson_idx") String lesson_idx, HttpServletRequest req,
			CalendarDTO calendarDTO, HttpSession session){
		
		String time = req.getParameter("start");
		String[] timeDivided = time.split("T");
		String time2 = req.getParameter("end");
		String[] timeDivided2 = time2.split("T");
		
		calendarDTO.setLesson_idx(lesson_idx);
		calendarDTO.setTrainer_id((String)session.getAttribute("UserEmail"));
		calendarDTO.setLesson_category(req.getParameter("lesson_category"));
		calendarDTO.setLesson_name(req.getParameter("title"));
		calendarDTO.setLesson_day(timeDivided[0]);
		calendarDTO.setLesson_start_time(timeDivided[1].substring(0, 5));
		calendarDTO.setLesson_end_time(timeDivided2[1].substring(0, 5));
		calendarDTO.setLesson_capacity(req.getParameter("lesson_capacity"));
		System.out.println(calendarDTO);
		
		calendarDAO.insertSchedule(calendarDTO);
		
		return calendarDTO.getLesson_idx();
	}
	
	@ResponseBody
	@RequestMapping("/deleteCalendar" )
	public String deleteCalendar(HttpServletRequest req, CalendarDTO calendarDTO){
		
		calendarDTO.setLesson_idx(req.getParameter("lastClickedEventId"));
		calendarDAO.deleteSchedule(calendarDTO);
		
		return "calendar.do";
	}
		
	@ResponseBody
	@RequestMapping("/updateCalendar" )
	public String updateCalendar(HttpServletRequest req, CalendarDTO calendarDTO){
		
		String time = req.getParameter("start");
		String[] timeDivided = time.split("T");
		String time2 = req.getParameter("end");
		String[] timeDivided2 = time2.split("T");
		
		calendarDTO.setLesson_idx(req.getParameter("id"));
		calendarDTO.setLesson_start_time(req.getParameter("start"));
		calendarDTO.setLesson_end_time(req.getParameter("end"));
		
		int result = calendarDAO.updateSchedule(calendarDTO);
		if(result==1) {
	         System.out.println("업데이트 성공!");
		}
		return "calendar.do";
	}
		
	@ResponseBody
	@RequestMapping("/updateCalendar2" )
	public String updateCalendar2(HttpServletRequest req, CalendarDTO calendarDTO){
		
		calendarDTO.setLesson_idx(req.getParameter("id"));
		calendarDTO.setLesson_end_time(req.getParameter("end"));
		
		int result = calendarDAO.updateSchedule2(calendarDTO);
		if(result==1) {
	         System.out.println("업데이트 성공!");
		}
		return "calendar.do";
	}
	
}

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
import global.dto.ProductDTO;

//calendarDTO = lesson table
@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calendarDAO;
	
	@GetMapping("calendar.do")
	public String fullCalendar(Model model, CalendarDTO calendarDTO, HttpSession session) {
		
		calendarDTO.setTrainer_id((String)session.getAttribute("UserEmail"));
		List<CalendarDTO> cList = calendarDAO.loadCList(calendarDTO);
		
		List<Map<String, Object>> eventList = new ArrayList<Map<String, Object>>();
		for (CalendarDTO fullList : cList) {
		    Map<String, Object> event = new HashMap<String, Object>();
		    event.put("id", fullList.getLesson_idx());
		    event.put("title", fullList.getLesson_name());
		    event.put("start", fullList.getLesson_day().substring(0,10) + "T" + fullList.getLesson_start_time() + ":00+09:00");
		    event.put("end", fullList.getLesson_day().substring(0,10) + "T" + fullList.getLesson_end_time() + ":00+09:00");
		    event.put("category", fullList.getLesson_category());
		    event.put("capacity", fullList.getLesson_capacity());
		    int rCount = calendarDAO.getRcount(fullList.getLesson_idx());
		    event.put("rCount", rCount);
		    List<String> names = new ArrayList<String>();
		    names = calendarDAO.getNames(fullList.getLesson_idx());
		    event.put("names", names);
		    eventList.add(event);
		}
		model.addAttribute("cList", eventList);
		
		return "fullCalendar";
	}
	
	@GetMapping("reservation.do")
	public String reservation(Model model, CalendarDTO calendarDTO, HttpSession session,
			ProductDTO productDTO, ReservationDTO reservationDTO) {
		
		String user_id = (String)session.getAttribute("UserEmail");
		productDTO.setUser_id(user_id);
		List<ProductDTO> Info = calendarDAO.getInfo(productDTO);
		List<CalendarDTO> getScheduleForMem = calendarDAO.getScheduleForMem(user_id, Info);
		
		List<CalendarDTO> finalSchedule = new ArrayList<>();
		for(CalendarDTO calendar : getScheduleForMem) {
			CalendarDTO calendarElemental = new CalendarDTO();
			
			calendarElemental.setLesson_idx(calendar.getLesson_idx());
			calendarElemental.setTrainer_id(calendar.getTrainer_id());
			calendarElemental.setLesson_category(calendar.getLesson_category());
			calendarElemental.setLesson_name(calendar.getLesson_name());
			calendarElemental.setLesson_day(calendar.getLesson_day());
			calendarElemental.setLesson_start_time(calendar.getLesson_start_time());
			calendarElemental.setLesson_end_time(calendar.getLesson_end_time());
			calendarElemental.setLesson_capacity(calendar.getLesson_capacity());
			calendarElemental.setLesson_availability(calendar.getLesson_availability());
			calendarElemental.setTrainer_name(calendar.getTrainer_name());
			int rCount = calendarDAO.getRcount(calendar.getLesson_idx());
			calendarElemental.setRcount(rCount);
			
		    finalSchedule.add(calendarElemental);
		}
		model.addAttribute("Info", Info);
		model.addAttribute("Schedule", finalSchedule);
		model.addAttribute("user_id", user_id);
				
		return "reservation";
	}
	
	@GetMapping("reservated.do")
	public String reservated(Model model, CalendarDTO calendarDTO,
			HttpSession session, ReservationDTO reservationDTO) {
		
		String user_id = (String)session.getAttribute("UserEmail");
		reservationDTO.setUser_id(user_id);
		List<String> Lessons = calendarDAO.getLesson(reservationDTO);
		List<CalendarDTO> myReservation = calendarDAO.getMyLesson(Lessons);
		
		
		List<CalendarDTO> finalSchedule = new ArrayList<>();
		for(CalendarDTO calendar : myReservation) {
			CalendarDTO calendarElemental = new CalendarDTO();
			
			calendarElemental.setLesson_idx(calendar.getLesson_idx());
			calendarElemental.setTrainer_id(calendar.getTrainer_id());
			calendarElemental.setLesson_category(calendar.getLesson_category());
			calendarElemental.setLesson_name(calendar.getLesson_name());
			calendarElemental.setLesson_day(calendar.getLesson_day());
			calendarElemental.setLesson_start_time(calendar.getLesson_start_time());
			calendarElemental.setLesson_end_time(calendar.getLesson_end_time());
			calendarElemental.setLesson_capacity(calendar.getLesson_capacity());
			calendarElemental.setLesson_availability(calendar.getLesson_availability());
			calendarElemental.setTrainer_name(calendar.getTrainer_name());
			int rCount = calendarDAO.getRcount(calendar.getLesson_idx());
			calendarElemental.setRcount(rCount);
			
		    finalSchedule.add(calendarElemental);
		}
				
		model.addAttribute("user_id", user_id);
		model.addAttribute("myR", finalSchedule);
				
		return "reservated";
	}
	
	@GetMapping("/addCalendar1.do")
	public String addCalendar1() {
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
		calendarDTO.setLesson_day(timeDivided[0]);
		calendarDTO.setLesson_start_time(timeDivided[1].substring(0, 5));
		calendarDTO.setLesson_end_time(timeDivided2[1].substring(0, 5));
		
		calendarDAO.updateSchedule(calendarDTO);
		return "calendar.do";
	}
		
	@ResponseBody
	@RequestMapping("/updateCalendar2" )
	public String updateCalendar2(HttpServletRequest req, CalendarDTO calendarDTO){
		
		String time = req.getParameter("end");
		String[] timeDivided2 = time.split("T");
		
		calendarDTO.setLesson_idx(req.getParameter("id"));
//		CalendarDTO aa = new CalendarDTO();
//		aa = calendarDAO.selectSchedule(calendarDTO);
//		String bb = timeDivided2[0] + "T" + aa.getLesson_end_time() + ":00+09:00";
//		System.out.println(bb);
//		
//		
//		CalendarDTO bb = new CalendarDTO();
//		calendarDTO.setLesson_day(req.getParameter("id"));
//		
//		calendarDTO.setLesson_idx(req.getParameter("id"));
		calendarDTO.setLesson_end_time(timeDivided2[1].substring(0, 5));
		
		calendarDAO.updateSchedule2(calendarDTO);
		return "calendar.do";
	}
	
	@GetMapping("/selectCalendar.do")
	public String updateCalendar3(Model model, HttpServletRequest req, CalendarDTO calendarDTO) {
		
		calendarDTO.setLesson_idx(req.getParameter("eventId"));
		model.addAttribute("sSchedule", calendarDAO.selectSchedule(calendarDTO));
		
		return "updateCalendar";
	}
	
	@ResponseBody
	@RequestMapping("/updateCalendar4.do" )
	public String updateCalendar4(HttpServletRequest req, CalendarDTO calendarDTO){
		
		calendarDTO.setLesson_idx(req.getParameter("id"));
		calendarDTO.setLesson_name(req.getParameter("title"));
		calendarDTO.setLesson_category(req.getParameter("lesson_category"));
		calendarDTO.setLesson_capacity(req.getParameter("lesson_capacity"));
		
		calendarDAO.updateSchedule4(calendarDTO);
		return "calendar.do";
	}
	
	@ResponseBody
	@RequestMapping("reservating.do" )
	public String reservating(ReservationDTO reservationDTO){
		calendarDAO.reservating(reservationDTO);
		return "reservation.do";
	}
	
	@ResponseBody
	@RequestMapping("reservatedDeletion.do" )
	public String reservatedDeletion(ReservationDTO reservationDTO){
		calendarDAO.reservatedDeletion(reservationDTO);
		return "reservation.do";
	}
	
}

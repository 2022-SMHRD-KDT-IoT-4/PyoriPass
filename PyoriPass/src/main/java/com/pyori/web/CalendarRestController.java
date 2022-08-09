package com.pyori.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pyori.domain.CalendarVO;
import com.pyori.mapper.CalendarMapper;

@RestController
public class CalendarRestController {
	@Autowired
	CalendarMapper mapper;
	
	@RequestMapping("/calendarselect")
	public List<CalendarVO> calendarselect(String reservation_num){
		List<CalendarVO> list = mapper.calendarselect(reservation_num);
		return list;
	}
}

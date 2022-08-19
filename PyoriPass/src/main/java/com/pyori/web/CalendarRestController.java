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
	CalendarMapper c_mapper;

	// 1. 캘린더 일정 전체 보기
	@RequestMapping("/calendarselect")
	public List<CalendarVO> calendarselect(String reservation_num) {
		List<CalendarVO> list = c_mapper.calendarselect(reservation_num);
		return list;
	}

	// 2. 캘린더 일정 클릭해서 일정 상세 보기
	@RequestMapping("/calendardetail")
	public CalendarVO calendardetail(String reservation_num) {
		CalendarVO list = c_mapper.calendardetail(reservation_num);
		return list;
	}
}

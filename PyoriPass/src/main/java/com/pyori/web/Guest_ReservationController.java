package com.pyori.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pyori.domain.GuestVO;
import com.pyori.domain.ReservationVO;
import com.pyori.mapper.Guest_ReservationMapper;

@Controller
public class Guest_ReservationController {
	
	@Autowired
	Guest_ReservationMapper gr_mapper;
	
	// 1. 손님 예약 정보 등록
	@RequestMapping("/insertGuestReservation.do")
	public String insertGuestReservation(GuestVO gvo, ReservationVO rvo) {
		gr_mapper.insertGuest(gvo);
		gr_mapper.insertReservation(rvo);
		return "";
	}

}

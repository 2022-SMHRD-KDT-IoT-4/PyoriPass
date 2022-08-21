package com.pyori.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class dashMainController {

	// 1. DashMain 으로 이동
	@RequestMapping("/dashMain.do")
	public String DashMain(String host_id, HttpSession session) {
		session.setAttribute("host_id", host_id);
		return "dashMain";
	}

	// 2. 숙소 등록 페이지로 이동
	@RequestMapping("/Rentals_information")
	public String pensionInfo(String host_id, HttpSession session) {
		session.setAttribute("host_id", host_id);
		return "Rentals_information";
	}

	// 3. 게스트 등록 페이지로 이동
	@RequestMapping("/Guest_Reservation")
	public String GuestReservation(String host_id, HttpSession session) {
		return "Guest_Reservation";
	}
}

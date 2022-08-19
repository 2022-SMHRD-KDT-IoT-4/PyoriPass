package com.pyori.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class dashMainController {

	// 1. 숙소 등록 페이지로 이동
	@RequestMapping("/Rentals_information")
	public String pensionInfo(String host_id, HttpSession session) {
		session.setAttribute("host_id", host_id);
		return "Rentals_information";
	}
}

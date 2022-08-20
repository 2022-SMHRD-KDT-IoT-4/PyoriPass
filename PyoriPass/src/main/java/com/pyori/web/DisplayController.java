package com.pyori.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pyori.mapper.GuestMapper;

@Controller
public class DisplayController {
	
	// NFC키 가지고 있는 해당 게스트 이름 가져오기
	@Autowired
	GuestMapper g_mapper;

	// 1. 디스플레이 메인페이지로 이동
	@RequestMapping("/display.do")
	public void display() {
	}
	
	// 2. 디스플레이 -> 디스플레이2 페이지 이동
	@RequestMapping ("/display2.do")
	public void display2() {
	}
	
	// 3. 디스플레이2-> 디스플레이3 페이지 이동
	// NFC 잠금 해제되면 NFC키값을 display3.do 로 전송해준다. 
	@RequestMapping("/display3.do")
	public void display3() { // @RequestBody Map<String, Object> id 를 매개변수를 받아오고
		
		// String guest_nfc = (String.valueOf(id.values()));
		// Guest vo = g_mapper.checkNFC(guest_nfc);
		// model.addAttribute("guest_name",vo.getGuest_name());
	}
	// -> display3.jsp 에서는 ${guest_name} 으로 게스트 이름을 불러올 수 있다.
	
}

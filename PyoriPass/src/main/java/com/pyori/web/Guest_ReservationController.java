package com.pyori.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pyori.domain.GuestVO;
import com.pyori.domain.ReservationVO;
import com.pyori.mapper.Guest_ReservationMapper;

@Controller
public class Guest_ReservationController {
	@Autowired
	Guest_ReservationMapper mapper;
	
	@RequestMapping("/insertGuestReservation.do")
	public String insertGuestReservation(GuestVO gvo, ReservationVO rvo) {
		mapper.insertGuest(gvo);
		mapper.insertReservation(rvo);
		return "";
	}
	// insert할 항목 ( guest_name, reservation_num, guest_phone, pension_name,
			// room_name, checkin_date, checkout_date )
			
			// 게스트 등록 폼에는 guest_name, reservation_num, guest_phone, pension_name,
			// room_name, checkin_date, checkout_date 입력을 하는데
			
			// 게스트 등록 폼에 보여줄 pension_name : 
			// select * from t_pension where host_id = #{지금 로그인되어 있는 host_id} )
			// ==> pension_seq, pension_name, host_id 
			// 프론트에서 쓸 건 pension_name, 백에서  쓸 건 pension_seq
			
			// 게스트 등록 폼에 보여줄 room_name :
			// select * from t_room where pension_seq = #{위에 선택된 pension_seq}
			// ==> room_seq, pension_seq, room_name
			// 프론트에서 보여줄 건 room_name, 백에서 쓸 건 room_seq
			
			// 선택된 pension_seq와 room_name를 가진 room_seq를 뽑아
			
			// 1. insert into t_guest(reservation_num, guest_name, guest_phone) values ...
			// 2. insert into t_reservation values (
			
			
			// t_guest ( reservation_num, guest_name, guest_phone)
			// t_pension (pension_name)
			// t_room ( room_name)
			// t_reservation(checkin_date, checkout_date)
}

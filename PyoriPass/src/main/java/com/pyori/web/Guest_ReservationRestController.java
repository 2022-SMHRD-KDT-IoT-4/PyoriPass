package com.pyori.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pyori.domain.CalendarVO;
import com.pyori.domain.PensionVO;
import com.pyori.domain.RoomVO;
import com.pyori.mapper.CalendarMapper;
import com.pyori.mapper.Guest_ReservationMapper;

@RestController
public class Guest_ReservationRestController {

	@Autowired
	Guest_ReservationMapper gr_mapper;
	@Autowired
	CalendarMapper c_mapper;

	// 1. 손님 예약 정보 등록
	// 1-1. 호스트ID에 맞는 펜션 리스트 조회
	@RequestMapping("/pensionselect.do")
	public List<PensionVO> pensionselect(String host_id) {
		List<PensionVO> list = gr_mapper.pensionselect(host_id);
		return list;
	}

	// 1-2. 선택한 펜션의 객실 조회
	@RequestMapping("/roomselect.do")
	public List<RoomVO> roomselect(int pension_seq) {
		List<RoomVO> list = gr_mapper.roomselect(pension_seq);
		return list;
	}

	// 2. 오늘의 예약 정보 확인하기
	// 테스트 안해봤어요
	@RequestMapping("/todaybooking.do")
	public CalendarVO todaybooking(String host_id) {
		// 호스트의 reservation_num, checkin_date, checkout_date, guest_name 추출
		CalendarVO vo = c_mapper.todaybookselect1(host_id);
		System.out.println("vo1 :" + vo);

		// reservation_num이 일치하는 guest_nfc값 찾기
		vo.setGuest_nfc(c_mapper.todaybookselect2(vo.getReservation_num()));
		System.out.println("vo2 :" + vo);

		return vo;
	}

	// 3. 내일의 예약 정보 확인하기
	// 테스트 안해봤어요
	@RequestMapping("/nextbooking.do")
	public CalendarVO nextbooking(String host_id) {
		// 호스트의 reservation_num, checkin_date, checkout_date, guest_name 추출
		CalendarVO vo = c_mapper.nextbookselect1(host_id);
		System.out.println("vo1 : " + vo);

		// reservation_num이 일치하는 guest_nfc값 찾기
		vo.setGuest_nfc(c_mapper.nextbookselect2(vo.getReservation_num()));
		System.out.println("vo2 :" + vo);

		return vo;
	}

}

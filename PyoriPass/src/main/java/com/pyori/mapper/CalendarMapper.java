package com.pyori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pyori.domain.CalendarVO;

public interface CalendarMapper {
	
	// 1. 캘린더 모든 일정 보기
	@Select("SELECT g.guest_name, g.reservation_num, g.guest_phone, re.checkin_date, re.checkout_date, ro.room_name, p.pension_name\r\n" + 
			"FROM (\r\n" + 
			"	SELECT *\r\n" + 
			"	FROM t_host\r\n" + 
			"	WHERE host_id = \r\n" + 
			") h\r\n" + 
			"	LEFT OUTER JOIN t_pension p ON h.host_id = p.host_id\r\n" + 
			"	LEFT OUTER JOIN t_room ro ON p.pension_seq = ro.pension_seq\r\n" + 
			"	LEFT OUTER JOIN t_reservation re ON ro.room_seq = re.room_seq\r\n" + 
			"	LEFT OUTER JOIN t_guest g ON re.reservation_num = g.reservation_num")
	List<CalendarVO> calendarselect(String reservation_num);
	
	// 2. 캘린더 일정 클릭해서 일정 상세 보기
	@Select("select * from app_reservation where reservation_num = #{reservation_num}")
	CalendarVO calendardetail(String reservation_num);
	
	// 3. 오늘의 예약 정보 조회
	// 3-1. 게스트 이름, 체크인 시간, 체크아웃 시간
	@Select("select reservation_num, checkin_date, checkout_date, guest_name from app_reservation where host_id = #{host_id} and checkin_date >= now() order by checkin_date limit 1")
	CalendarVO todaybookselect1(String host_id);
	
	// 3-2. 게스트 NFC
	@Select("select guest_nfc from t_guest where reservation_num = #{reservation_num}")
	String todaybookselect2(String reservation_num);

	// 4. 내일의 예약 정보 조회
	// 4-1. 게스트 이름, 체크인 시간, 체크아웃 시간
	@Select("select reservation_num, checkin_date, checkout_date, guest_name from app_reservation where host_id = #{host_id} and checkin_date >= now() order by checkin_date limit 1,1")
	CalendarVO nextbookselect1(String host_id);
	
	// 4-2. 게스트 NFC
	@Select("select guest_nfc from t_guest where reservation_num = #{reservation_num}")
	String nextbookselect2(String reservation_num);
}

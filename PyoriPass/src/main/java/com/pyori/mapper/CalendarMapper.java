package com.pyori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pyori.domain.CalendarVO;

public interface CalendarMapper {
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
}

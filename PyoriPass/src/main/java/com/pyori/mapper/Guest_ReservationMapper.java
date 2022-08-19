package com.pyori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pyori.domain.GuestVO;
import com.pyori.domain.PensionVO;
import com.pyori.domain.ReservationVO;
import com.pyori.domain.RoomVO;

public interface Guest_ReservationMapper {

	// 1. 손님 예약 정보 등록
	// 1-1. 호스트ID에 맞는 펜션 리스트 조회
	@Select("SELECT p.pension_seq, p.pension_name\r\n" + 
			"FROM (\r\n" + 
			"	SELECT *\r\n" + 
			"	FROM t_pension\r\n" + 
			"	WHERE host_id = #{host_id}\r\n" + 
			") p\r\n" + 
			"INNER JOIN t_room r1 ON p.pension_seq = r1.pension_seq")
	List<PensionVO> pensionselect(String host_id);
	
	// 1-2. 선택한 펜션의 객실 조회
	@Select("SELECT  room_seq, room_name"
			+ "FROM t_room"
			+ "where pension_seq = #{pension_seq})")
	List<RoomVO> roomselect(int pension_seq);
	
	// 1-3. 게스트 테이블에 예약 정보 등록
	@Insert("insert into t_guest(reservation_num,guest_name,guest_phone) values(#{reservation_num},#{guest_name},#{guest_phone})")
	public String insertGuest(GuestVO gvo);
	
	// 1-4. 예약 테이블에 예약 정보 등록
	@Insert("insert into t_reservation(checkin_date,checkout_date) values(#{checkin},#{checkout})")
	public String insertReservation(ReservationVO rvo);
	
}
	

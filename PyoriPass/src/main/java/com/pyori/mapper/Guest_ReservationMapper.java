package com.pyori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.pyori.domain.GuestVO;
import com.pyori.domain.HostPension_RoomVO;
import com.pyori.domain.PensionVO;
import com.pyori.domain.ReservationVO;
import com.pyori.domain.RoomVO;

public interface Guest_ReservationMapper {

	@Select("SELECT p.pension_seq, p.pension_name\r\n" + 
			"FROM (\r\n" + 
			"	SELECT *\r\n" + 
			"	FROM t_pension\r\n" + 
			"	WHERE host_id = #{host_id}\r\n" + 
			") p\r\n" + 
			"INNER JOIN t_room r1 ON p.pension_seq = r1.pension_seq")
	List<PensionVO> pensionselect(String host_id);
	@Select("SELECT  room_sqe, room_name"
			+ "FROM t_room"
			+ "where pension_seq = #{pension_seq})")
	List<RoomVO> roomselect(int pension_seq);
	
	@Insert("insert into t_guest(reservation_num,guest_name,guest_phone) values(#{reservation_num},#{guest_name},#{guest_phone})")
	public String insertGuest(GuestVO gvo);
	@Insert("insert into t_reservation(checkin_date,checkout_date) values(#{checkin},#{checkout})")
	public String insertReservation(ReservationVO rvo);
}
	

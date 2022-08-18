package com.pyori.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pyori.domain.AppReservationVO;
import com.pyori.domain.GuestVO;
import com.pyori.domain.HostVO;

public interface AppMapper {
	
	// 앱 로그인
	@Select("SELECT * FROM t_host WHERE host_id = #{host_id}")
	public HostVO login(String host_id);
	
	// 예약현황 불러오기
	@Select("SELECT * FROM app_reservation WHERE host_id = #{host_id}")
	public List<AppReservationVO> reservationList(String host_id);
	
	// 게스트 로그인
	@Select("SELECT reservation_num, guest_name, guest_phone FROM t_guest WHERE reservation_num = #{reservation_num}")
	public GuestVO guestLogin(String reservation_num);

}

package com.pyori.web;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pyori.domain.AppReservationVO;
import com.pyori.domain.GuestVO;
import com.pyori.domain.HostVO;
import com.pyori.mapper.AppMapper;

@RestController
public class AppController {
	
	@Autowired
	AppMapper mapper;
	
	// 암호화
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	// 앱 로그인
	@SuppressWarnings("unchecked")
	@RequestMapping("applogin.do")
	public JSONObject applogin(String host_id, String host_pw) {
		JSONObject result = new JSONObject();

		HostVO vo = mapper.login(host_id);

		if (vo != null) {
			if (encoder.matches(host_pw, vo.getHost_pw())) {
				result.put("host_id", vo.getHost_id());
				result.put("host_pw", vo.getHost_pw());
				result.put("host_tel", vo.getHost_tel());

				System.out.println(result);
			}
		}
		return result;
	}
	
	// 캘린더 일정 불러오기
	@SuppressWarnings("unchecked")
	@RequestMapping("appcallist.do")
	public JSONArray appcallist(String host_id) {
		System.out.println("appcallist 접속 완료");
		JSONObject result = new JSONObject();
		JSONArray resultArr = new JSONArray();
		
		List<AppReservationVO> list = mapper.reservationList(host_id);
		
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				JSONObject row = new JSONObject();
				
				row.put("host_id", list.get(i).getHost_id());
				row.put("pension_name", list.get(i).getPension_name());
				row.put("room_name", list.get(i).getRoom_name());
				row.put("reservation_num", list.get(i).getReservation_num());
				row.put("checkin_date", list.get(i).getCheckin_date());
				row.put("checkout_date", list.get(i).getCheckout_date());
				row.put("guest_name", list.get(i).getGuest_name());
				row.put("guest_phone", list.get(i).getGuest_phone());

				resultArr.add(i, row);
			}
		}
		return resultArr;
	}
	
	@RequestMapping("guestlogin.do")
	public JSONObject guestlogin(String reservation_num) {
		JSONObject result = new JSONObject();
		
		GuestVO vo = mapper.guestLogin(reservation_num);
		
		if (vo != null) {
			result.put("reservation_num", vo.getReservation_num());
			result.put("guest_name", vo.getGuest_name());
			result.put("guest_phone", vo.getGuest_phone());
		}
		return result;
	}
}

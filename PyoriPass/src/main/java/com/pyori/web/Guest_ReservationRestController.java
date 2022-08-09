package com.pyori.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pyori.domain.HostPension_RoomVO;
import com.pyori.domain.PensionVO;
import com.pyori.domain.RoomVO;
import com.pyori.mapper.Guest_ReservationMapper;

@RestController
public class Guest_ReservationRestController {
	
	@Autowired
	Guest_ReservationMapper mapper;
	
	@RequestMapping("/pensionselect.do")
	public List<PensionVO> pensionselect(String host_id){
		List<PensionVO> list  = mapper.pensionselect(host_id);
		return list;
	}
	@RequestMapping("/roomselect.do")
	public List<RoomVO> roomselect(int pension_seq){
		List<RoomVO> list = mapper.roomselect(pension_seq);
		return list;
	}
	
}

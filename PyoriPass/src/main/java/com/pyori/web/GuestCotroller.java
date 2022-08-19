package com.pyori.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pyori.mapper.GuestMapper;

@Controller
public class GuestCotroller {
	
	@Autowired
	GuestMapper mapper;
	
	@RequestMapping("nfcUpdate.do")
	public int nfcUpdate(String reservation_num, String id) {
		
		int row = mapper.oneSelect();
		
		if (row == 0) {
			int result = mapper.nfcUpdate(reservation_num, id);
			
			return result;
		} else {
			return 0;
		}
	}
	
	@RequestMapping("nfcSelect.do")
	public int nfcSelect(String id) {
		
		int row = mapper.nfcSelect(id);
		
		if (row > 0) {
			return 1;
		} else {
			return 0;
		}
		
	}

}





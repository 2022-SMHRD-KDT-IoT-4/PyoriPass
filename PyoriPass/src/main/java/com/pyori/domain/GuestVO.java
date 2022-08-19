package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class GuestVO {
	
	private String reservation_num;
	private String guest_name;
	private String guest_phone;
	private String guset_nfc;
	private int nfc_update;
	
}

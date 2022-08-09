package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CalendarVO {
	private String reservation_num;
	private String guest_phone;
	private String checkin;
	private String checkout;
	private String room_name;
	private String pension_name;
}

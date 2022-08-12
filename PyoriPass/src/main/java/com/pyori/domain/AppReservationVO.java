package com.pyori.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AppReservationVO {
	private String host_id;
	private String pension_name;
	private String room_name;
	private String reservation_num;
	private String checkin_date;
	private String checkout_date;
	private String guest_name;
	private String guest_phone;
}

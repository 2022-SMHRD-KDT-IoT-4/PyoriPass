package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationVO {
	private int room_seq;
	private String checkin;
	private String checkout;
}
package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class GuestVO {
	private String guest_name;
	private String guest_phone;
	private String reservation_num;
}

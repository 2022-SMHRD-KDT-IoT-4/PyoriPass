package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PensionRoomVO {
	
	// Pension 
	private int pension_seq;
	private String pension_name;
	private String host_id;
	
	// Room
	private int room_seq;
	private String room_name;
}

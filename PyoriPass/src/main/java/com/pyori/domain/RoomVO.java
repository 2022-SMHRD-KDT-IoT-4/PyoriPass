package com.pyori.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoomVO {
	
	private int room_seq;
	private int pension_seq;
	private String room_name;

}

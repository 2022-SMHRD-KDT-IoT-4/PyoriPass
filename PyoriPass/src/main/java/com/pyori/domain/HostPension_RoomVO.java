package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HostPension_RoomVO {
	private int pension_seq;
	private int room_seq;
	private String pension_name;
	private String room_name;
}

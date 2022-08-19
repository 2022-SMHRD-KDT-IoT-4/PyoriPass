package com.pyori.domain;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InvasionVO {
	
	// 침입 감지 시퀀스 번호
	private int invasion_seq;
	
	// 침입 감지 시간
	private String invasion_time;
	
	// 침입 감지 영상 저장 url
	private String invasion_url;
	
	// 예약 시퀀스 번호
	private int reserv_seq;
}

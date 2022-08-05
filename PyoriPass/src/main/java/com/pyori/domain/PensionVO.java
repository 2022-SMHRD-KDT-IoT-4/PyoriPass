package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PensionVO {

	// 숙소 시퀀스 번호
	private int pension_seq;

	// 숙소 이름
	private String pension_name;

	// 호스트 계정
	private String host_id;

}

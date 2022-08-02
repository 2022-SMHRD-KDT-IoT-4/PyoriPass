package com.pyori.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
public class HostVO {
	
	// 호스트 아이디
	@NonNull
	private String host_id;
	// 호스트 비밀번호
	@NonNull
	private String host_pw;
	// 숙소 이름
	private String pension_name;
	// 호스트 전화번호
	@NonNull
	private String host_tel;
}

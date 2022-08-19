package com.pyori.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor
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
	
	// 호스트 인증상태
	// 회원가입 시 사용 (0 : 인증메일발송 전 , 1 : 메일인증 성공, 다른 수 : 메일발송은 했지만 인증은 안된 상태)
	private int host_authStatus;
}

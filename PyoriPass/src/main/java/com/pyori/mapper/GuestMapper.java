package com.pyori.mapper;

import com.pyori.domain.GuestVO;

public interface GuestMapper {

	// 1. 도어락 잠금 해제 : 들어온 NFC와 일치하는 데이터 조회
	public GuestVO checkNFC(String guest_nfc);
}

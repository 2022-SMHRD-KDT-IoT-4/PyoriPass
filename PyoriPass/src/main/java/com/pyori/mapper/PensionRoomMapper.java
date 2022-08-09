package com.pyori.mapper;

public interface PensionRoomMapper {

	// 전체 숙소 삭제 : 해당 호스트의 모든 객실 삭제
	public int pensionRoomAllDelete(String host_id);

}

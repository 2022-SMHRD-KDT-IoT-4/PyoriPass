package com.pyori.mapper;

import java.util.List;

import com.pyori.domain.RoomVO;

public interface RoomMapper {
	
	// 숙소 등록 페이지
	// 1. 숙소 삭제 : 해당 펜션 모든 객실 삭제
	public void pensionroomdelete(int pension_seq);

	// 2. 객실 조회
	public List<RoomVO> roomlist(int pension_seq);

	// 3. 객실 수정
	public void roomupdate(RoomVO vo);

	// 4. 객실 삭제
	public void roomdelete(RoomVO vo);
	
	// 5. 객실 추가
	public void roominsert(RoomVO vo);
	
	// 6. 객실 전체 삭제
	public void roomalldelete(int pension_seq);

}

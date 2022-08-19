package com.pyori.mapper;

import java.util.List;

import com.pyori.domain.PensionVO;

public interface PensionMapper {

	// 숙소 등록 페이지
	// 1. 숙소 조회
	public List<PensionVO> pensionlist(String host_id);

	// 2. 숙소 수정
	public void pensionupdate(PensionVO vo);

	// 3. 숙소 삭제
	public void pensiondelete(int pension_seq);

	// 4. 숙소 추가
	public void pensioninsert(PensionVO vo);
	
	// 5. 숙소 전체 삭제
	public void pensionAllDelete(String host_id);

}

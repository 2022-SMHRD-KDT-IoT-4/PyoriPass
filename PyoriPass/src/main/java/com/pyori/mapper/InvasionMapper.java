package com.pyori.mapper;

import java.util.List;

import com.pyori.domain.InvasionVO;

public interface InvasionMapper {

	// 1. 침입 감지 영상 저장
	public void insertvideo(InvasionVO vo);

	// 2. 영상 게시판 : 영상 전부 조회
	public List<InvasionVO> selectallvideo();

	// 3. 영상 게시물 : 선택 영상 하나 조회
	public InvasionVO selectonevideo(int invasion_seq);

}

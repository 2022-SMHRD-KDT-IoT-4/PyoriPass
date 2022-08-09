package com.pyori.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pyori.domain.PensionVO;
import com.pyori.domain.RoomVO;
import com.pyori.mapper.PensionMapper;
import com.pyori.mapper.PensionRoomMapper;
import com.pyori.mapper.RoomMapper;

@RestController
public class PensionRoomRestController {

	// Ajax랑 통신해서, 요청을 처리하고, 데이터를 응답해주는 경우
	// @ResponseBody를 적지 않아도, 페이지 이동 대신 데이터를 리턴할 수 있게 해줌

	@Autowired
	PensionMapper p_mapper;
	@Autowired
	RoomMapper r_mapper;
	@Autowired
	PensionRoomMapper pr_mapper;

	// 1. 숙소명 가져오기
	@RequestMapping("/pensionList.do")
	public List<PensionVO> pensionList(String host_id) {
		List<PensionVO> list = p_mapper.pensionlist(host_id);
		return list;
	}

	// 2. 숙소명 수정하기
	@RequestMapping("pensionUpdate.do")
	public String pensionUpdate(PensionVO vo) {
		p_mapper.pensionupdate(vo);
		return "수정 성공";
	}

	// 3. 숙소명 삭제하기
	@RequestMapping("pensionDelete.do")
	public String pensionDelete(int pension_seq) {
		r_mapper.pensionroomdelete(pension_seq);
		p_mapper.pensiondelete(pension_seq);
		return "숙소 선택 삭제 성공";
	}

	// 4. 숙소 추가하기
	@RequestMapping("pensionInsert.do")
	public String pensionInsert(PensionVO vo) {
		p_mapper.pensioninsert(vo);
		return "pensionList.do";
	}

	// 5. 객실 조회하기
	@RequestMapping("roomList.do")
	public List<RoomVO> roomList(int pension_seq) {
		List<RoomVO> list = r_mapper.roomlist(pension_seq);
		return list;
	}

	// 6. 객실 수정하기
	@RequestMapping("roomUpdate.do")
	public int roomUpdate(RoomVO vo) {
		r_mapper.roomupdate(vo);
		return vo.getPension_seq();
	}

	// 7. 객실 삭제하기
	@RequestMapping("roomDelete.do")
	public RoomVO roomDelete(RoomVO vo) {
		r_mapper.roomdelete(vo);
		return vo;
	}

	// 8. 객실 추가하기
	@RequestMapping("roomInsert.do")
	public int roomInsert(RoomVO vo) {
		r_mapper.roominsert(vo);
		return vo.getPension_seq();
	}

	// 9. 숙소 전체 삭제
	@RequestMapping("pensionAllDelete.do")
	public String pensionAllDelete(String host_id) {

		System.out.println("host_id : " + host_id);
		int result1 = pr_mapper.pensionRoomAllDelete(host_id);
		int result2 = p_mapper.pensionAllDelete(host_id);

		System.out.println("result1 :" + result1 + ", result2 :" + result2);

		return "숙소 전체 삭제 성공";
	}

	// 10. 객실 전체 삭제
	@RequestMapping("roomAllDelete.do")
	public int roomAllDelete(int pension_seq) {
		r_mapper.roomalldelete(pension_seq);
		return pension_seq;
	}

}

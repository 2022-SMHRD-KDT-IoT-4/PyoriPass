package com.pyori.web;

import java.time.LocalDateTime;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pyori.domain.HostVO;
import com.pyori.domain.InvasionVO;
import com.pyori.mapper.HostMapper;
import com.pyori.mapper.InvasionMapper;

@Controller
public class InvasionController {

	@Autowired
	InvasionMapper i_mapper;
	@Autowired
	HostMapper h_mapper;

	// 1. 침입 감지 영상 영상 저장하기
	@PostMapping("/invasionInformation/video")
	public void video(@RequestBody Map<String, Object> payload) {
		// JSON 형태의 영상 key값 디코딩
		byte[] buf = Base64.getDecoder().decode((String) payload.get("key"));
		// 해당 위치에 파일 저장
		LocalDateTime now = LocalDateTime.now();
		String fileName = String.valueOf(now).replace(":", ".");

		// Files.write(Paths.get("C:\\Users\\SMHRD\\git\\PyoriPass2\\PyoriPass\\src\\main\\webapp\\resources\\video\\"+
		// fileName + ".mp4"), buf, StandardOpenOption.CREATE);

		InvasionVO vo = new InvasionVO();
		vo.setInvasion_time(String.valueOf(now).replace("T", " ").substring(0, 18));
		// vo.setInvasion_url("C:\\Users\\SMHRD\\git\\PyoriPass2\\PyoriPass\\src\\main\\webapp\\resources\\video\\"+
		// fileName + ".mp4");

		// 아래 한번 해보기
		vo.setInvasion_url("../../pyoripass/resources/video/"+fileName+".mp4");
		
		// DB에 침입 영상 url 저장
		i_mapper.insertvideo(vo);
	}

	// 2. 영상 게시판 : 영상 전부 조회
	@RequestMapping("/invasionInformation")
	public void invasionInformation(Model model) {
		List<InvasionVO> list = i_mapper.selectallvideo();
		model.addAttribute("list", list);
	}
	
	// 3. 영상 게시물
	// 3-1. 영상 게시물 페이지 이동
	@RequestMapping("/invasionInformationForm")
	public void invasionInformationForm() {
	}
	
	// 3. 영상 게시물 : 선택 영상 하나 조회
	@RequestMapping("/invasionInformationForm.do")
	public void invasionInformationForm(int invasion_seq, Model model) {

		// invasionInformationForm에 host 정보가 필요해서 
		// 임의로 넣어준 host 정보 : host_id가 "test@gmail.com"인 host의 정보
		HostVO vo = h_mapper.login("test@gmail.com");
		InvasionVO i_vo = i_mapper.selectonevideo(invasion_seq);
		
		// vo : 호스트 정보
		// i_vo : 영상 정보
		model.addAttribute("vo", vo);
		model.addAttribute("i_vo", i_vo);
	}
	

}

package com.pyori.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.pyori.domain.HostVO;
import com.pyori.mapper.HostMapper;

@Controller
public class HostController {

	@Autowired
	HostMapper mapper;

	// 암호화 객체 : 회원가입, 로그인, 비밀번호 찾기에 사용
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	// 메인페이지로 이동
	@RequestMapping("/main.do")
	public String main(HttpServletRequest request) {
		return "main";
	}

	// 1. 회원가입
	// 1-1. 회원가입 : 로그인 여부 확인
	@RequestMapping("/join.do")
	public String joincheck(HostVO vo, HttpSession session) {

		String result = mapper.join_check(vo.getHost_id());

		session.setAttribute("vo", vo);
		if (result != null) {
			return "redirect:/login";
		} else {
			System.out.println("joinCheck VO :" + vo);
			return "join";
		}
	}

	// 1-2. 회원가입 : 회원가입 폼에 이메일 자동 작성
	@RequestMapping("/joinForm.do")
	public void joinForm(HttpSession session) {
		HostVO vo = (HostVO) session.getAttribute("vo");
		if (vo.getHost_id() != null) {
			session.setAttribute("host_id", vo.getHost_id());
		}
		System.out.println("joinForm VO : " + vo);
	}

	// 1-3. 회원가입 : 회원가입 폼 작성 및 DB 저장
	@RequestMapping("/joinSuccess.do")
	public String joinSuccess(HostVO vo, Model model) {
		System.out.println(vo);

		// 비밀번호 암호화
		String securePassword = encoder.encode(vo.getHost_pw());
		vo.setHost_pw(securePassword);

		mapper.join(vo);
		model.addAttribute("vo", vo);
		return "dashMain";
	}

	// 2. 로그인
	@RequestMapping("login.do")
	public String login(HttpServletRequest request) {
		return "login";
	}

	@RequestMapping("loginForm.do")
	public String login_Check(String host_id, String host_pw, HttpSession session) {

		// 입력한 host_id로 host 정보 불러오기
		HostVO vo = mapper.login(host_id);
		
		// 입력한 비밀번호와 DB의 비밀번호가 같은지 비교
		if (encoder.matches(host_pw, vo.getHost_pw())) {
			// 일치하면 session에 vo값 pw 제외하고 저장해서 dashMain.do로 이동
			session.setAttribute("vo", vo.getHost_id());
			session.setAttribute("vo", vo.getHost_tel());
			session.setAttribute("vo", vo.getPension_name());
			return "dashMain.do";
		} else {
			// 불일치하면 로그인폼으로 다시 이동
			return "login";
		}
	}
	
	@RequestMapping("applogin.do")
	public @ResponseBody JSONObject applogin(String host_id, String host_pw) {
		JSONObject result = new JSONObject();
		
		HostVO vo = mapper.login(host_id);
		
		if (vo != null) {
			if (encoder.matches(host_pw, vo.getHost_pw())) {
				result.put("host_id", vo.getHost_id());
				result.put("host_pw", vo.getHost_pw());
				result.put("pension_name", vo.getPension_name());
				result.put("host_tel", vo.getHost_tel());
				
				System.out.println(result);
			}
		}
		return result;
	}

	// 3.로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}

	// 4.회원탈퇴
	@RequestMapping("delete.do")
	public String delete(HostVO vo) {
		mapper.Delete(vo.getHost_id());
		return "main";
	}

	// 5.정보 수정
	@RequestMapping("update.do")
	public String update(HostVO vo) {
		mapper.Update(vo);
		return "join";
	}

	// 6. 비밀번호 찾기 페이지 이동
	// 6-1. 비밀번호 찾기 페이지 이동
	@RequestMapping("/findPw.do")
	public void findPw() {
	}

	// 6-2. 우리 회원인지 체크
	@RequestMapping("findMyPw.do")
	public @ResponseBody String findMyPw(String host_id) {

		HostVO vo = mapper.login(host_id);
		if (host_id == vo.getHost_id()) {
			// 플라스크에서 이메일 전송
			// 플라스크에서 난수 지정해서 DB에 입력해주기
			// 난수 리턴
			// 비밀번호 String 형태로 반환
			return "";
		} else {
			return ""; // 가입된 회원이 아닐때
		}

	}

	// 1. 숙소 등록 페이지로 이동
	@RequestMapping("/pensionInfo")
	public String pensionInfo() {
		return "pensionInfo";
	}
}
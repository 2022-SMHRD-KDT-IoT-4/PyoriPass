package com.pyori.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pyori.domain.Host;
import com.pyori.mapper.HostMapper;

// POJO임을 명시
@Controller
public class TestController {

	// DI : Dependency Injection (의존성 주입)
	@Autowired
	HostMapper mapper;

	// 메인페이지로 이동
	@RequestMapping("/main.do")
	public String main(HttpServletRequest request) {
		return "main";
	}

	// 1. 회원가입
	// 1-1. 회원가입 : 로그인 여부 확인
	@RequestMapping("/join.do")
	public String joincheck(Host vo, Model model) {
		String result = mapper.login(vo.getHost_id());

		model.addAttribute("vo", vo);
		if (result != null) {
			return "login";
		} else {
			return "join";
		}
	}

	// 1-2. 회원가입 : 이메일 인증 페이지로 이동
	@RequestMapping("/joinEmail.do")
	public String joinemail(Host vo, String matchNumber, Model model) {
		System.out.println("joinEmail 내 host_id:" + vo.getHost_id());
		System.out.println("joinEmail 내 matchNumber :" + matchNumber);
		model.addAttribute("vo", vo);

		// 이메일 인증 실패 시
		if (matchNumber != null) {
			model.addAttribute("preMatchNumber", matchNumber);
		}
		return "joinEmail";
	}

	// 1-3. 회원가입 : 이메일 인증
	@RequestMapping("/joinEmailCheck.do")
	public String joinemailcheck(Host vo, String matchNumber, Model model) {

		// 이메일 인증하는 기능 구현해야함!!
		if (matchNumber.equals("1234")) {
			model.addAttribute("vo", vo);
			return "joinPw";
		} else {
			model.addAttribute("matchNumber", matchNumber);

			System.out.println("joinemailcheck 내 인증번호 :" + matchNumber);

			// help : post 방식으로 보낼 수 있나요?
			return "redirect:/joinEmail.do?host_id=" + vo.getHost_id();
		}

	}

	// 1-4. 회원가입 : 비밀번호 설정
	@RequestMapping("/joinPw.do")
	public String joinpw(Host vo, Model model) {
		System.out.println("joinpw 내 host vo : " + vo);
		model.addAttribute("vo", vo);
		return "joinPhone";
	}

	// 1-5. 회원가입 : 입력받은 전화번호에 인증번호 발송
	@RequestMapping("/joinPhone.do")
	public String joinphone(Host vo, String matchNumber, Model model) {
		System.out.println("joinphone 내 host vo :" + vo);

		// 휴대전화에 인증번호 발송하는 기능 구현해야함!!

		model.addAttribute("vo", vo);
		return "joinPhoneCheck";
	}

	// 1-6. 회원가입 : 휴대전화 인증
	@RequestMapping("/joinPhoneCheck.do")
	public String joinphonecheck(Host vo, String matchNumber, Model model) {
		
		System.out.println("joinphonecheck 내 인증번호 :" + matchNumber);

		// 발송한 인증번호랑 비교해야함!
	
		if (matchNumber.equals("1234")) {
			model.addAttribute("vo", vo);
			
		} else {
			model.addAttribute("matchNumber", matchNumber);


		}

		return "redirect:/joinPhoneCheck.do";

	}

}

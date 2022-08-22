package com.pyori.web;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pyori.domain.HostVO;
import com.pyori.mapper.HostMapper;
import com.pyori.sendMail.SendEmail;

@Controller
public class HostController {

	@Autowired
	HostMapper h_mapper;

	// 암호화 객체 : 회원가입, 로그인, 비밀번호 찾기에 사용
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	// 메일 전송 객체
	SendEmail sd = new SendEmail();

	// 1. 메인페이지로 이동
	@RequestMapping("/main.do")
	public String main(HttpServletRequest request) {
		return "main";
	}

	// 2. 마이페이지로 이동
	@RequestMapping("/myPage.do")
	public String myPage(HostVO vo, HttpSession session) {
		session.setAttribute("vo", vo);
		return "myPage";
	}

	// 1. 회원가입
	// 1-1. 회원가입 : 로그인 여부 확인
	@RequestMapping("/join.do")
	public String joincheck(HostVO vo, HttpSession session) {

		String result = h_mapper.join_check(vo.getHost_id());

		session.setAttribute("vo", vo);
		if (result != null) {
			return "redirect:/login";
		} else {
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
	}

	// 1-3. 회원가입 : 이메일로 인증 메일 링크 전송
	@RequestMapping("joinSendEmail.do")
	public @ResponseBody String joinSendEmail(HostVO vo) {

		h_mapper.joinForEmailCheck(vo.getHost_id());
		// host 테이블에 host_id와 authStatus(=0)으로 저장

		// 임의의 authKey 생성 & 이메일 발송
		vo.setHost_authStatus(sd.send(vo.getHost_id()));

		// vo : host_id, AuthKey 수정
		h_mapper.updateAuthKey(vo);

		return "메일 전송 성공";
	}

	// 1-4. 회원가입 : 이메일 인증 확인
	@RequestMapping("joinEmailConfirm.do")
	public String joinEmailConfirm(String host_id, int host_authStatus, HttpSession session) {
		System.out.println("이메일 인증 확인 들어옴!");
		HostVO vo = h_mapper.login(host_id);
		if (host_authStatus == vo.getHost_authStatus()) {
			vo.setHost_authStatus(1);
			h_mapper.updateAuthKey(vo);
			session.setAttribute("vo", vo);
			return "redirect:/joinForm.do";
		} else {
			return "이메일 인증 실패!";
		}
	}

	// 1-5. 회원가입 : 회원가입 폼 작성 및 DB 저장
	@RequestMapping("/joinSuccess.do")
	public String joinSuccess(HostVO vo, Model model) {

		// 비밀번호 암호화
		String securePassword = encoder.encode(vo.getHost_pw());
		vo.setHost_pw(securePassword);

		h_mapper.join(vo);
		model.addAttribute("vo", vo);
		return "redirect:/dashMain.do";
	}

	// 2. 로그인
	// 2-1. 웹 로그인하기
	@RequestMapping("login.do")
	public String login(HttpServletRequest request) {
		return "login";
	}

	@RequestMapping("loginForm.do")
	public String login_Check(String host_id, String host_pw, HttpSession session) {

		// 입력한 host_id로 host 정보 불러오기
		HostVO vo = h_mapper.login(host_id);

		// 입력한 비밀번호와 DB의 비밀번호가 같은지 비교
		if (encoder.matches(host_pw, vo.getHost_pw())) {
			// 일치하면 session에 vo값 pw 제외하고 저장해서 dashMain.do로 이동
			session.setAttribute("vo", vo);
			return "redirect:/dashMain.do";
		} else {
			// 불일치하면 로그인폼으로 다시 이동
			return "login";
		}
	}

	// 2-2. 앱 로그인하기 -> AppController로 이동

	// 3.로그아웃
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}

	// 4.회원탈퇴
	@RequestMapping("delete.do")
	public String delete(HostVO vo) {
		h_mapper.Delete(vo.getHost_id());
		return "main";
	}

	// 5.정보 수정
	@RequestMapping("update.do")
	public String update(HostVO vo) {
		h_mapper.Update(vo);
		return "join";
	}
	
	
	// 6. 비밀번호 찾기 페이지 이동
	// 6-1. 비밀번호 찾기 페이지 이동
	@RequestMapping("/findPw.do")
	public void findPw() {
	}

	// 6-2. 임시 비밀번호 발급 및 메일 전송
	@RequestMapping("findMyPw.do")
	public @ResponseBody String findMyPw(String host_id) {

		HostVO vo = h_mapper.login(host_id);

		// 가입된 계정인지 확인
		if (host_id.equals(vo.getHost_id())) {

			// 임시비밀번호 발급
			UUID uid = UUID.randomUUID();
			String tmpPw = uid.toString().substring(0, 10);

			// 임시비밀번호 암호화
			String securePassword = encoder.encode(tmpPw);

			// 임시비밀번호로 DB 데이터 수정
			vo.setHost_pw(securePassword);
			h_mapper.updateTempPw(vo);

			// 임시비밀번호 메일 전송
			sd.send(tmpPw, host_id);

			return "임시비밀번호를 발급했습니다. 메일을 확인하세요.";
		} else {
			return "가입된 계정이 아닙니다. 다시 확인해주세요."; // 가입된 회원이 아닐때
		}
	}
	
	
	

}
package com.pyori.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pyori.domain.HostVO;
import com.pyori.mapper.HostMapper;

@Controller
public class HostController {

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
	public String login_Check(HostVO vo, HttpSession session) {
		
		String result = mapper.login(vo);

		session.setAttribute("vo", vo);
		if (result != null) {
			return "dashMain.do";
		} else {
			return "login";
		}
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
}

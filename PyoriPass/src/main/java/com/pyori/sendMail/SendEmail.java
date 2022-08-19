package com.pyori.sendMail;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	public void send() {

		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); // gmail은 true 고정
		p.put("mail.smtp.port", "587"); // 네이버 포트
		p.put("mail.smtp.port", "587"); // 네이버 포트
		p.put("mail.smtp.starttls.required", "true");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		Authenticator auth = new MyAuthentication();
		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();
			from = new InternetAddress("kwb5025@gmail.com"); // 발신자 아이디
			// 이메일 발신자
			msg.setFrom(from);
			// 이메일 수신자
			InternetAddress to = new InternetAddress("byeori97@gmail.com");
			msg.setRecipient(Message.RecipientType.TO, to);
			// 이메일 제목
			msg.setSubject("님이 벨을 누르셨습니다/", "UTF-8");
			// 이메일 내용
			msg.setText("메일 전송 됐는지 테스트", "UTF-8");
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			// 메일보내기
			javax.mail.Transport.send(msg, msg.getAllRecipients());

		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		} catch (Exception msg_e) {
			msg_e.printStackTrace();
		}
	}

	// 임시비밀번호 전송
	public void send(String tmpPw, String host_id) {

		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); // gmail은 true 고정
		p.put("mail.smtp.port", "587"); // 네이버 포트
		p.put("mail.smtp.port", "587"); // 네이버 포트
		p.put("mail.smtp.starttls.required", "true");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		Authenticator auth = new MyAuthentication();
		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();
			from = new InternetAddress("kwb5025@gmail.com"); // 발신자 아이디
			// 이메일 발신자
			msg.setFrom(from);
			// 이메일 수신자
			InternetAddress to = new InternetAddress(host_id);
			msg.setRecipient(Message.RecipientType.TO, to);
			// 이메일 제목
			msg.setSubject("[hOngPEN] 회원님의 임시비밀번호를 발급했습니다.", "UTF-8");
			// 이메일 내용
			msg.setText(
					"안녕하세요, 호스트님. <br/>" + "NFC기반 스마트 도어락 hOngPEN입니다. <br/>" + "호스트님의 요청으로 발급된 임시비밀번호입니다. <br/> <h1>"
							+ tmpPw + "</h1><br/> 위의 임시비밀번호로 로그인 후 마이페이지를 통해 비밀번호를 수정해주세요.",
					"UTF-8");
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			// 메일보내기
			javax.mail.Transport.send(msg, msg.getAllRecipients());

		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		} catch (Exception msg_e) {
			msg_e.printStackTrace();
		}

	}

	public int send(String host_id) {
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); // gmail은 true 고정
		p.put("mail.smtp.port", "587"); // 네이버 포트
		p.put("mail.smtp.port", "587"); // 네이버 포트
		p.put("mail.smtp.starttls.required", "true");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		Authenticator auth = new MyAuthentication();
		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);

		// 이메일 인증 임시키 발급
		Random rd = new Random();
		int host_authStatus = 0;
		while (true) {
			host_authStatus = rd.nextInt(99999);
			if (host_authStatus > 10000 && host_authStatus < 99999) {
				break;
			}
		}

		try {
			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();
			from = new InternetAddress("kwb5025@gmail.com"); // 발신자 아이디
			// 이메일 발신자
			msg.setFrom(from);
			// 이메일 수신자
			InternetAddress to = new InternetAddress(host_id);
			msg.setRecipient(Message.RecipientType.TO, to);
			// 이메일 제목
			msg.setSubject("[hOngPEN] 회원가입을 위한 인증 링크가 발송되었습니다.", "UTF-8");
			// 이메일 내용
			msg.setText("안녕하세요, 호스트님. <br/> NFC기반 스마트 도어락 hOngPEN입니다. <br/> 회원가입을 위한 이메일 인증 링크입니다. <br/>"
					+ "아래 링크를 클릭하시면 이메일 인증이 완료됩니다. <br/> <h1> <a href='http://localhost:8083/pyoripass/joinEmailConfirm.do?host_id="
					+ host_id + "&host_authStatus=" + host_authStatus + "' target='_blenk'>이메일 인증 확인</a></h1>", "UTF-8");
			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");
			// 메일보내기
			javax.mail.Transport.send(msg, msg.getAllRecipients());

		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		} catch (Exception msg_e) {
			msg_e.printStackTrace();
		}
		return host_authStatus;
	}
}

/////////////////// 아래는 바꾸기 금지//////////////////////////////////
class MyAuthentication extends Authenticator {

	PasswordAuthentication pa;

	public MyAuthentication() {

		String id = "helloh0ngpen@gmail.com"; // 구글 이메일 아이디
		String pw = "leijehblxrpvlefv"; // 비밀번호

		// ID와 비밀번호를 입력한다.
		pa = new PasswordAuthentication(id, pw);
	}

	// 시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

}

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hOngPEN :: 회원가입</title>
</head>
<body>

	<h1>비밀번호를 설정해주세요!</h1>
	<form action="joinPw.do" method="post">
		<p>비밀번호 입력</p>
		<input type="text" name="host_pw">
		<p>비밀번호 재확인</p>
		<input type="text"> <input type="hidden"
			name="host_id" value="${vo.host_id}">
		<button type="submit">다음</button>
	</form>

	<!-- 비밀번호 확인 기능은 js로 함수써서 사용하는 게 좋을 것 같아요!
	틀리면 페이지 이동 X 맞을 때 페이지 이동 O니까 -->

</body>
</html>
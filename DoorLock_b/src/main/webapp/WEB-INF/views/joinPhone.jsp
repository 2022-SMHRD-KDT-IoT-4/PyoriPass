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

	<h1>휴대폰 번호를 입력해세요</h1>

	<form action="joinPhone.do" method="post">
		<p>전화번호 입력</p>
		<input type="text" name="host_tel">

		<input type="hidden" name="host_id" value="${vo.host_id}"> <input
			type="hidden" name="host_pw" value="${vo.host_pw}">
		<button type="submit">다음</button>
	</form>

</body>
</html>
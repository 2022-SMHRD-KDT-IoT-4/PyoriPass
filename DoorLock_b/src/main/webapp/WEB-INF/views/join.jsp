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

	<h2>계정 설정 마무리 하기</h2>
	<span>안전을 지키는 스마트 도어락! 계정을 등록해 다양한 혜택을 받아보세요.</span>

	<h3>메인에서 가져온 이메일 주소는 ${vo.host_id}</h3>


	<form action="joinEmail.do" method="post">
		<input type="hidden" name="host_id" value="${vo.host_id}">
		<button type="submit">다음</button>
	</form>
	
</body>
</html>
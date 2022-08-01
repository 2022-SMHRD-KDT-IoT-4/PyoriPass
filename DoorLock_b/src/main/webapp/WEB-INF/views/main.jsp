<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>hOngPEN :: 메인페이지</title>
</head>
<body>
	<h1>쾅쾅!! 문열어!! hOngPEN the Door!!!!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<!-- 회원가입 test -->
	<h2>회원가입 test</h2>
	<form action="join.do" method="post">
		<input type="text" name="host_id">
		<button type="submit">회원가입</button>
	</form>

</body>
</html>

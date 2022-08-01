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

	<h1>이메일을 인증받아 멤버십을 시작하세요</h1>
	<p>join에서 가져온 host_id : ${vo.host_id}</p>
	
	<form action="joinEmailCheck.do" method="post">
		<input type="text" name="host_id" value="${vo.host_id}"> <input
			type="text" name="matchNumber">

		<c:if test="${preMatchNumber != null}">
			<p>인증번호불일치!</p>
		</c:if>
		
		<button type="submit">다음</button>
	</form>

</body>
</html>
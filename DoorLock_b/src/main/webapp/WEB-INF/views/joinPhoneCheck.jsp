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

	<h1>휴대전화 인증 페이지</h1>
	<p>인증번호치삼</p>

	<form action="joinPhoneCheck.do" method="post">

		<input type="text" name="matchNumber" id="matchNumber"> <input
			type="hidden" name="host_id" value="${vo.host_id}"> <input
			type="hidden" name="host_pw" value="${vo.host_pw}">

		<c:if test="${matchNumber != null and matchNumber != '0'}">
			<span>인증번호 일치</span>
		</c:if>
		<c:if test="${matchNumber == 0}">
			<span>인증번호 불일치</span>
		</c:if>


		<button type="submit">다음</button>
	</form>


	<!-- 인증번호 틀렸을 때나 맞았을 때 input태그에 value 값 넣는 건 script로 처리해야할 것 같은데... -->
	<script>
		$('button').click(function() {
			let matchNumber = $('#matchNumber').val();
			if (('matchNumber') != null) {
				$('#matchNumber').attr('value', matchNumber)
			}

		})
	</script>

</body>
</html>

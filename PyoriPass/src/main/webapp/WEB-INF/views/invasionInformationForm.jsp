<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jQuery 라이브러리 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


	침입 감지 영상 하나 선택한 페이지

	<div id="board">
		<table id="list" border="1px black">
			<tr>
				<td>제목</td>
				<td>${vo.invasion_time}</td>
			</tr>
			<tr>
				<td><video autoplay controls width="250">
						<source src="${vo.invasion_url}" type="video/mp4">
						웹브라우저가 video 태그를 지원하지 않을 때 출력되는 텍스트입니다.
					</video></td>
			</tr>
		</table>
	</div>

	<script>
		console.log($('video'))
	</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// scope(request, session, application, pageContext)에서 꺼내오는 게 el
pageContext.setAttribute("cpath", request.getContextPath());
%>
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


	침입 감지 영상 페이지
	<!-- enctype 기본값 : application/x-www-form-urlencoded
						: Key&Value 형태로 데이터 전송
		파일, 이미지와 같은 많은 양의 데이터들을 전송해야할 때는 인코딩 방식을 
		multipart/form-data로 바꿔주어야함 -->
	<form action="invasionInformation/video" method="post"
		enctype="multipart/form-data">
		<input type="file" name="key">
		<button type="submit">서버보내기</button>
	</form>
	<!-- file은 서버에 특정 폴더를 지정해서 서버에 저장해주고, DB에는 경로, 파일이름만 저장해줄 거임! -->

	<div id="board">
		<table id="list" border="1px black">
			<tr>
				<td>index</td>
				<td>제목</td>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td></td>
					<td><a
						href="${cpath}/invasionInformationForm.do?invasion_seq=${vo.invasion_seq}">${vo.invasion_time}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script>
		console.log($('video'))
	</script>


</body>
</html>
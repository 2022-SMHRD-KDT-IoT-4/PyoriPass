<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 
/ 경로로 요청하면 index.jsp가 열림

이름을 index.jsp로 할 것
webapp 폴더에 만들 것
 --%>

	<%-- <jsp:forward page="boardList.do"></jsp:forward> --%>
	
	<%-- main으로 이동 --%>
	<jsp:forward page="main.do"></jsp:forward>

</body>
</html>
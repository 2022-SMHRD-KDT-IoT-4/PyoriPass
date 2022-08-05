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
<title>hOngPEN :: 숙소 페이지</title>
	
<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body onload="">

	<!-- 일단 숙소 드롭박스로 보여주기 -->
	<div class="container">
	
		<table>
			<thead>
				<tr>
					<td>숙소</td>
				</tr>
			</thead>
			<tbody id="pension_tbody">
			</tbody>
		</table>
	</div>
	
	<!-- 객실 보여주기 -->
	<table>
		<thead>
			<tr>
				<td>객실</td>
			</tr>
		</thead>
		
		<tbody id="room_tbody"></tbody>
	</table>

	<script src="resources/js/pension.js"></script>
	<script type="text/javascript">
		// 관리자페이지에서 vo 넘겨받아서 수정해주기
		// $(document).ready(loadBoard(${vo.host_id}));
		$(document).ready(loadBoard("test@gmail.com"));
	</script>
</body>
</html>
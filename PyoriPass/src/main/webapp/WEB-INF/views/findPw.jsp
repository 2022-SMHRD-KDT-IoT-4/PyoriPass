<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 라이브러리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	비밀번호 찾는 페이지

		<input type="text" id="host_id">
		<button onclick="findMyPw()">비밀번호보기</button>
		
		<script>
		function findMyPw(host_id){
			
			host_id = $('#host_id').val();
			console.log(host_id)
			
			$.ajax({
				url: 'findMyPw.do',
				type: 'post',
				data: {
					'host_id': host_id
				},
				success: function (res) {
					alert(res)
				},
				error: function () {
					alert('error')
				}
			});
		}
		</script>

</body>
</html>
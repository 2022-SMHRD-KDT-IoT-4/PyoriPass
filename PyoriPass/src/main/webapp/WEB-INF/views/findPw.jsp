<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<title>hOngPEN</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="resources/css/reset_Main_style.css">
<!-- jQuery 라이브러리 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<!-- partial:index.partial.html -->
	<div class="blog">
		<div class="blog-part is-menu">
			<a href="main.do" class="blog-menu"> Main </a> <a href="login.do"
				id="MainLoginbtn" class="blog-menu">Login </a> <a href="#"
				class="blog-menu mention">@pyoripass</a> <a href="#"
				class="blog-menu subscribe">hOngPEN</a>
		</div>



		<div class="login1-pwfind_container">
			<div class="login1-pwfind_main_container">
				<div class="login1-pwfind_main_title">Find PassWord</div>
				<div class="login1-pwfind-form">
					<img class="login1-pwfind-img" src="resources/img/pw.png">
					<div class="login1-pwfind-content1">1/3 단계</div>
					<input type="text" id="login1-pwfind-email"
						placeholder="이메일 주소를 입력해주세요."> <input type="button"
						id="login1-pwfind-btn" value="임시비밀번호 발급" onclick="findMyPw()">
				</div>
			</div>
		</div>






	</div>
	<!-- partial -->
	<script>
		function findMyPw(host_id) {

			host_id = $('#login1-pwfind-email').val();
			console.log(host_id)

			$.ajax({
				url : 'findMyPw.do',
				type : 'post',
				data : {
					'host_id' : host_id
				},
				success : function(res) {
					alert('입력하신 메일 주소로 임시 비밀번호가 발급되었습니다.')
				},
				error : function() {
					alert('error')
				}
			});
		}
	</script>
	<script src="resources/js/main.js"></script>
</body>
</html>

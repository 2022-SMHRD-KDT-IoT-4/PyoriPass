<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  <title>hOngPEN</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="resources/css/reset_Main_style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="blog">
 <div class="blog-part is-menu">
  <a href="main.do" class="blog-menu">
   Main
  </a>
  <a href="login.do" id="MainLoginbtn" class="blog-menu">Login
  <svg fill="none" stroke="currentColor" stroke-width=".7" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-up-right" viewBox="0 0 24 24">
    <path d="M7 17L17 7M7 7h10v10" />
   </svg>
  </a>
  <a href="#" class="blog-menu mention">@pyoripass</a>
  <a href="#" class="blog-menu subscribe">hOngPEN</a>
 </div>
 
 
 
 
 <div class = "login1_container">
        <div class="login1_main_container">
            <div class="login1_main_title">LOG IN</div>
            <div class="login1-form">
                <form id = "login1_pass" name = "login_pass" method = "post" action = "loginForm.do">
                    <input type="text" name="host_id" class="text-field" placeholder="이메일 주소">
                    <br>
                    <input type="password" name="host_pw" class="text-field" placeholder="비밀번호">
                    <br>
                    <input type="submit" value="login" class="login1_submit-btn">
                    <br>
                    <br>
                    <span class="login1-find">
                        비밀번호를 잃어버리셨나요? 
                        <a href="findPw.do" class="login1_find_pw"> 비밀번호 찾기</a>
                    </span>
                </form>
            </div>
        </div>
    </div>
  


</div>
<!-- partial -->
  <script src="resources/js/main.js"></script>
</body>
</html>

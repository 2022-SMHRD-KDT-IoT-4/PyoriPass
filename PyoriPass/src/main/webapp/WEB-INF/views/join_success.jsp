<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Modern Blog Layout with CSS Grid</title>
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



    <!-- 회원가입 2(이메일 인증받기)  -->
    <div class = "join6_container">
    <div class = "join6_main_container">
        <div class="join6_content_container">
        <div class="join6_number"> 회원가입 완료</div>
        <br>
        <div class="join6_title"> 
            hOngPEN 을 사용하실 준비가
            <br>
            완료되었습니다!
        </div>
        <br>
        <div class="join6-form">
                <br>
                NFC 기술을 이용한 숙소 보안 강화
                <br>
                <br>
                설정 기한 일회성 키 발급
                <br>
                <br>
                침입 감지시 카메라 촬영
                <br>
                <br>
                디스플레이를 이용한 손쉬운 사용
                <br>
        </div>
        <br>
        <button type ="button" class="join6_btn" onclick="location.href='login.do'"> 로그인하러 가기 > </button>
        </div>
        </div>
    </div>
    
        

  </div>
<!-- partial -->
  <script src="resources/js/main.js"></script> 
</body>
</html>

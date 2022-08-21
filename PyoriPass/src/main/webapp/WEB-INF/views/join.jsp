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
 
 
 
 
 <div class = "join_container">
    <div class = "join_main_container">
        <img class="join_img1" src="resources/img/join1_1.png" style="width: 300px; height: 300px;">
        <div class="join_content_container">
        <div class="join_number"> 1/4 단계</div>
        <div class="join_title"> 계정 설정 마무리 하기 </div>
        <div class="join_content">
            안전을 지키는 스마트 도어락!
            <br>
            계정을 등록해 다양한 혜택을 받아보세요.
        </div>
        <br>
        <button type ="button" class="join_pre_btn" onclick="location.href='main.do'"> 이전 </button>
        <button type ="button" class="join_btn" onclick="location.href='joinForm.do'"> 다음 </button>
        </div>
        </div>
    </div>


</div>
<!-- partial -->
  <script src="resources/js/main.js"></script> 
</body>
</html>

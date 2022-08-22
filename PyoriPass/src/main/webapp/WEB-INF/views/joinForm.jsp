<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
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
  </a>
  <a href="#" class="blog-menu mention">@pyoripass</a>
  <a href="#" class="blog-menu subscribe">hOngPEN</a>
 </div>
 
 
  
  
   <div class="blog-header blog-is-sticky">
  <div class="blog-article header-article">
   <div class="blog-big__title">Join us</div>
   <div class="blog-menu rounded small-title">made by pyoripass</div>
  </div>
  <div class="blog-article page-number">
   
  </div>
 </div>
 <div class="blog-header-container">
  <div class="blog-header">
   <div class="blog-article header-article">
    <div class="blog-big__title">DoorLock</div>
    <div class="blog-menu small-title date">23.08.2022</div>
   </div>
   
   
   
   
   <div class="blog-article">
   <input type="hidden" value=${vo.host_id} class="host_id" />
   
   
   <form class="join1_content_form" action="joinSuccess.do" method="post">
            <input type="text" id="join1_email"name="host_id" placeholder="이메일 주소(자동저장)" value="${host_id}"> 
            <br>
            <input type="button" id="join1_email_btn" value="링크인증받기" onclick="join_email()">
            <br>
			<input type="password" name = "host_pw" class="join1_pw" id="join1_password" placeholder="비밀번호">
            <br>
            <input type="password" class="join1_pw" id="join1_password2" placeholder="비밀번호재확인">
            <br>
            <span id="same"></span>
            <br>
            <!--<input type="text" id="host_tel" name="host_tel"placeholder="전화번호 입력">
            <button onclick="" id="host_tel_check">인증번호 받기</button>
            <br>  -->
            <div id ="under"> Please put it down </div>
            
   
   
   </div>
  </div>
  <div class="blog-header">



			<!--<input type="text" id="matchNumber" placeholder="인증번호를 입력하세요.">
            <p>인증번호가 일치합니다.</p>  -->
			<p>제품 하단에 기재된 제품 번호를 확인해 입력해주세요.</p>
            <input type="text" id="join1_product_num" class="product_num" placeholder="제품 번호">
            <br>
            <span id="same2"></span>
            <br>
	        <button type ="button" class="join1_pre_btn" onclick="location.href='join.do'"> 이전 </button>
	        <button type ="submit" class="join1_btn"> 가입하기 </button>
            </form>



  </div>
  
  
  
  
  
 </div>
 <div class="blog-part right-blog">
  <div class="blog-right-title-container">
   <div class="blog-right-title">
     introduce 
     <br>the pyoripass team
   </div>
  </div>
  <div class="blog-right">
  
  </div>
  
  
  
  
 

</div>
<!-- partial -->
<script src="resources/js/main.js"></script>
</body>
</html>

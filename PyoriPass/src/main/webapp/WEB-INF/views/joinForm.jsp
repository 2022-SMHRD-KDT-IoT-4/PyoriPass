<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>eLEARNING - eLearning HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/Main_style.css" rel="stylesheet">
</head>

<body>


    <!-- Navbar Start (Header) -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <div class="header-logo-container">
            <a href="pyoripass/">
        <img class="header-logo" src="resources/img/hongpen.png">
            </a>

        </div>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <a href="login.do" id="MainLoginbtn">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </nav>
    <!-- Navbar End (Header)-->

    <!-- 회원가입 1(계정 설정 마무리 하기)  -->
    <div class = "join1_container">
    <div class = "join1_main_container">
        <div class="join1_content_container">
            <div class="join1_content_title">JOIN US</div>
            <form class="join1_content_form" action="joinSuccess.do">
            <input type="text" id="join1_email"name="host_id" placeholder="이메일 주소(자동입력)"> 
            <input type="button" id="join1_email_btn" value="링크인증받기">
            <br>
            <input type="password" name = "host_pw" class="join1_pw" id="join1_password" placeholder="비밀번호">
            <br>
            <input type="password" class="join1_pw" id="join1_password2" placeholder="비밀번호재확인">
            <br>
            <span id="same"></span>
            <br>
            <input type="text" id="host_tel" name="host_tel"placeholder="전화번호 입력">
            <button onclick="" id="host_tel_check">인증번호 받기</button>
            <br>
            <input type="text" id="matchNumber" placeholder="인증번호를 입력하세요.">
            <p>인증번호가 일치합니다.</p>
            <br>
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
    </div>
    
        

    <!-- Footer Start -->
    <div class="footer-container" data-wow-delay="0.1s">
        
        <div class="container">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="#">표리패스</a>, All Right Reserved.

                        <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">원표벼리예지우담</a><br><br>
                        Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                    <div class="col-md-6 text-center text-md-end">
                        <div class="footer-menu">
                            <a href="">개인정보처리방침</a>
                            <a href="">이용약관</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->




    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="resources/js/main.js"></script>
</body>

</html>
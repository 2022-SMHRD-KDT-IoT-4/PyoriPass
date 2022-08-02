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
            <a href="main.do">
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

    <!-- main 1 -->
    <div class="MainTitle_Container">
        <br><br>
        <br><br>
        <br><br>
        <div class="MainTitle_Title">
                편리하고 스마트한 생활을 위한 도어락
        </div> 
        <br>
        <br>
        <div class="MainTtile_1">
                안전한 생활, 편안한 여행을 위해.
        </div>
        <div class="MainTitle_2">
                도어락에 스마트한 기술을 더해 "안심"이라는 고객가치를 이어나갑니다.
        </div>
        <br>
        <br>
        <div class="MainTilte_email_Container">
            <input class="MainTilte_email" type="text" placeholder="이메일 주소">
            <button type="button" class="MainTilte_email_button" onclick="location.href='join.do'">가입하기></button>
        </div>

    </div>




    <!-- 제품 실사 -->
    <div class="real_product">
            제품 사진 쭉쭉~

    </div>


    <!-- 기능 안내 -->
   <div class="main_function">
        <div class="main_function_container">
            <!-- 첫번째 -->
            <div class="function_1" data-wow-delay="5s">
                <img class="main_function_img1" src="resources/img/1.png" style="width: 300px; height: 300px;">
                <div class="function_color">
                    <div class="p-4">
                <h1 class="function_1_title">NFC기술을 이용한 잠금기능</h1>
             
                <h3 class="function_1_secondtitle">호스트를, 투숙객을 위한 스마트 잠금 기능 적용</h3>
                <p>스마트폰이 다른 전자기기와 근거리 무선통신을 할 수 있도록 개발된 기술인 NFC를 사용.
                    <br>
                    호스트는 스마트폰 또는 웹페이지를 통해 손쉽게 키 생성 및 부여를 할 수 있고,
                    <br>
                    생성된 키에는 유효 기간을 설정하여 침입 범죄에 효과적으로 대응할 수 있습니다.
                </p>
                    </div>
                </div>
            </div>
            <br>
            <!-- 두번째 -->
            <div class="function_2" data-wow-delay="5s">
                <img class="main_function_img2" src="resources/img/2.png" style="width: 300px; height: 300px;">
                <div class="function_color">
                    <div class="p-4">
                <h1 class="function_2_title">내장된 카메라로 <br> 보안을 더욱 강력하게</h1>
                <h3 class="function_2_secondtitle">수상한 움직임이 감지될 경우 안심 모니터링 가능</h3>
                <p>도어락에 내장되어 있는 카메라는 블랙박스 형식으로 움직임이 감지될 경우 SD 카드에 영상을 저장합니다.
                </p>
                    </div>
                </div>
            </div>
            <br>
            <!-- 세번째 -->
            <div class="function_3" data-wow-delay="5s">
                <img class="main_function_img3" src="resources/img/3.png" style="width: 300px; height: 300px;">
                <div class="function_color">
                    <div class="p-4">
                <h1 class="function_3_title">안전을 책임지는 충격 감지 센서</h1>
                <h3 class="function_3_secondtitle">호스트가 설정하지 않은 움직임 감지시 카메라 작동</h3>
                <p>
                    어쩌고 저쩌고
                </p>
                    </div>
                </div>
            </div>
            <br>
            <!-- 네번째 -->
            <div class="function_4" data-wow-delay="5s">
                <img class="main_function_img4" src="resources/img/4.png" style="width: 300px; height: 300px;">
                <div class="function_color">
                    <div class="p-4">
                <h1 class="function_4_title">사용자의 원활한 사용을 위한 디스플레이 탑재</h1>
                <h3 class="function_4_secondtitle">불편함 없이 사용할 수 있도록 디스플레이 탑재</h3>
                <p>
                    모든 기술력을 사용자가 부족함 없이 제공받을 수 있도록 디스플레이 탑재.<br>
                    원활한 제품 사용을 위한 제품 사용 안내 방법이 자동탑재 되어있습니다. 
                </p>
                    </div>
                </div>
            </div>
            <br>
            <!-- 끝 -->
        </div>
   </div>
   <br>
   <br>
   <br>



    <!-- 기능 안내 끝 -->


        
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
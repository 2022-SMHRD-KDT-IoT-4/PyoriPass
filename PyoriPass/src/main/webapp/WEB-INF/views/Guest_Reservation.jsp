<%@page import="com.pyori.domain.RoomVO"%>
<%@page import="com.pyori.domain.HostVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>hOngPEN</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 탭 로고-->
<link rel="icon" href="resources/img/로고1 (1).jpg">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link href="resources/css/dashstyle.css" rel="stylesheet">


   <style>
    #weatherWidget .currentDesc {
        color: #ffffff!important;
    }
        .traffic-chart {
            min-height: 335px;
        }
        #flotPie1  {
            height: 150px;
        }
        #flotPie1 td {
            padding:3px;
        }
        #flotPie1 table {
            top: 20px!important;
            right: -10px!important;
        }
        .chart-container {
            display: table;
            min-width: 270px ;
            text-align: left;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        #flotLine5  {
             height: 105px;
        }

        #flotBarChart {
            height: 150px;
        }
        #cellPaiChart{
            height: 160px;
        }
    </style>
</head>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>
<%
	HostVO vo = (HostVO)session.getAttribute("vo");
	RoomVO roomvo = new RoomVO();
%>
<script>
	$(document).ready(function(){
		selectP('${vo.getHost_id()}')
	});
	
</script>

      <!-- Left Panel -->
      <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
					<li class="dash-menu"><a href="dashMain.do?host_id=${vo.host_id}"><i
							class="menu-icon fa fa-laptop"></i>home </a></li>
					<li class="dash-menu"> <a
						href="Rentals_information?host_id=${vo.host_id}"
						class="dropdown-toggle"> <i class="menu-icon fa fa-cogs"></i>Rentals
							Information
					</a></li>
					<li class="active"><a
						href="Guest_Reservation?host_id=${vo.host_id}"
						class="dropdown-toggle"> <i class="menu-icon fa fa-table"></i>Guest
							Reservation
					</a></li>
					<li class="dash-menu"><a 
						href="invasionInformation" 
						class="dropdown-toggle"> <i class="menu-icon fa fa-th"></i>Intrusion Detection
					</a></li>
				</ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
			<div class="top-left">
				<div class="navbar-header">
					<a class="navbar-brand" href="dashMain.do?host_id=${vo.host_id}"><img
						id="hongpenlogo" src="resources/img/hongpen.png" alt="Logo"></a>
					<a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
				</div>
			</div>
			<div class="top-right">
				<div class="header-menu">
					<!-- 0809 추가한 부분 -->
					<div class="host_info">
						 <a id="host_page" href="myPage.do?host_id=${vo.host_id}"><img id="host_info_photo" src="resources/img/호스트 정보.png"></a>
					</div>

				</div>
			</div>
		</header>
        <!-- /#header -->
        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">
                <!-- 게스트 등록  -->
                <div class="guest_reservation_container">
                    <div class="guest_reservation_content_container">
                        <div class="guest_reservation_title"> Guest Reservation </div>
                        
                        <div class="guest_reservation_content">
                        <form name="guest_reservation_form" id="guest_reservation_content_input" action="insertGuestReservation.do" method = "post">
                        <br>
                        게스트명 <input type="text" id="guest_reservation_personname" name="guest_name">
                        <br>
                        예약번호 <input type="text" id="guest_reservation_rnum" name="reservation_num">
                        <!--  <input type="hidden" value="${reservation_num}" id="reservation_num">-->
                        <br>
                        전화번호 <input type="text" id="guest_reservation_pnum" name="guest_phone">
                        <br>
                        숙소명 <select name = "pension_name" id="guest_reservation_pname" class=${vo.host_id} onchange="selectR(this.value)">
                       	</select>
                        <br>
                        객실명 <select name = "room_name" id="guest_reservation_rname"">         
                   </select>
                        <br>
                        투숙일자 <input type="date" id="guest_reservation_checkin" name="checkin_date"> - <input type="date" id="guest_reservation_checkout" name="checkout_date">
                           <br>
                           <br>
                           <input type="button" value="취소" id="guest_reservation_cancle" onclick="location.href = 'dashmain.html'">
                           <button type="submit" id="guest_reservation_ok">등록</button>
                        </form>
                        </div>
                    </div>
                </div>

            <!-- /#add-category -->
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2018 Ela Admin
                    </div>
                    <div class="col-sm-6 text-right">
                        Designed by <a href="https://colorlib.com">Colorlib</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

   		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
		<script src="resources/js/dashmain(guest,rentals).js"></script>
		
		
		
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		</script>
</body>
</html>
    
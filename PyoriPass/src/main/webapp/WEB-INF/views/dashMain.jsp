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
<title>Ela Admin - HTML5 Admin Template</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 탭 로고-->
<link rel="icon" href="resources/img/로고1 (1).jpg">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link href="resources/css/dashstyle.css" rel="stylesheet">
<link href="/pyoripass/resources/fullcalendar-5.11.2/lib/main.css" rel="stylesheet" />

<style>
#weatherWidget .currentDesc {
	color: #ffffff !important;
}

.traffic-chart {
	min-height: 335px;
}

#flotPie1 {
	height: 150px;
}

#flotPie1 td {
	padding: 3px;
}

#flotPie1 table {
	top: 20px !important;
	right: -10px !important;
}

.chart-container {
	display: table;
	min-width: 270px;
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

#flotLine5 {
	height: 105px;
}

#flotBarChart {
	height: 150px;
}

#cellPaiChart {
	height: 160px;
}
</style>
<!-- jQuery 라이브러리 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>

        




<!-- 인트로 -->



	<!-- Left Panel -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="dashMain.do?host_id=${vo.host_id}"><i
							class="menu-icon fa fa-laptop"></i>home </a></li>
					<li class="dash-menu"> <a
						href="Rentals_information?host_id=${vo.host_id}"
						class="dropdown-toggle"> <i class="menu-icon fa fa-cogs"></i>Rentals
							Information
					</a></li>
					<li class="dash-menu"><a
						href="Guest_Reservation?host_id=${vo.host_id}"
						class="dropdown-toggle"> <i class="menu-icon fa fa-table"></i>Guest
							Reservation
					</a></li>
					<li class="dash-menu"><a 
						href="invasionInformation" 
						class="dropdown-toggle"> <i class="menu-icon fa fa-th"></i>Intrusion Detection
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
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
				<!-- 맨 위 현재, 바로 다음 예약 일정 보여주는 창  -->
				<div class="bookings">
					<!-- 오늘 -->
					<div class="Todaybookingscontainer">
						<div class="card">
							<div class="card-body">
								<!-- 내용 -->
								<div class="card-content">
									<div class="bookings_content_title">Today's Bookings</div>
									<div class = "b_today" id="b_today">
										<div id = "b_today_id"></div>
										<div id = "b_today_date"></div>
										<div id="b_today_nfc"></div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 다음 -->
					<div class="Nextbookingscontainer">
						<div class="card">
							<div class="card-body">
								<div class="card-content">
									<div class="bookings_content_title">Next Bookings</div>
									<div class = "b_tomorrow" id="b_tomorrow">
										<div id = "b_tomorrow_id"></div>
										<div id = "b_tomorrow_date"></div>
										<div id="b_tomorrow_nfc"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br> <br>


				<!-- 대시보드 최근 예약 리스트 -->
				<div class="recent_bookings_list_container">
					<div class="recent_bookings_list">
						<div class="dash-list">
							<div class="card">
								<div class="card-body">
									<h4 class="box-title">Recent Bookings</h4>
								</div>
								<div class="card-body--">
									<div class="table-stats order-table ov-h">
										<table id="guest_listTable" class="table">
											<!-- <thead>  -->
												<tr>
													<th class="serial">게스트</th>
													<th>숙소명</th>
													<th>체크인</th>
													<th>체크아웃</th>
													<th>객실</th>
													<th>실행키 발급</th>
												</tr>
											</thead>
											<tbody id = "dash_tbody">
											</tbody>
										</table>
									</div>
									<!-- /.table-stats -->
								</div>
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col-lg-8 -->

					</div>
				</div>
				<br>

				<!-- calendar -->
				<div class="calendar-container">
					<div class="calendar">
							<!-- <h4 class="box-title">Chandler</h4> -->
							<div id="calendar"></div>
					</div>

					<div class="calendar-content-container">
						<div class="calendar-content">
							<div class="calendar_content-title">book this month</div>
							<div class="calendar_content" id="calendar_content" >
								
							</div>
						</div>

					</div>

				</div>

				<!-- /#add-category -->
				<!-- .animated -->
			</div>
			
			
			
			<!-- /.content -->
			<div class="clearfix"></div>
			<!-- Footer -->
			<footer class="site-footer">
				<div class="footer-inner bg-white">
					<div class="row">
						<div class="col-sm-6">Copyright &copy; 2018 Ela Admin</div>
						<div class="col-sm-6 text-right">
							Designed by <a href="https://colorlib.com">Colorlib</a>
						</div>
					</div>
				</div>
				<input type="hidden" value=${vo.host_id} class="host_id" />
			</footer>
			<!-- /.site-footer -->
		</div>
		</div>
		<!-- /#right-panel -->

		<!-- Scripts -->
		
		

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/pyoripass/resources/fullcalendar-5.11.2/lib/main.js"></script>
<script src="/pyoripass/resources/js/dashmain.js"></script>
<script> // 기본 캘린더 띄우는 script
        document.addEventListener('DOMContentLoaded', function() {
        	let calendarEl = document.getElementById('calendar');
        	let calendar = new FullCalendar.Calendar(calendarEl, {
          		initialView: 'dayGridMonth'
        	});
        	calendar.render();
      	});
      
      
      $(document).ready(loadList);
      $(document).ready(loadcalendar);
      $(document).ready(today);
      $(document).ready(tomorrow);
</script>
</body>
</html>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Ela Admin - HTML5 Admin Template</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="resources/css/dashstyle.css">
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<link
	href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</head>

<body>

	<!-- Left Panel -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="dash-menu"><a href="dashmain.html"><i
							class="menu-icon fa fa-laptop"></i>home</a></li>
					<li class="active"><a href="Rentals_information.html"
						class="dropdown-toggle"> <i class="menu-icon fa fa-cogs"></i>Rentals
							Information
					</a></li>
					<li class="dash-menu"><a href="Guest_Reservation.html"
						class="dropdown-toggle"> <i class="menu-icon fa fa-table"></i>Guest
							Reservation
					</a></li>
					<li class="dash-menu"><a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-th"></i>Intrusion Detection
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
					<a class="navbar-brand" href="dashmain.html"><img
						id="hongpenlogo" src="img/hongpen.png" alt="Logo"></a> <a
						id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
				</div>
			</div>
			<div class="top-right">
				<div class="header-menu"></div>
			</div>
		</header>
		<!-- /#header -->
		<!-- Content -->
		<div class="content">
			<!-- Animated -->
			<div class="animated fadeIn">
				<!-- 게스트 등록  -->
				<div class="rentals_information_container">
					<div class="rentals_information_content_container">
						<div class="rentals_information_title">Rentals Information</div>

						<div class="rentals_information_content">


							<!-- 숙소 리스트, 추가, 수정, 삭제-->
							<div class="list-box">
								<h1>Pension List</h1>
								<div class="write-box">
									<input type="text" class="text-basic">
									<input type="hidden" value="${host_id}" id="hostId">
								<button type="button" id="btnAdd" onclick ="addList()">추가</button>
								
								</div>
								<table class="list-table">
									<colgroup>
										<col width="10%">
										<col width="90%">
									</colgroup>
									<br>
									<thead>
										<tr>
											<th id="check_title">check</th>
											<th>pension List</th>
										</tr>
									</thead>
									<tbody id="listBody">
										<tr>
											<td><input type="checkbox" class="btn-chk"></td>
											<td>
												<!--<td onclick="r_list()">--> <!--<a href="#" onclick="r_list()"></a>-->
											</td>
										</tr>

									</tbody>
								</table>
								<div class="btn-area">
									<button type="button" id="DeleteSel" onclick="delSelected()">선택 삭제</button>
									<button type="button" id="btnUpdate" onclick="btnUpdate()">선택 수정</button>
									<button type="button" id="btnDelAll" onclick="delAllEle()">전체 삭제</button>
								</div>
							</div>
							<br> <br>

							<!-- 여기까지 -->

							<!--객실 띄우기-->

							<!-- room_name-->
							<div id="r_list-box" class="r_list-box" style="display: none;">
								<h1>Room List</h1>
								<div class="r_write-box">
									<input type="text" class="r_text-basic">
									<button type="button" id="r_btnAdd" onclick="r_addList">추가</button>
								</div>
								<table class="r_list-table">
									<colgroup>
										<col width="10%">
										<col width="90%">
									</colgroup>
									<thead>
										<tr>
											<th id="check_title">check</th>
											<th>room list</th>
										</tr>
									</thead>
									<tbody id="r_listBody">
										<tr>
											<td><input type="checkbox" class="r_btn-chk"></td>
											<td></td>
										</tr>

									</tbody>
								</table>
								<br>
								<div class="r_btn-area">
									<button type="button" id="r_DeleteSel">선택 삭제</button>
									<button type="button" id="r_btnUpdate">선택 수정</button>
									<button type="button" id="r_btnDelAll">전체 삭제</button>
								</div>
							</div>



							<!-- 여기까지 -->
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
					<div class="col-sm-6">Copyright &copy; 2022 pyoripass</div>
					<div class="col-sm-6 text-right">
						Designed by <a href="https://colorlib.com">Colorlib</a>
					</div>
				</div>
			</div>
		</footer>
		<!-- /.site-footer -->
	</div>
	<!-- /#right-panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<!-- js 연결 -->
	<script src="resources/js/dashmain.js"></script>
		<script type="text/javascript">
		$(document).ready(loadBoard());
	</script>

	<!--  Chart js -->
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

	<!--Chartist Chart-->
	<script
		src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
	<script src="js/init/weather-init.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
	<script src="js/init/fullcalendar-init.js"></script>

	<script>
		
	</script>

</body>

</html>
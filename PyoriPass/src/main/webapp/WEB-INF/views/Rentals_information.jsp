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
<!-- jQuery 라이브러리 -->
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

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<body>

	<!-- Left Panel -->
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">
			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="dash-menu"><a href="dashMain.do?host_id=${vo.host_id}"><i
							class="menu-icon fa fa-laptop"></i>home </a></li>
					<li class="active"> <a
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
									<input type="hidden" value="${host_id}" id="host_id">
									
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
									<br>
									<tbody id="listBody">
										<tr>
											<td><input type="checkbox" class="btn-chk"></td>
											<td>
												<!--<td onclick="r_list()">--> <!--<a href="#" onclick="r_list()"></a>-->
											</td>
										</tr>

									</tbody>
								</table>
								<br>
								<div class="btn-area">
									<button type="button" id="DeleteSel" onclick="delSelected()">선택 삭제</button>
									<button type="button" id="btnUpdate" onclick="btnUpdate()">선택 수정</button>
									<!--  <button type="button" id="updatebtn" style="display:none;" onclick="btnUpdate_done()">수정완료</button>-->
									<button type="button" id="btnDelAll" onclick="delAllEle()">전체 삭제</button>
								</div>
							</div>
							<br> <br>

							<!-- 여기까지 -->

							<!--객실 띄우기-->

							<!-- room_name-->
							<div id="r_list-box" class="r_list-box" style="display: none;">
								<h1 id="r_num">Room List</h1>
								<div class="r_write-box">
									<input type="text" class="r_text-basic">
									<button type="button" id="r_btnAdd" onclick="r_addList()">추가</button>
								</div>
								<table class="r_list-table">
									<colgroup>
										<col width="10%">
										<col width="90%">
									</colgroup>
									<br>
									<thead>
										<tr>
											<th id="check_title">check</th>
											<th>room list</th>
										</tr>
									</thead>
									<br>
									<tbody id="r_listBody">
										<tr>
											<td><input type="checkbox" class="r_btn-chk" ></td>
											<td></td>
										</tr>

									</tbody>
								</table>
								<br>
								<div class="r_btn-area">
									<button type="button" id="r_DeleteSel">선택 삭제</button>
									<button type="button" id="r_btnUpdate">선택 수정</button>
									<button type="button" id="updatebtn" style="display:none;">수정완료</button>
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
	
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
		<script src="resources/js/dashmain(guest,rentals).js"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
		</script>
		<script>
		$(document).ready(loadBoard);
		</script>
		
</body>

</html>
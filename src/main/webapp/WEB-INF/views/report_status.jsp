<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
	
<!-- plugins:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/style.css">

<!-- End layout styles -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/images/favicon.png" />
<!-- plugins:js -->
<script
	src="${pageContext.request.contextPath}/resources/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script
	src="${pageContext.request.contextPath}/resources/assets/vendors/chart.js/Chart.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="${pageContext.request.contextPath}/resources/assets/js/off-canvas.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/hoverable-collapse.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/misc.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/settings.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script src="${pageContext.request.contextPath}/resources/assets/js/dashboard.js"></script>
<!-- End custom js for this page -->
	
</head>

<body>
	<div class="container-scroller">
		<!-- 왼쪽 슬라이드 바 로고 -->
		<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<div
				class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
				<!-- 이미지를 링크화 한것 -->
				<a class="card-title text-primary" style="text-align: left;"
					href="${pageContext.request.contextPath}/report">TriptoLive</a> <a
					class="sidebar-brand brand-logo-mini"
					href="${pageContext.request.contextPath}/report"> <img
					src="${pageContext.request.contextPath}/resources/assets/images/logo-mini.svg"
					alt="logo" /></a>
				<!-- ---------------------------------------------------------------------------- -->
			</div>
			<!-- 슬라이드바 리스트 -->
			<ul class="nav">
				<li class="nav-item profile">
					<div class="profile-desc">
						<a
							href="<%=request.getContextPath()%>/profile?user_id=<%=session.getAttribute("SESS_ID")
                                %>">
							<!-- 프로필 링크 -->
							<div class="profile-pic">
								<div class="count-indicator">
									<img class="img-xs rounded-circle "
										src="${pageContext.request.contextPath}/resources/TripToLive/default/default.jpg" alt="">
									<span class="count bg-success"></span>
								</div>
								<div class="profile-name">
									<h5 class="mb-0 font-weight-normal">${sessionScope.SESS_NAME }</h5>
									<span>Admin</span>
								</div>
							</div>
						</a>
						<!-- 프로필 링크 끝 -->
						<a href="#" id="profile-dropdown" data-toggle="dropdown"><i
							class="mdi mdi-dots-vertical"></i></a>
						<div
							class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list"
							aria-labelledby="profile-dropdown">
							<a href="#" class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-dark rounded-circle">
										<i class="mdi mdi-settings text-primary"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<p class="preview-subject ellipsis mb-1 text-small">Account
										settings</p>
								</div>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-dark rounded-circle">
										<i class="mdi mdi-onepassword  text-info"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<p class="preview-subject ellipsis mb-1 text-small">Change
										Password</p>
								</div>
							</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item preview-item">
								<div class="preview-thumbnail">
									<div class="preview-icon bg-dark rounded-circle">
										<i class="mdi mdi-calendar-today text-success"></i>
									</div>
								</div>
								<div class="preview-item-content">
									<p class="preview-subject ellipsis mb-1 text-small">To-do
										list</p>
								</div>
							</a>
						</div>
					</div> <!-- 프로필 끝 -->
				</li>
				<!-- 신고 기록 -->
				<li class="nav-item menu-items"><a class="nav-link"
					href="<%=request.getContextPath()%>/report"> <span
						class="menu-icon"> <i class="mdi mdi-alert-outline"></i></span> <span
						class="menu-title">신고</span>
				</a></li>

				<!-- 명예의 전당 -->
				<li class="nav-item menu-items"><a class="nav-link"
					href="<%=request.getContextPath()%>/starBoard"> <span
						class="menu-icon"> <i class="mdi mdi-trophy-variant"></i></span> <span
						class="menu-title">명예의 전당</span>
				</a></li>
			</ul>
		</nav>
		<div class="container-fluid page-body-wrapper">
			<nav class="navbar p-0 fixed-top d-flex flex-row">
				<div
					class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
					<a class="navbar-brand brand-logo-mini"
						href="${pageContext.request.contextPath}/main"> <img
						src="${pageContext.request.contextPath}/resources/assets/images/logo-mini.svg"
						alt="logo" /></a>
				</div>
				<div
					class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
					<button class="navbar-toggler navbar-toggler align-self-center"
						type="button" data-toggle="minimize">
						<span class="mdi mdi-menu"></span>
					</button>
					<ul class="navbar-nav navbar-nav-right">
						<!-- 알림종 -->
						<li id="isalarm" class="nav-item dropdown border-left"><a
							class="nav-link count-indicator dropdown-toggle"
							id="notificationDropdown" href="#" data-toggle="dropdown"
							onclick="ajaxCall()"> <i class="mdi mdi-bell"></i> <span
								class="count bg-danger"></span>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
								aria-labelledby="notificationDropdown" id="alarm">
								<h6 class="p-3 mb-0">Notifications</h6>
								<div class="dropdown-divider"></div>
							</div></li>
						<li class="nav-item dropdown"><a class="nav-link"
							id="profileDropdown" href="#" data-toggle="dropdown">
								<div class="navbar-profile">
									<img class="img-xs rounded-circle"
										src="${pageContext.request.contextPath}/resources/TripToLive/default/default.jpg" alt="">
									<p class="mb-0 d-none d-sm-block navbar-profile-name">${sessionScope.SESS_NAME }</p>
									<i class="mdi mdi-menu-down d-none d-sm-block"></i>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
								aria-labelledby="profileDropdown">
								<h6 class="p-3 mb-0">Profile</h6>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-dark rounded-circle">
											<i class="mdi mdi-settings text-success"></i>
										</div>
									</div>
									<div class="preview-item-content">
										<p class="preview-subject mb-1">Settings</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<!-- 로그아웃 링크 연결해야함@@@@@@@@@@@ -->
								<a href="${pageContext.request.contextPath}/logout"
									class="dropdown-item preview-item">
									<div class="preview-thumbnail">
										<div class="preview-icon bg-dark rounded-circle">
											<i class="mdi mdi-logout text-danger"></i>
										</div>
									</div>
									<div class="preview-item-content">
										<p class="preview-subject mb-1">로그아웃</p>
									</div>
								</a>
								<div class="dropdown-divider"></div>
								<p class="p-3 mb-0 text-center">Advanced settings</p>
							</div></li>
					</ul>
					<button
						class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
						type="button" data-toggle="offcanvas">
						<span class="mdi mdi-format-line-spacing"></span>
					</button>
				</div>
			</nav>
			<!-- 화면 위 네비바 끝 -->
			<div class="main-panel">
				<!-- 컨텐츠 간격 컨테이너 -->
				<div class="content-wrapper">
					<!-- 실제 컨텐츠 박스 -->
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h3 class="card-title">신고 내역</h3>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th>글번호</th>
													<th>제목</th>
													<th>아이디</th>
													<th>신고사유</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="ReportVO" items="${requestScope.reportList}">
													<tr>
														<td>${ReportVO.report_no}</td>
														<td><a href="${pageContext.request.contextPath}/travBoard/travBoard-detail?b_no=${ReportVO.b_no}">
																${ReportVO.title}</a></td>
														<td>${ReportVO.reported_id}</td>
														<td>${ReportVO.report_comment}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- 테이블 끝 -->
					</div>
					<!-- 컨텐츠 박스 끝 -->
				</div>
				<!-- 컨텐츠 컨테이너 끝-->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted d-block text-center text-sm-left d-sm-inline-block">3조
							프로젝트</span>
						<!-- <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin templates</a> from Bootstrapdash.com</span> -->
					</div>
				</footer>
			</div>
			<!-- 메인 패널 끝 -->
		</div>
	</div>
</body>

</html>
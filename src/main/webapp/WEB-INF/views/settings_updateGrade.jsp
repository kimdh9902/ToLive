<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>환경설정 - 공개범위 변경</title>

<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>

<!-- plugins:css -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/assets/css/style.css">

<!-- End layout styles -->
<link rel="shortcut icon"
	href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png" />
<!-- plugins:js -->
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/chart.js/Chart.min.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/js/off-canvas.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/js/hoverable-collapse.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/js/misc.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/js/settings.js"></script>
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/js/dashboard.js"></script>
<!-- End custom js for this page -->
<script
	src="${ pageContext.servletContext.contextPath }/resources/js/setting.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>

<script>
	window.onload = function() {
		init(
				"${pageContext.request.servletContext.contextPath }",
				"${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}",
				"${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}");
	}
</script>
<style type="text/css">
.profile-content {
	border: 5px solid #212634;
	color: rgb(255, 255, 255);
	background-color: #282c37;
	/* height: 480px; */
}

.image {
	display: flex;	
}

.contents {
	margin-left: 40px;
}

.contents2 {
	display: flex;
	margin-top: 30px;
}

.contents2 :not(:nth-child(1), span){
	margin-left: 100px;
}

</style>
<style>
.custom-btn {
	display: inline-block;
	padding: 6px 12px;
	background-color: #5cb85c;
	border: 1px solid #4cae4c;
	border-radius: 5px;
	color: white;
	font-weight: bold;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="container-scroller" id="container-scroller">
		<div class="container-fluid page-body-wrapper"
			id="container-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper">
						<div class="row">
						<div class="col-md-12" style="height: 1200px;">
							<div class="card">
								<div class="card-body" style="overflow: hidden;">
									<div class="image">
										<img src="${pageContext.request.contextPath}/resources/TripToLive/default/default.jpg"
										alt="no">
										<div class="contents">
											<div class="contents2">
												<p style="padding-right: 100px">
													이름:${UsersVO.name}</p>
												<p>
													ID:${UsersVO.id}</p>
											</div>
											<div class="contents2">
												
											</div>
											<div id="inform" class="contents2" style="margin-top: 40px;">
												 <p>권한 레벨: ${UsersVO.grade_level}</p><br>
												 <p>공개 범위: ${GradeVO.authority}</p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body" style="min-height: 500px;">
									<form action="${pageContext.request.contextPath}/settings/settings-changeGrade" method="post">
									<fieldset>
									<legend>공개범위 변경</legend>
									<input type="checkbox" id="일반비공개" name="grade_level" value="1">
									<label for="일반비공개">일반비공개</label>
									<br>
									<input type="checkbox" id="일반친구공개" name="grade_level" value="2">
									<label for="일반친구공개">일반친구공개</label>
									<br>
									<input type="checkbox" id="일반공개" name="grade_level" value="3">
									<label for="일반공개">일반공개</label>
									<br>
									<input type="checkbox" id="셀럽비공개" name="grade_level" value="4">
									<label for="셀럽비공개">셀럽비공개</label>
									<br>
									<input type="checkbox" id="셀럽친구공개" name="grade_level" value="5">
									<label for="셀럽친구공개">셀럽친구공개</label>
									<br>
									<input type="checkbox" id="셀럽공개" name="grade_level" value="6">
									<label for="셀럽공개">셀럽공개</label>
									</fieldset>

									<div class="col p-3">
										<button id="sub" type="submit" class="custom-btn">선택완료</button>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</div>
								</form>									
								</div>
							</div>
						</div>
					</div>
				</div>
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted d-block text-center text-sm-left d-sm-inline-block">
							3조 프로젝트 </span>
					</div>
				</footer>
			</div>
		</div>
	</div>
</body>

</html>
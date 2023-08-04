<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>여행 후기글 목록</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<!-- plugins:css -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
	<!-- End plugin css for this page -->
	<!-- inject:css -->
	<!-- endinject -->
	<!-- Layout styles -->
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/css/style.css">
	
	<!-- End layout styles -->
	<link rel="shortcut icon" href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png" />
	<!-- plugins:js -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/chart.js/Chart.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/off-canvas.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/hoverable-collapse.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/misc.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/settings.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page -->
	<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/dashboard.js"></script>
	<script src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>
	<!-- End custom js for this page -->
	<script>
	window.onload = function(){
		init("${pageContext.request.servletContext.contextPath }", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}", "${_csrf.headerName}", "${_csrf.token}");
		displayNotice('${noticeVO.notice_contents}');
	}
	
	function goWrite() {
		location.href = "${pageContext.servletContext.contextPath}/travBoard/travBoard-write";
	
	}
	</script>

</head>
<body>
	<div class="container-scroller" id="container-scroller">
		<div class="container-fluid page-body-wrapper" id="container-body-wrapper">
			<div class="main-panel">
			  <!-- 공지 -->
			  <div id="noticeContainer"></div>
				<!-- 컨텐츠 간격 컨테이너 -->
				<div class="content-wrapper">
					<!-- 실제 컨텐츠 박스 -->
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h3 class="card-title">여행 후기글</h3>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th>글 번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
													<th>조회수</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="travBoardList"
													items="${requestScope.travBoardList}">
													<tr>
														<td>${travBoardList.b_no}</td>
														<td><a href="${pageContext.request.contextPath}/travBoard/travBoard-detail2?b_no=${travBoardList.b_no}">
																${travBoardList.title}</a></td>
														<td>${travBoardList.user_id}</td>
														<td>${travBoardList.reg_date}</td>
														<td>${travBoardList.views}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<!--글 쓰기 버튼-->
								<div style="text-align: right;" class="card-footer">
									<button class="btn btn-outline-primary"
										style="width: 90px; height: 26px; margin-top: 10px;"
										type="button" onclick="goWrite();">글 쓰기</button>
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
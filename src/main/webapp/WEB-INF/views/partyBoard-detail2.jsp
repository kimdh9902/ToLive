<%@page import="com.spring.domain.PartyBoardVO" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<!DOCTYPE html>
			<html lang="ko">

			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
				<title>파티 모집 게시판 상세 글 페이지</title>
				<script src="https://code.jquery.com/jquery-3.7.0.js"
					integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
				<script>
					function goUpdate() {
						var b_no = "<%=request.getParameter("b_no")%>";
						location.href = "${pageContext.servletContext.contextPath}/partyBoard/partyBoard-update?b_no=" + b_no;
					}

					function goDelete() {
						var b_no = "<%=request.getParameter("b_no")%>";
						location.href = "${pageContext.servletContext.contextPath}/partyBoard/partyBoard-delete?b_no=" + b_no;
					}

					function goReport() {
						var b_no = "<%=request.getParameter("b_no")%>";
						location.href = "${pageContext.servletContext.contextPath}/partyBoard/partyBoard-report?b_no=" + b_no;
					}
				</script>
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
				<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/off-canvas.js"></script>
				<script
					src="${ pageContext.servletContext.contextPath }/resources/assets/js/hoverable-collapse.js"></script>
				<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/misc.js"></script>
				<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/settings.js"></script>
				<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/todolist.js"></script>
				<!-- endinject -->
				<!-- Custom js for this page -->
				<script src="${ pageContext.servletContext.contextPath }/resources/assets/js/dashboard.js"></script>
				<!-- End custom js for this page -->
				<script src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>
				<script>
					window.onload = function () {
						init("${ pageContext.servletContext.contextPath}", "${sessionScope.SESS_ID}", "${sessionScope.SESS_NAME}");
					}

				</script>

			</head>

			<body>
				<div class="container-scroller" id="container-scroller">
					<div class="container-fluid page-body-wrapper" id="container-body-wrapper">
						<div class="main-panel">
							<!-- 컨텐츠 간격 컨테이너 -->
							<div class="content-wrapper">
								<!-- 실제 컨텐츠 박스 -->
								<div class="row">
									<div class="col-12 grid-margin">
										<div class="card">											

										</div>
									</div>
								</div>
								<!-- 컨텐츠 박스 끝 -->
							</div>
							<!-- 컨텐츠 컨테이너 끝-->
							<footer class="footer">
								<div class="d-sm-flex justify-content-center justify-content-sm-between">
									<span class="text-muted d-block text-center text-sm-left d-sm-inline-block">3조
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
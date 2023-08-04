<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>
		<head>
			<meta charset="UTF-8">
			<title>신고 페이지</title>

			<script src="https://code.jquery.com/jquery-3.7.0.js">
				/* integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
				crossorigin="anonymous" */
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
			<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/assets/css/style.css">

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
					init("${ pageContext.servletContext.contextPath}",
						"${sessionScope.SESS_ID}", "${sessionScope.SESS_NAME}");
				}

				function submitForm() {
					document.getElementById("myForm").submit();
				}
			</script>
			<style>
				.box-container {
					display: flex;
					justify-content: center;
					align-items: center;
					border: 2px solid white;
					margin-bottom: 20px;
				}

				.box {
					flex: 1;
					border-right: 2px solid white;
					height: 100%;
					padding: 20px;
				}

				.box:last-child {
					border-right: none;
				}
			</style>
		</head>


		<body>
			<div class="container-scroller" id="container-scroller">
				<div class="container-fluid page-body-wrapper" id="container-body-wrapper">
					<div class="main-panel">
						<div class="content-wrapper">
							<div class="row">
								<div class="col-12 grid-margin">
									<div class="card">
										<div class="card-body">
											<div class="container">
												<h2 class="text-center mb-4">여행 후기글 신고 페이지</h2>
												<!-- report page contents -->
												<div class="container" style="border: 10px double white; padding: 30px">
													  <!-- form start -->
													  <form id="myForm" action="${pageContext.request.contextPath}/travBoard/report-processing" method="post">
														<div class="box-container">
															<div class="box">
																<h3 class="text-center mb-4">게시글</h3>
																<div class="mb-3">
																	<label for="b_no" class="form-label">게시글 번호</label>
																	<input type="text" class="form-control" id="b_no" name="b_no" value="${travBoard.b_no}" readonly>
																</div>
																<div class="mb-3">
																	<label for="title" class="form-label">제목</label>
																	<input type="text" class="form-control" id="title" name="title" value="${travBoard.title}" readonly>
																</div>															
															</div>
															<div class="box">
																<h3 class="text-center mb-4">신고 사유</h3>
																<div class="form-group">
																	<label for="report_num">신고 사유를 알려주세요</label>
																	<select class="form-control" name="report_num" form="myForm">
																		<option value="1">부적절한 내용</option>
																		<option value="2">욕설</option>
																		<option value="3">혐오 발언</option>
																		<option value="4">개인정보 노출</option>
																		<option value="5">폭력성 또는 위험해보임</option>
																	</select>
																</div>
																<!-- <div class="mb-3 mt-3">
																	<label for="details" class="form-label">신고 상세 내용</label>
																	<textarea class="form-control" id="details" name="details" rows="5" required></textarea>																	
																</div> -->
																<div class="text-center mt-4">
																	<button type="submit" class="btn btn-primary" onclick="submitForm();">신고 제출</button>
																	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
																</div>
															</div>	
														</div>
														<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
													  </form>
													  <!-- form end -->									 
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</body>

		</html>
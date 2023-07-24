<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script
	src="${ pageContext.servletContext.contextPath }/resources/assets/js/dashboard.js"></script>
<!-- End custom js for this page -->
<script
	src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>
<script>
	window.onload = function() {
		init("${ pageContext.servletContext.contextPath}",
				"${sessionScope.SESS_ID}", "${sessionScope.SESS_NAME}");
	}
</script>

</head>

<body>
	<div class="container-scroller" id="container-scroller">
		<div class="container-fluid page-body-wrapper"
			id="container-body-wrapper">
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<div class="container">
										<h2 style="text-align: center; margin-bottom: 30px;">파티 모집 게시판 신고 페이지</h2>
										<div class="container" style="border: 10px double white; padding: 30px">
										<!-- form start -->
										<form
											action="${pageContext.request.contextPath}/travBoard/report-processing" method="post">
											<fieldset>
												<legend>게시글</legend>

												<div class="container" style="margin-right: 30px;">
													<label for="b_no">글 번호</label> 
													<input type="text" name="b_no" value="${travBoard.b_no}" readonly>
												</div>

												<div style="margin-bottom: 30px; margin-top: 10px;">
													<label for="title">제목</label> 
													<input type="text" name="title" value="${travBoard.title}" readonly>
												</div>
											</fieldset>

											<fieldset>
												<legend>신고사유</legend>

												<div class="container" style="margin-right: 30px;">
													<table>
														<tr>
															<th colspan="2">
															<label for="report_comments">[신고 사유를 알려주세요]</label></th>
														</tr>

														<tr>
															<td>
															<input type="radio" name="report_num" value="1"> 부적절한 내용<br> 
															<input type="radio" name="report_num" value="2"> 욕설<br> 
															<input type="radio" name="report_num" value="3"> 혐오 발언<br> 
															<input type="radio" name="report_num" value="4"> 개인적인 정보 노출<br> 
															<input type="radio" name="report_num" value="5"> 폭력성 또는 위험해보임<br></td>
														</tr>
													</table>
												</div>
											</fieldset>

											<div class="row">
												<div class="col p-3">
													<a href="${pageContext.request.contextPath}/menu/travBoard">
														<button id="back" type="button" class="get col p-3 btn btn-primary">돌아가기</button>
													</a>
												</div>
												
												<div class="col p-3">
												<button id="sub" type="submit" class="btn btn-warning">신고 보내기</button>
												</div>
											</div>
										</form>
										</div>
									</div>
									<!-- card-body end -->
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
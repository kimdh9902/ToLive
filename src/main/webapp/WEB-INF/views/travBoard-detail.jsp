<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>여행 후기글 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script>
	
	function goUpdate() {
	var b_no = "<%=request.getParameter("b_no")%>";
	location.href = "${pageContext.servletContext.contextPath}/travBoard/travBoard-update?b_no=" + b_no;
	}
	
	function goDelete() {
		var b_no = "<%=request.getParameter("b_no")%>";
		location.href = "${pageContext.servletContext.contextPath}/travBoard/travBoard-delete?b_no="+ b_no;
	}
	
	function goReport() {
		var b_no = "<%=request.getParameter("b_no")%>";
		location.href = "${pageContext.servletContext.contextPath}/travBoard/travBoard-report?b_no="+ b_no;
	}

	function addContents() {
		InsertContentAjax();
		SelectContentsAjax();
	}

	function InsertContentAjax() {
		let contents = document.getElementById("contents");
		let data = {
			contents : contents.value,
			b_no : '${param.b_no}',
			user_id : '${sessionScope.SESS_ID}'
		};
		$
				.ajax({//json
					url : "${pageContext.servletContext.contextPath}/user/insertComment",
					async : true,
					contentType : "application/json;charset=UTF-8",
					data : data,
					method : "GET",
					success : function(data, textStatus, jqXHR) {
						console.log("hi");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR);
						console.log(textStatus);
						console.log(errorThrown);
					}
				})
	}
	function refreshContents() {

	}

	function SelectContentsAjax() {
		let data = {
			b_no : '${param.b_no}'
		};
		$
				.ajax({//json
					url : "${pageContext.servletContext.contextPath}/user/selectComments",
					async : true,
					contentType : "application/json;charset=UTF-8",
					data : data,
					method : "GET",
					success : function(data, textStatus, jqXHR) {
						console.log("sel");
						refreshContents();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR);
						console.log(textStatus);
						console.log(errorThrown);
					}
				})
	}

	function valueCheck() {
		let contents = document.getElementById("contents");
		let string = "" + contents.value;
		let ment = string.split("@");

		console.log(ment);
		console.log("@[0]" + ment[0]);
		if (ment[1] != undefined) {
			console.log("@[1]" + ment[1]);
		}
		if (ment[1] != undefined) {
			console.log("@[1] split[0]" + ment[1].split(" ")[0]);
			// console.log("@[1] split[1]"+ment[1].split(" ")[1]);
		}
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
				<!-- 컨텐츠 간격 컨테이너 -->
				<div class="content-wrapper">
					<!-- 실제 컨텐츠 박스 -->
					<div class="row">
						<div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h3 class="card-title">
										<%=request.getParameter("b_no")%>
									</h3>
									<div class="table-responsive">
										<table class="board_view">

											<colgroup>
												<col width="20%">
												<col width="40%">
												<col width="15%">
												<col width="*">

											</colgroup>

											<tbody>
												<tr>
													<th>
														<div style="margin: auto; padding: 10px;">제목</div>
													</th>

													<td>
														<div style="margin-top: auto; padding: 10px;">
															${TravBoardVO.title}</div>
													</td>
													<th>
														<div style="margin-top: auto; padding: 10px;">조회수</div>
													</th>
													<td>
														<div
															style="margin: auto; text-align: left; padding: 10px;">
															${TravBoardVO.views}</div>
													</td>
												</tr>
												<tr>
													<th>
														<div style="margin-top: auto; padding: 10px;">작성자</div>
													</th>
													<td>
														<div style="margin: auto; padding: 10px;">
															${TravBoardVO.user_id}</div>
													</td>
													<th>
														<div style="margin: auto; padding: 10px;">작성일</div>
													</th>
													<td>
														<div style="margin: auto; padding: 10px;">
															${TravBoardVO.reg_date}</div>
													</td>
												</tr>
												<tr>
													<th>
														<div style="margin: auto; = padding: 10px;">공감 수</div>
													</th>

													<td colspan="3">
														<div style="margin: auto; = padding: 10px;">
															${TravBoardVO.total_emoji}</div>
													</td>
												</tr>

												<tr style="height: 40%;">
													<th style="text-align: center; margin: auto;">내용</th>

													<td colspan="4">
														<div
															style="border: 2px solid white; padding: 10px; width: 800px; height: 300px;">
															${TravBoardVO.contents}</div>
													</td>

												</tr>

											</tbody>
										</table>
									</div>

									<!-- 댓글 입력창 -->
									<div class="card-body">
										<textarea class="form-control" id="contents" rows="4"
											cols="80" onkeyup="valueCheck()"></textarea>
										<button type="submit" class="btn btn-primary me-2"
											onclick="addContents()">등록</button>
										<!-- 댓글 입력창 끝 -->


										<!--댓글-->
										<h3 class="card-title"></h3>
										<div>
											<c:forEach var="boardComment"
												items="${requestScope.boardCommentList}">
												<div style="display: flex;">
													<a
														href="${pageContext.request.servletContext.contextPath}/menu/profile?user_id=${boardComment.user_id}">
														<span> <img
															src="${pageContext.request.contextPath}/resources/TripToLive/default/default.jpg"
															style="margin-right: 20px; width: 47px; height: 47px;">
													</span>
													</a> <span>${boardComment.user_id}<br>${boardComment.contents}</span>
													<br>
												</div>
												<div class="dropdown-divider"></div>
											</c:forEach>
										</div>
									</div>
									<div class="card">
										<div class="card-body">
											<div style="text-align: center;" class="card-footer">
												<!--글 수정 버튼-->
												<!-- 로그인한 사용자와 작성자가 같을 경우 글 수정/글 삭제 버튼 출력	 -->
												<c:if test="${sessionScope.SESS_ID == TravBoardVO.user_id}">

													<button class="btn btn-outline-primary"
														style="width: 90px; height: 26px; margin-top: 10px;"
														type="button" onclick="goUpdate();">글 수정</button>

													<!--글 삭제 버튼-->
													<button class="btn btn-outline-primary"
														style="width: 90px; height: 26px; margin-top: 10px;"
														type="button" onclick="goDelete();">글 삭제</button>
												</c:if>
												<c:if test="${sessionScope.SESS_ID ne TravBoardVO.user_id}">
													<!--글 신고 버튼-->
													<!-- 로그인한 사용자와 작성자가 다를 경우 신고 버튼만 출력 -->
													<button class="btn btn-outline-primary"
														style="width: 90px; height: 26px; margin-top: 10px;"
														type="button" onclick="goReport()">글 신고</button>
												</c:if>

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
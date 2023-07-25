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
		console.log("getValue : " + getValue());
		let content = getValue();
		if(content != null){
			sendAlarmAjax(content);
		}
		SelectContentsAjax();
	}

	function InsertContentAjax() {
		let contents = document.getElementById("contents");
		let data = {
			contents : contents.value,
			b_no : '${param.b_no}',
			user_id : '${sessionScope.SESS_ID}'
		};
		$.ajax({//json
			url : "${pageContext.servletContext.contextPath}/user/insertComment",
			async : true,
			contentType : "application/json;charset=UTF-8",
			data : data,
			method : "GET",
			success : function(data, textStatus, jqXHR) {
				console.log("insert완");
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR);
				console.log(textStatus);
				console.log(errorThrown);
			}
		})
	}
	
	function input(user_id, contents) {
		let comments_box = document.getElementById("comments-box");

		var new_comments = document.createElement("div");
		new_comments.id = "new-comments";

		var comments = document.createElement("div");
		comments.id = "comments";
		comments.style.display = "flex";

		var user_link = document.createElement("a");
		user_link.href = "${pageContext.request.servletContext.contextPath}/menu/profile?user_id=" + user_id;
		comments.appendChild(user_link);

		var user_img = document.createElement("span");
		user_link.appendChild(user_img);

		var img_default = document.createElement("img");
		img_default.src = "${pageContext.request.contextPath}/resources/TripToLive/default/default.jpg";
		img_default.style.marginRight = "20px";
		img_default.style.width = "47px";
		img_default.style.height = "47px";
		user_img.appendChild(img_default);

		var userInfoContent = document.createElement("span");
		userInfoContent.innerHTML = user_id + "<br>" + contents;
		comments.appendChild(userInfoContent);

		var div_divider = document.createElement("div");
		div_divider.className = "dropdown-divider";
		comments_box.appendChild(div_divider);

		comments_box.appendChild(new_comments);
		comments_box.appendChild(comments);
	}

	function refreshContents(boardCommentList) {
		const comments_box = document.getElementById("comments-box");
        comments_box.innerHTML = "";
		console.log(typeof(boardCommentList));
		for(var i=0; i<boardCommentList.length; i++){
			input(boardCommentList[i].user_id, boardCommentList[i].contents);
		}
	}

	function sendAlarmAjax(value) {
		let data = {
			user_id : value,
			b_no : '${param.b_no}',
			msg : "${sessionScope.SESS_NAME}"+"가 당신을 멘션"
		};
		$.ajax(
			{
				url : "${pageContext.servletContext.contextPath}/user/send-alarm",
				async : true,
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(data),
				method : "POST",
				success : function(data, textStatus, jqXHR) {
					console.log("알람 : " + data);
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR);
					console.log(textStatus);
					console.log(errorThrown);
				}
			}
		);
	}

	function SelectContentsAjax() {
		let data = {
			b_no : '${param.b_no}'
		};
		$.ajax({//json
			url : "${pageContext.servletContext.contextPath}/user/selectComments",
			async : true,
			contentType : "application/json;charset=UTF-8",
			data : data,
			method : "GET",
			success : function(data, textStatus, jqXHR) {
				console.log("select완");
				refreshContents(data);
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
		

		if(string[string.search("@")-1] != null && string[string.search("@")-1] == " "){
			let ment = string.split("@");
			console.log(ment);
			console.log("@[0]" + ment[0]);

			if (ment[1] != undefined) {
				console.log("@[1]" + ment[1]);
			}
			if (ment[1] != undefined) {
				console.log("name 추출 : " + ment[1].split(" ")[0]);
			}
		}
		
		
	}

	function getValue(){
		let contents = document.getElementById("contents");
		let string = "" + contents.value;
		console.log("getValue if 1 >>");
		if(string[string.search("@")-1] != null  && string[string.search("@")-1] == " "){
			console.log("getValue if 2 != null");
			let ment = string.split("@");
			if (ment[1] != undefined) {
				console.log("value 추출 : " + ment[1].split(" ")[0]);
				return ment[1].split(" ")[0];
			}
		}
		return null;
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
										<div id="comments-box">
											<c:forEach var="boardComment" items="${requestScope.boardCommentList}">
												<script type="text/javascript">
													input('<c:out value="${boardComment.user_id}" />',
														'<c:out value="${boardComment.contents}" />');
    											</script>
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
		</div>
	</div>
</body>
</html>
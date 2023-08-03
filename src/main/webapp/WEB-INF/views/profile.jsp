<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Profile Page</title>
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

.follow{
	background-color: aqua
	
}

.unfollow{
	background-color: red
}
</style>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
<script>
	
	window.onload = function(){
		buttonToggle(${not isFollow});
		let inform_box = document.getElementById("inform");
		init("${pageContext.request.servletContext.contextPath }", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}", "${_csrf.headerName}", "${_csrf.token}");
		console.log(inform_box.children[0].children[2].innerHTML);
	}
	
	function followToggle() {
		console.log("${profileVO.user_id}");
		let data = {user_id : "${profileVO.user_id}"};
		console.log(data);
		console.log(JSON.stringify(data));
		$.ajax(
			{//json
                url: "${pageContext.request.contextPath}"+"/user/onFollow",
                async:true,
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify(data), // data
                method:"POST", // GET
                dataType:"JSON",
                beforeSend:function(xhr){
                	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                },
                success:function(data, textStatus, jqXHR)
                {
                	console.log(data);
                	followUpAndDown(data);
                },
                error:function(jqXHR, textStatus, errorThrown ){
                    console.log(jqXHR);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            }
		)
	}
	
	function followUpAndDown(data) {
		let inform_box = document.getElementById("inform");
		let span = inform_box.children[0].children[2];

		if(data){
			span.innerHTML = (Number.parseInt(span.innerHTML)-1);
		}else{
			span.innerHTML = (Number.parseInt(span.innerHTML)+1);
		}

		buttonToggle(data);
	}
	
	function buttonToggle(data){
		let follow_btn = document.getElementById("follow-btn");
		if(follow_btn != null || follow_btn != undefined){
			console.log(data);
			if(data){
				follow_btn.innerText = "Follow";
				follow_btn.className = "follow";
			}else{
				follow_btn.innerText = "unFollow";
				follow_btn.className = "unfollow";
			}
		}	
	}
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
        <script src="${ pageContext.servletContext.contextPath }/resources/assets/js/dashboard.js"></script>
        <!-- End custom js for this page -->
        <script src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>
</head>

<body>
	<div class="container-scroller" style="overflow: hidden;" id="container-scroller">
		<div class="container-fluid page-body-wrapper" id="container-body-wrapper">
			<div class="main-panel" style="overflow: hidden; height: 1200px">
				<!-- 컨텐츠 간격 컨테이너 -->
				<div class="content-wrapper">
					<!-- 컨텐츠 박스 -->
					<div class="row">
						<div class="col-md-12" style="height: 1200px;">
							<div class="card">
								<div class="card-body" style="overflow: hidden;">
									<div class="image">
										<img src="${pageContext.request.servletContext.contextPath }${path}" alt="error">
										<div class="contents">
											<div class="contents2">
												<p style="padding-right: 100px">
													이름:${profileVO.user_name}</p>
												<p>
													ID:${profileVO.user_id}</p>
											</div>
											<div class="contents2">
												<c:if test="${not isSame}" >
													<button id="follow-btn" onclick="followToggle()" style="width: 200px">팔로우</button>
												</c:if>
											</div>
											<div id="inform" class="contents2" style="margin-top: 40px;">
												<p>
													팔로워<br> <br><span>${profileVO.follower }</span></p>
												<p>
													팔로잉<br> <br><span>${profileVO.following }</span></p>
												<p>
													게시글 수<br> <br><span>${profileVO.board_count}</span></p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body" style="min-height: 500px;">
									<p class="profile-content">테스트 글1</p>
									<p class="profile-content">테스트 글2</p>
									<p class="profile-content">테스트 글3</p>
									<p class="profile-content">테스트 글1</p>
									<p class="profile-content">테스트 글2</p>
									<p class="profile-content">테스트 글3</p>
									<p class="profile-content">테스트 글4</p>
								</div>
							</div>
						</div>
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
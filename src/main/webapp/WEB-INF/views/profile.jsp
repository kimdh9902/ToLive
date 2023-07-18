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
		console.log(inform_box.children[0].children[2].innerHTML);
	}
	function ajaxCall(){ 
		let data = { id: '${sessionScope.SESS_ID }'};
		$.ajax(
			{//json
			url: "${pageContext.request.contextPath}"+"/alarm",
			async:true,
			headers:{"content-type":"application/json"},
			contentType:"application/json;charset=UTF-8",
			data: data,
			method:"GET",
			dataType:"JSON",
			success:function(data, textStatus, jqXHR)
			{
				console.log(data);
				printAlarm(data);
				/* console.log("data:" + data.jsonList); */
				/* var userList = JSON.parse(data); */
				/* console.log("uL"+userList); */
				
			},
			error:function(jqXHR, textStatus, errorThrown ){
				console.log(jqXHR);
				console.log(textStatus);
				console.log(errorThrown);
			}
			}
		)
	}
	
    function make(msg){
        let alarm = document.getElementById("alarm");
              
        var div_divider = document.createElement("div"); div_divider.className = "dropdown-divider";
        alarm.appendChild(div_divider);
        // --------------------------------------------------------------
        var a_drop = document.createElement("a"); a_drop.className = "dropdown-item preview-item";
        var div_thumb = document.createElement("div"); div_thumb.className = "preview-thumbnail";
        var prf_img = document.createElement("img");
        prf_img.className = "rounded-circle profile-pic"; prf_img.src = "${pageContext.request.contextPath}/img/images.jpg";
        div_thumb.appendChild(prf_img);
        a_drop.appendChild(div_thumb);
        //----------------------------------------------------
        var div_content = document.createElement("div"); div_content.className = "preview-item-content";
        var p_text = document.createElement("p"); p_text.innerText = msg //메세지 입력!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        div_content.appendChild(p_text);
        a_drop.appendChild(div_content);
        alarm.appendChild(a_drop);
        console.log(alarm);
    }
        
	function printAlarm(userList){
        let alarm = document.getElementById("alarm");
		let isOpne = document.getElementById("isalarm");

        if(isOpne.className == "nav-item dropdown border-left show"){
			console.log("true");
			for(var i = 0; i < userList.length; i++){
            	make(userList[i].msg);
        	}
		}else{
			console.log("false");
			for(var i = alarm.childElementCount-1; i > 1; i--){
				alarm.removeChild(alarm.children[i]);
        	}
		}
	}
	function followToggle() {
		let data = {user_id : "${profileVO.user_id}"};
		console.log(data);
		console.log(JSON.stringify(data)); // stringify 문자열로 바꿔줌
		$.ajax(
			{//json
                url: "${pageContext.request.contextPath}"+"/user/onFollow",
                async:true,
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify(data), // data
                method:"POST", // GET
                dataType:"JSON",
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
		// console.log(inform_box.children[0].children[0].innerHTML);
		// console.log(typeof inform_box.children[0].children[0].innerHTML);
		let span = inform_box.children[0].children[2];
		console.log(span.innerHTML);
		// console.log("-1 = "+Number.parseInt(num)-1);
		// console.log("+1 = "+(Number.parseInt(num)+1));
		// console.log(typeof Number.parseInt(num));
		if(data){
			span.innerHTML = (Number.parseInt(span.innerHTML)-1);
		}else{
			span.innerHTML = (Number.parseInt(span.innerHTML)+1);
		}
		console.log(span.innerHTML);
		buttonToggle(data);
	}
	
	function buttonToggle(data){
		let follow_btn = document.getElementById("follow-btn");
		console.log(data);
		if(data){
			follow_btn.innerText = "Follow";
			follow_btn.className = "follow";
		}else{
			follow_btn.innerText = "unFollow";
			follow_btn.className = "unfollow";
		}
			
	}
    document.querySelector("#no")
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
</head>

<body>
	<div class="container-scroller" style="overflow: hidden;">
		<!-- 왼쪽 슬라이드 바 -->
		<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<div
				class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
				<!-- 이미지를 링크화 한것 -->
				<a class="sidebar-brand brand-logo"
					href="${pageContext.request.contextPath}/main"> <img
					src="${pageContext.request.contextPath}/assets/images/logo.svg"
					alt="logo" /></a> <a class="sidebar-brand brand-logo-mini"
					href="${pageContext.request.contextPath}/main"> <img
					src="${pageContext.request.contextPath}/assets/images/logo-mini.svg"
					alt="logo" /></a>
				<!-- ---------------------------------------------------------------------------- -->
			</div>
			<!-- 슬라이드바 리스트 -->
			<ul class="nav">
				<li class="nav-item profile">
					<div class="profile-desc">
						<a
							href="<%=request.getContextPath()%>/profile?user_id=<%=session.getAttribute("SESS_ID")%>">
							<!-- 프로필 링크 -->
							<div class="profile-pic">
								<div class="count-indicator">
									<img class="img-xs rounded-circle " src="${pageContext.request.contextPath}/img/images.jpg"
										alt=""> <span class="count bg-success"></span>
								</div>
								<div class="profile-name">
									<h5 class="mb-0 font-weight-normal">${sessionScope.SESS_NAME}</h5>
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
				<li class="nav-item menu-items"><a class="nav-link"
					href="${pageContext.request.contextPath}/main"> <span
						class="menu-icon"> <i class="mdi mdi-speedometer"></i>
					</span> <span class="menu-title">여행 후기글</span>
				</a></li>

				<!-- 친구 검색 -->
				<li class="nav-item menu-items"><a class="nav-link"
					href="${pageContext.request.contextPath}/partyBoard"> <span
						class="menu-icon"> <i class="mdi mdi-account-search"></i></span> <span
						class="menu-title">파티 찾기</span>
				</a></li>

				<!-- 파티 찾기 -->
				<li class="nav-item menu-items"><a class="nav-link"
					href="${pageContext.request.contextPath}/findUser"> <span
						class="menu-icon"> <i class="mdi mdi-account-multiple-plus"></i></span>
						<span class="menu-title">유저 검색</span>
				</a></li>

				<!-- 명예의 전당 -->
				<li class="nav-item menu-items"><a class="nav-link"
					href="${pageContext.request.contextPath}/starBoard"> <span
						class="menu-icon"> <i class="mdi mdi-trophy-variant"></i></span> <span
						class="menu-title">명예의 전당</span>
				</a></li>
			</ul>
		</nav>
		<!-- 왼쪽 슬라이드 끝 -->
		<div class="container-fluid page-body-wrapper">
			<nav class="navbar p-0 fixed-top d-flex flex-row">
				<div
					class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
					<a class="navbar-brand brand-logo-mini"
						href="${pageContext.request.contextPath}/main"> <img
						src="../assets/images/logo-mini.svg" alt="logo" /></a>
				</div>
				<!-- 상단바 최상위 -->
				<div
					class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
					<button class="navbar-toggler navbar-toggler align-self-center"
						type="button" data-toggle="minimize">
						<span class="mdi mdi-menu"></span>
					</button>
					<!-- 상단바 박스들-->
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
										src="${pageContext.request.contextPath}/img/images.jpg" alt="">
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
				<!-- 상단바 최상위 끝 -->
			</nav>
			<!-- 화면 위 네비바 끝 -->
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
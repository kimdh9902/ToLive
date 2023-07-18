<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>명예의 전당</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
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
<script>
   class Table{
        tr
        tbody
        th
        td
        constructor(id){
            this.tbody = document.createElement("tbody");
            this.tbody.id = id == undefined ? "tbody": id;
        }
        getTr(){
            return this.tr;
        }
        openTr(){
            this.tr = document.createElement("tr");
        }
        closeTr(){
            this.tbody.appendChild(this.tr);
            this.tr = undefined;
        }
        insertTh(data){
            this.th = document.createElement("th");
            this.th.append(data);
            this.tr.append(this.th);
        }
        insertTd(data){
            this.td = document.createElement("td");
            this.td.append(data);
            this.tr.append(this.td);
        }
        insertTdLink(data){
              var a = document.createElement("a");
            a.href = "";
            this.td = document.createElement("td");
            this.td.append(data);
            a.appendChild(this.td);
            this.tr.append(a);
        }
        end(){
         var result_table = document.getElementById("starBoard");
           result_table.appendChild(this.tbody);
        }
    }

   class StarBoardVO{
      // int b_no;
      // String title;
      // String user_id;
      // int views;
      b_no;
      title;
      user_id;
      views;
      getB_no() {
      return this.b_no;
      }
      setB_no(b_no) {
         this.b_no = b_no;
      }
      getTitle() {
         return this.title;
      }
      setTitle(title) {
         this.title = title;
      }
      getUser_id() {
         return this.user_id;
      }
       setUser_id(user_id) {
         this.user_id = user_id;
      }
      getViews() {
         return this.views;
      }
      setViews(views) {
         this.views = views;
      }
   }
   window.onload = function(){
      const params = new URLSearchParams(window.location.search);
      const list = params.get("list");
      const parsedString = list.split(',').slice(1);
      
      parsedString[0] = parsedString[0].substr(1, parsedString[0].length);
      parsedString[parsedString.length -1] = parsedString[parsedString.length -1].substr(0, parsedString[parsedString.length -1].length-1);
      const sb_list = new Array();
      const table = new Table();
      
      for(var i = 0; i < (parsedString.length / 4); i++)
      {
         var indx = 4 * i;
         var vo = new StarBoardVO();
         vo.setB_no((parsedString[indx].split('='))[1]);
         vo.setTitle((parsedString[indx + 1].split('='))[1]);
         vo.setUser_id((parsedString[indx + 2].split('='))[1]);
         vo.setViews((parsedString[indx + 3].split('='))[1]);
         sb_list.push(vo);
      }
      console.log(sb_list[0]);
      console.log(sb_list[0].getB_no());
      console.log(sb_list[1]);
      for(var i = 0; i < sb_list.length; i++)
      {
         table.openTr();
         table.insertTd(sb_list[i].getB_no());
         table.insertTdLink(sb_list[i].getTitle());
         table.insertTd(sb_list[i].getUser_id());
         table.insertTd(sb_list[i].getViews());
         table.closeTr();
      }
      table.end();
   }

   /* const list = params.get("list");
   console.log(list); */
   
</script>
</head>
<body>
	<div class="container-scroller">
		<!-- 왼쪽 슬라이드 바 -->
		<nav class="sidebar sidebar-offcanvas" id="sidebar">
			<div
				class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
				<!-- 이미지를 링크화 한것 -->
				<a class="card-title text-primary" style="text-align: left;"
					href="${pageContext.request.contextPath}/main">TriptoLive</a> <a
					class="sidebar-brand brand-logo-mini"
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
									<img class="img-xs rounded-circle "
										src="${pageContext.request.contextPath}/img/images.jpg" alt="">
									<span class="count bg-success"></span>
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
				<!-- 메인 -->
				<li class="nav-item menu-items"><a class="nav-link"
					href="${pageContext.request.contextPath}/main"> <span
						class="menu-icon"> <i class="mdi mdi-airballoon"></i>
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
						<span class="menu-title">친구 검색</span>
				</a></li>

				<!-- 명예의 전당 -->
				<li class="nav-item menu-items"><a class="nav-link"
					href="${pageContext.request.contextPath}/starBoard"> <span
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
						src="${pageContext.request.contextPath}/assets/images/logo-mini.svg"
						alt="logo" /></a>
				</div>
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
			</nav>
			<!-- 화면 위 네비바 끝 -->
			<div class="main-panel" style="overflow: hidden; height: 1200px">
				<!-- 컨텐츠 간격 컨테이너 -->
				<div class="content-wrapper">
					<!-- 실제 컨텐츠 박스 -->
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<table id="starBoard" class="table" style="width: 100%;">
										<thead>
											<tr>
												<th>글 번호</th>
												<th>제목</th>
												<th>아이디</th>
												<th>조회수</th>
											</tr>
										</thead>

									</table>
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
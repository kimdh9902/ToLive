<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환경설정 - 인플루언서 신청</title>

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
<!-- End custom js for this page -->
<script src="${ pageContext.servletContext.contextPath }/resources/js/setting.js"></script>
<script>
	
	function sendRequest() {
	    $.ajax({
	        type: "GET",
	        url: "${pageContext.servletContext.contextPath}/settings/insertInfluencer",
	        success: function(response) {
	            alert("신청 완료!")
		    	document.getElementById("requestButton").disabled = true;
	            location.reload();
	        },
	        error: function(error) {
	            console.log("Error: ", error);
	            alert("이미 신청을 완료했거나 요청이 수락됐습니다.");
	            location.reload();
	        }
	    });
	}

	var howFoll = ${howFoll};
	var userGradeLevel = ${userGrade};
	
	
</script>
<script>
	window.onload = function(){
	    init("${pageContext.request.servletContext.contextPath }", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}");

	    
	    if (userGradeLevel >= 1 && userGradeLevel <= 3 && howFoll >= 50) {
	        requestButton.disabled = false;
	        requestButton.innerHTML = "신청";
	    } else {
	        requestButton.disabled = true;
	        requestButton.innerHTML = "신청불가";
	    }
	}
</script>
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
									<div class="card">
					                  <div class="card-body"> 
					                    <h5>현재 당신의 팔로워 </h5>
					                    <div class="row">
					                      <div class="col-8 col-sm-12 col-xl-8 my-auto">
					                        <div class="d-flex d-sm-block d-md-flex align-items-center">
					                          <h1 class="mb-0">${ howFoll } people following you.</h1>
					                        </div>
					                        <h6 class="text-muted font-weight-normal">What an achievement!</h6>
					                      </div>
					                      <div class="col-4 col-sm-12 col-xl-4 text-center text-xl-right">
					                        <i class="icon-lg mdi mdi-emoticon-cool text-success ml-auto"></i>
					                      </div>
					                    </div>
					                  </div>
					                  <div class="card-body"> 
						              	<button id="requestButton" class="btn btn-outline-primary"
        style="width: 90px; height: 26px; margin-top: 10px;"
        type="button" onclick="sendRequest()">신청</button>
					                  </div>
					                </div>
        						</div>
        					</div>
        				</div>
        			</div>
				</div>
        		<footer class="footer">
					<div class="d-sm-flex justify-content-center justify-content-sm-between">
						<span class="text-muted d-block text-center text-sm-left d-sm-inline-block">
							3조 프로젝트
						</span>
					</div>
				</footer>
			</div>
		</div>
	</div>
</body>
</html>
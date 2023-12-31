<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 페이지 - 인플루언서</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous">
</script>
<script>
	
	function acceptRequest(user_id) {
		let data = {
		    user_id: user_id
		};
		$.ajax({
	        url: "${pageContext.servletContext.contextPath}/admin/updateInfluencer",
	        async: true,
	        contentType: "application/json;charset=UTF-8",
	        data: data,
	        method: "GET",
	        success: function (data, textStatus, jqXHR) {
	        	alert(user_id+"의 요청 수락완료.");
	            console.log("Request Delete Successful");
	            rejectRequest(user_id);
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	        	alert("수락할 수 없습니다. 이미 influencer인지 확인하십시오.");
	            console.log(jqXHR);
	            console.log(textStatus);
	            console.log(errorThrown);
	        }
	    });
	}

	function rejectRequest(user_id) {
	    let data = {
	        user_id: user_id
	    };
	    $.ajax({
	        url: "${pageContext.servletContext.contextPath}/admin/deleteInfluencer",
	        async: true,
	        contentType: "application/json;charset=UTF-8",
	        data: data,
	        method: "GET",
	        success: function (data, textStatus, jqXHR) {
	            console.log("Request Delete Successful");
	            selectInfluencerAjax();
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            console.log(jqXHR);
	            console.log(textStatus);
	            console.log(errorThrown);
	        }
	    });
	}
	
	function selectInfluencerAjax(){
		let data ={
				
		}
		$.ajax({//json
			url : "${pageContext.servletContext.contextPath}/admin/select-Influencer",
			async : true,
			contentType : "application/json;charset=UTF-8",
			data : data,
			method : "GET",
			success : function(data, textStatus, jqXHR) {
	            location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR);
				console.log(textStatus);
				console.log(errorThrown);
			}
		})
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
<script src="${ pageContext.servletContext.contextPath }/resources/js/displayAdmin.js"></script>
<script>
window.onload = function(){
	init("${pageContext.request.servletContext.contextPath }", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}", "${_csrf.headerName}", "${_csrf.token}");
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
									<div id="comments-box">
										<h2 class="card-title">신청내역</h2>
										<div class="table-responsive">
											<table class="table">
												<thead>
													<tr>
														<th>신청번호</th>
														<th>신청자</th>
														<th>신청일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="influencerVO" items="${requestScope.influencerList}">
														<tr>
															<td>${ influencerVO.inf_no }</td>
															<td>${ influencerVO.user_id }</td>
															<td>${ influencerVO.req_date.substring(0, 10) }</td>
															<td> 
																<button class="btn btn-primary" onclick="acceptRequest('${influencerVO.user_id}')">수락</button>
																<button class="btn btn-danger" onclick="rejectRequest('${influencerVO.user_id}')">거절</button>
        													</td>
														</tr>
														</c:forEach>
													</tbody>
												</table>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 페이지 - 공지쓰기</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous">
</script>
<style>
	.form-group-inline {
  		display: inline-block;
  		vertical-align: top;
	}
</style>
<script>
	function checkInputs() {
		let noticeDate = document.getElementById('notice_date');
	    let endDate = document.getElementById('end_date');
	    let noticeContents = document.getElementById('contents');
	    let submitButton = document.getElementById('submitButton');
	    if (noticeDate.value.trim() !== "" && endDate.value.trim() !== "" && noticeContents.value.trim() !== "") {
	      submitButton.disabled = false;
	    } else {
	      submitButton.disabled = true;
	    }
	}
	
	function uploadNotice(){
	 	let noticeDate = document.getElementById("notice_date");
	    let endDate = document.getElementById("end_date");
	    let noticeContents = document.getElementById("contents");

	    let noticeDateStr = noticeDate.value.trim();
	    let endDateStr = endDate.value.trim();
	    let noticeContetnsStr = noticeContents.value.trim();

	    if (!isValidDate(noticeDateStr) || !isValidDate(endDateStr)) {
	        console.log("올바른 날짜 형식을 입력해주세요.");
	        return;
	    }

	    let data = {
	        notice_date: noticeDateStr,
	        end_date: endDateStr,
	        notice_contents: noticeContetnsStr
		};

	    $.ajax({
	        url: '${pageContext.servletContext.contextPath}/admin/notice-upload',
	        contentType: 'application/json;charset=UTF-8',
	        data: data,
	        method: 'GET',
	        success: function (data, textStatus, jqXHR) {
	            console.log('공지가 성공적으로 등록되었습니다.');
	            alert("등록 완료");
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            alert("등록에 실패하였습니다. 다시 확인해주세요.");
	            console.log(jqXHR);
	            console.log(textStatus);
	            console.log(errorThrown);
	        }
	    });
	}
	
	//날짜변환
	function formatDate(date) {
		const yyyy = date.getFullYear();
	    const mm = String(date.getMonth() + 1).padStart(2, "0");
	    const dd = String(date.getDate()).padStart(2, "0");

	    return `${yyyy}${mm}${dd}`;
	}
	//날짜검증
	function isValidDate(dateString) {
	    const regEx = /^\d{4}-\d{2}-\d{2}$/;
	    if (!dateString.match(regEx)) return false;  // Invalid format
	    const d = new Date(dateString);
	    const dNum = d.getTime();
	    if (!dNum && dNum !== 0) return false; // NaN value
	    return d.toISOString().slice(0, 10) === dateString;
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
	init("${pageContext.request.servletContext.contextPath }", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}");
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
									<div class="form-group form-group-inline">
										<br> 
										<label for="notice_date">공지 시작일 > </label> 
										<input type="text" style="width: 460px" class="form-control" id="notice_date" 
											placeholder="YYYY-MM-DD" name="notice_date" autocomplete="off" onchange="checkInputs()">
									</div>
									<div class="form-group form-group-inline">
										<br> 
										<label for="end_date">공지 종료일 > </label> 
										<input type="text" style="width: 460px" class="form-control" id="end_date"
											placeholder="YYYY-MM-DD" name="end_date" autocomplete="off" onchange="checkInputs()">
									</div>
									<br>
									<label for="notice_date">내용 > </label> 
									<textarea class="form-control" id="contents" rows="6"
										cols="60" onchange="checkInputs()"></textarea>
                                    <div class="card-body" style="display:flex">
                                        <button type="button" class="btn btn-primary me-2" id="submitButton"
                                        onclick="uploadNotice()" style="margin-left:auto;" disabled>공지 등록</button>
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
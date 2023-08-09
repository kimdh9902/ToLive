<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>여행 후기글 상세 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
		integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script>

var loggedInUser = "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}";
var travBoardUser = "${TravBoardVO.user_id}";

	function goWrite() {
	location.href = "${pageContext.servletContext.contextPath}/travBoard/travBoard-write";
	}
	
	function goUpdate() {
		var b_no = "<%=request.getParameter("b_no")%>";
		location.href = "${pageContext.servletContext.contextPath}/travBoard/travBoard-update?b_no=" + b_no;
	}

	function goDelete() {
		var b_no = "<%=request.getParameter("b_no")%>";
		location.href = "${pageContext.servletContext.contextPath}/travBoard/travBoard-delete?b_no=" + b_no;
	}

	function goReport() {
		var b_no = "<%=request.getParameter("b_no")%>";
		location.href = "${pageContext.servletContext.contextPath}/travBoard/travBoard-report?b_no=" + b_no;
	}

	 function goMain() {		
		location.href = "${pageContext.request.contextPath}/menu/travBoard?user_id="+loggedInUser;
	} 
	



	function addContents() {
		InsertContentAjax();
		let content = getValue();
		if(content != null){
			sendAlarmAjax(content);
		}
		SelectContentsAjax();
	}

	function InsertContentAjax() {
		let contents = document.getElementById("contents");
		console.log('${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}');
		let data = {
			contents : contents.value,
			b_no : '${param.b_no}',
			user_id : '${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}'
		};
		$.ajax({//json
			url : "${pageContext.servletContext.contextPath}/user/insertComment",
			async : false,//동기로 처리 <<이게 앞에 있으니까 무조건 절차순으로 실행
			contentType : "application/json;charset=UTF-8",
			data : data,
			method : "GET",
			success : function(data, textStatus, jqXHR) {
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR);
				console.log(textStatus);
				console.log(errorThrown);
			}
		})
	}
	
	function textToHtml(str) {
	    return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
	}
	
	function input(user_id, contents, c_no) {
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
		userInfoContent.innerHTML = textToHtml(user_id) + "<br>" + textToHtml(contents);
		comments.appendChild(userInfoContent);

		var div_divider = document.createElement("div");
		div_divider.className = "dropdown-divider";
		comments_box.appendChild(div_divider);

		comments_box.appendChild(new_comments);
		comments_box.appendChild(comments);
		
		if (user_id == "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}") {
			var modifyBtn = document.createElement("button");
		    modifyBtn.innerHTML = "수정";
		    modifyBtn.dataset.c_no = c_no;
	        modifyBtn.onclick = function () {
	        	editComment(this.dataset.c_no);
		    };
		    modifyBtn.className = "btn btn-outline-primary";
		    modifyBtn.style.width = "60px";
		    modifyBtn.style.height = "25px";
		    modifyBtn.style.marginTop = "0px";
		    modifyBtn.style.marginRight = "120px";
		    modifyBtn.style.position = "absolute";
		    modifyBtn.style.right = "0";
	        comments.appendChild(modifyBtn);
		}
		
		if (user_id == "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}" || "${TravBoardVO.user_id}" == "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}") {
		    var deleteBtn = document.createElement("button");
	        deleteBtn.innerHTML = "삭제";
	        deleteBtn.dataset.c_no = c_no;
		    deleteBtn.onclick = function () {
	            deleteComment(this.dataset.c_no);
	        };
	        deleteBtn.className = "btn btn-outline-primary";
	        deleteBtn.style.width = "60px";
	        deleteBtn.style.height = "25px";
	        deleteBtn.style.marginTop = "0px";
	        deleteBtn.style.marginRight = "55px";
	        deleteBtn.style.position = "absolute";
	        deleteBtn.style.right = "0";
	        comments.appendChild(deleteBtn);
	    }
	}
	
	function deleteComment(c_no) {
		let data = {
				c_no : c_no,
		    };
		    $.ajax({
		        url: "${pageContext.servletContext.contextPath}/user/deleteComment",
		        async: false,
		        contentType: "application/json;charset=UTF-8",
		        data: data,
		        method: "GET",
		        success: function (data, textStatus, jqXHR) {
	            console.log("Deletion successful");
	            SelectContentsAjax();
		    },
		    error: function (jqXHR, textStatus, errorThrown) {
		        console.log(jqXHR);
		        console.log(textStatus);
		        console.log(errorThrown);
		    }
		});
	}
	
	function editComment(c_no) {
	    var newContent = prompt("새 댓글을 입력하세요:");
	    if (newContent === null) return;
	    if (newContent != null && newContent.trim() != '') {
	        let data = {
	            c_no: c_no,
	            contents: newContent
	        };
	        $.ajax({
	        	url : "${pageContext.servletContext.contextPath}/user/updateComment",
	        	dataType : "json",
	        	contentType : "application/json; charset=UTF-8",
	        	data : JSON.stringify(data),
	        	type : "POST",
	        	beforeSend:function(xhr){
                	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                },
	        	success : function(result) {
	        		if (result == 1) {
	        			SelectContentsAjax();
	                    alert('댓글 수정에 성공했습니다.');
	        		} else {
	                    alert('댓글 수정에 실패했습니다.');
	        		}
	        	},
	        	error : function(request, status, error) {
	        		alert("오류가 발생하였습니다. 다시 시도해주세요.");
	        	}
	        });
	    }
	}

	function refreshContents(boardCommentList) {
		const comments_box = document.getElementById("comments-box");
        comments_box.innerHTML = "";
		for(var i=0; i<boardCommentList.length; i++){
			input(boardCommentList[i].user_id, boardCommentList[i].contents, boardCommentList[i].c_no);
		}
	}

	function sendAlarmAjax(value) {
		let data = {
			user_id : value,
			b_no : '${param.b_no}',
			msg : "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}"+"가 당신을 멘션"
		};
		$.ajax({
			url : "${pageContext.servletContext.contextPath}/user/send-alarm",
			async : true,
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(data),
			method : "POST",
			 beforeSend:function(xhr){
             	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
             },
			success : function(data, textStatus, jqXHR) {
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(jqXHR);
				console.log(textStatus);
				console.log(errorThrown);
			}
		});
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
			//console.log(ment);
			//console.log("@[0]" + ment[0]);
			if (ment[1] != undefined) {
			//	console.log("@[1]" + ment[1]);
			}
			if (ment[1] != undefined) {
			//	console.log("name 추출 : " + ment[1].split(" ")[0]);
			}
		}
	}

	function getValue(){
		let contents = document.getElementById("contents");
		let string = "" + contents.value;
		//console.log("getValue if 1 >>");
		if(string[string.search("@")-1] != null  && string[string.search("@")-1] == " "){
			//console.log("getValue if 2 != null");
			let ment = string.split("@");
			if (ment[1] != undefined) {
				//console.log("value 추출 : " + ment[1].split(" ")[0]);
				return ment[1].split(" ")[0];
			}
		}
		return null;
	}
</script>
	<!-- plugins:css -->
	<link rel="stylesheet" 	href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
	<link rel="stylesheet" 	href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
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
	<script	src="${ pageContext.servletContext.contextPath }/resources/assets/js/hoverable-collapse.js"></script>
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
		init("${pageContext.request.servletContext.contextPath }", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}", "${_csrf.headerName}", "${_csrf.token}");
	}
</script>
<style>
.body {
	font-weight: 400;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.title_area {
	padding: 10px;
}

.content-wrapper {
	position: relative;
	width: 870px;
	margin: 0 auto;
	font-size: 13px;
}

.ContentBox {
	padding: 28px 28px 0;
	border: 2px solid #ebecef;
	border-radius: 6px;
}

.ContentBox .board_header {
	position: relative;
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #ebecef;
}

.boardTitle {
	margin-bottom: 5px;
	font-size: 15px;
}

.WriterInfo .thumb_area {
	float: left;
	margin-right: 10px;
}

.WriterInfo .thumb_area .thumb {
	position: relative;
	display: block;
	width: 36px;
	height: 36px;
}

.WriterInfo .profile_area {
	float: left;
}

.WriterInfo .profile_info {
	display: flex;
	align-items: normal;
	margin-bottom: 6px;
	flex-direction: column;
	position: relative;
}

.WriterInfo .board_info {
	font-size: 12px;
	line-height: 13px;
	color: white;
}

.views {
	padding-left: 10px;
}

.total_emoji {
	position: relative;
	bottom: 0;
	font-size: 13px;
	line-height: 18px;
	text-align: right;
}

.board_container {
	border: 3px double white;
	border-radius: 4px;
	padding: 20px;
	margin-bottom: 20px;
}

.BottomBtns {
	padding-top: 14px;
}

.BottomBtns .left_area {
	float: left;
}

.BaseButton {
	display: inline-block;
	border-radius: 6px;
	box-sizing: border-box;
	font-weight: 700;
	text-align: center;
	vertical-align: top;
}

.BaseButton.size_default:first-child {
	margin-left: 0;
}

.BaseButton.size_default {
	min-width: 46px;
	height: 36px;
	margin-left: 10px;
	padding: 0 12px;
	font-size: 13px;
	line-height: 36px;
}

.BaseButton--skinGreen {
	background: rgba(0, 0, 0, 0.06);
	color: #009f47;
}

.BaseButton--skinSkyBlue {
	background: rgba(0, 0, 0, 0.06);
	color: skyblue;
}

.BaseButton--skinRed {
	background: rgba(0, 0, 0, 0.06);
	color: red;
}

.BottomBtns .right_area {
	float: right;
}
</style>

</head>

<body>
	<div class="container-scroller" id="container-scroller">
		<div class="container-fluid page-body-wrapper" id="container-body-wrapper">
			<!-- 메인 패널 start -->
			<div class="main-panel">
				<!-- 컨텐츠 간격 컨테이너 start-->
				<div class="content-wrapper">
					<!-- 컨텐츠 박스 start -->
					<div class="ContentBox">
						<!-- header start -->
						<div class="board_header">
							<div class="boardTitle">
								<a href="${pageContext.request.contextPath}/menu/travBoard?user_id=${TravBoardVO.user_id}">
									<%=request.getParameter("b_no")%>
								</a>
								
								<div class="title_area">
									<h3 class="title_text">${TravBoardVO.title}</h3>
								</div>								
							</div>

							<!-- 작성자 정보 start-->
							<div class="WriterInfo">
								<div class="thumb_area">
									<a href="${pageContext.request.contextPath}/menu/profile?user_id=${TravBoardVO.user_id}"
										class="thumb"> <img class="img-xs rounded-circle"
										src="${pageContext.request.contextPath}/resources/TripToLive/default/default.jpg"
										alt="no">
									</a>									
								</div>

								<div class="profile_area">
									<div class="profile_info">${TravBoardVO.user_id}</div>

									<div class="board_info">
										<span class="reg_date">${TravBoardVO.reg_date}</span>
										<span class="views">조회 ${TravBoardVO.views}</span>
									</div>
								</div>
							</div>
							<!-- 작성자 정보 end-->
							<div class="total_emoji">공감수 ${TravBoardVO.total_emoji}</div>
						</div>
						<!-- header end -->

						<!-- 후기글 컨테이너 start -->
						<div class="board_container">
							<div class="board_viewer">
								<div class="content_boardViewer">
									<!-- 언어: 한글, 폰트 설정 -->
									<div class="board_viewer theme_default" lang="ko-KR">
										<!-- 메인 컨테이너 start -->
										<div class="main_container">
											<div>${TravBoardVO.contents}</div>
										</div>
										
										<div class="img-insight">
											<c:forEach var="boardImagevo" items="${requestScope.boardImagevo}">
												<img src="${pageContext.request.contextPath}${boardImagevo.img_path}">
											</c:forEach>
										</div>
										<!-- 메인 컨테이너 end -->
									</div>
								</div>
							</div>
						</div>
						<!-- 후기글 컨테이너 end -->
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
								          '<c:out value="${boardComment.contents}" />',
								          '<c:out value="${boardComment.c_no}" />');
											</script>
							</c:forEach>
						</div>
					</div>
					<!--댓글 end-->

					<!-- 수정,삭제,신고 버튼 하단에 배치 -->
					<div class="BottomBtns">
						<div class="left_area">
							<!--글 쓰기 버튼-->
							<button class="btn btn-outline-primary" onclick="goWrite()">
								<span class="BaseButton_txt">글쓰기</span>
							</button>

							<!-- 로그인한 사용자와 작성자가 같을 경우 글 수정/글 삭제 버튼 출력 -->
							<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id == TravBoardVO.user_id}">
								<!--글 수정 버튼-->
								<button class="btn btn-outline-primary" onclick="goUpdate()">
									<span class="BaseButton_txt">수정</span>
								</button>

								<!--글 삭제 버튼-->
								<button class="btn btn-outline-primary" onclick="goDelete()">
									<span class="BaseButton_txt">삭제</span>
								</button>
							</c:if>
						</div>
						<!-- left_area end -->

						<div class="right_area">
							<!-- 로그인한 사용자와 작성자가 다를 경우 신고 버튼만 출력 -->
							<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id ne TravBoardVO.user_id}">
								<!--글 신고 버튼-->
								<button class="btn btn-warning" onclick="goReport()">
									<span class="BaseButton__txt">글 신고</span>
								</button>
							</c:if>

							<!--목록 버튼-->
							<button class="btn btn-outline-primary" onclick="goMain()">
								<span class="BaseButton__txt">목록</span>
							</button>
						</div>
						<!-- right_area end -->
					</div>
					<!-- 버튼 end -->
				</div>
				<!-- 컨텐츠 간격 컨테이너 end-->
				<footer class="footer">
					<div class="d-sm-flex justify-content-center justify-content-sm-between">
						<span class="text-muted d-block text-center text-sm-left d-sm-inline-block">3조 프로젝트</span>
					</div>
				</footer>
			</div>
			<!-- 메인 패널  end-->
		</div>
	</div>	
</body>
</html>
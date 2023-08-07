<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>following</title>
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
        <script src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>
<style>
	.follow{
		background-color: aqua;
		width: 110px;
		height: 23px;
	}

	.unfollow{
		background-color: red;
		width: 110px;
		height: 23px;
	}
</style>
<script type="text/javascript">
	window.onload = function(){
		init("${pageContext.request.servletContext.contextPath }", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}", "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}", "${_csrf.headerName}", "${_csrf.token}");
		friendAjax();
		friendRecommendAjax();
    }
</script>
   
<script type="text/javascript">
	let GV_user = new Array(0); //profileVO

	function friendRecommendAjax(){
		$.ajax(
				{
					url: "${pageContext.request.contextPath}"+"/user/friendRecommend",
	                async:true,
	                contentType:"application/json;charset=UTF-8",
	                method:"POST", // GET
	                dataType:"JSON",
	                beforeSend:function(xhr){
	                	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	                },
	                success:function(data, textStatus, jqXHR)
	                {
	                	console.log(data);
						for(var i = 0; i < data.length; i++){
							GV_user.push(data[i].friend);
						}
						console.log("GV : "+GV_user[0].user_id);
	                	printFriend(data);
	                },
	                error:function(jqXHR, textStatus, errorThrown ){
	                    console.log(jqXHR);
	                    console.log(textStatus);
	                    console.log(errorThrown);
	                }
				}
		)
	}

	function printFriend(data) {
		let friendDiv = document.getElementById("plus-friend");
		for(var i = 0; i < data.length; i++){
			let friendDiv_div = document.createElement("div");
			friendDiv_div.style.cssText = "display: flex; align-items: center; flex-direction: column; margin-right 15px";

			let friendDiv_div_span = document.createElement("span");
			let friendDiv_div_span_img = document.createElement("img");
			friendDiv_div_span_img.src = "${pageContext.request.contextPath}"+data[i].friend.profile_img;
			friendDiv_div_span_img.style.cssText = "width: 70px; height: 70px;";

			let friendDiv_div_lab = document.createElement("label");
			friendDiv_div_lab.innerText = data[i].friend.user_name;
			let friendDiv_div_lab2 = document.createElement("label");
			friendDiv_div_lab2.innerText = "함께 팔로우 중 "+data[i].following.length;

			let friendDiv_div_btn = document.createElement("button");
			friendDiv_div_btn.id = GV_user[i].user_id;
			friendDiv_div_btn.value = data[i].friend.user_id;
			friendDiv_div_btn.innerText = "Follow";
			friendDiv_div_btn.className = "follow";

			friendDiv_div_btn.onclick = function(){
				followToggle(this);
			}

			friendDiv_div_span.appendChild(friendDiv_div_span_img);
			friendDiv_div.appendChild(friendDiv_div_span);
			friendDiv_div.appendChild(friendDiv_div_lab);
			friendDiv_div.appendChild(friendDiv_div_lab2);
			friendDiv_div.appendChild(friendDiv_div_btn);
			friendDiv.appendChild(friendDiv_div);
		}
		
	}

	function followToggle(element) {
		console.log(element.value);
		let data = {user_id : element.value};

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
					buttonToggle(element, data);
                },
                error:function(jqXHR, textStatus, errorThrown ){
                    console.log(jqXHR);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            }
		)
	}

	function buttonToggle(element, data){
		let btn = document.getElementById(element.id);
		console.log(element);
		console.log(data);
		if(data){
			element.innerText = "Follow";
			element.className = "follow";
		}else{
			element.innerText = "unFollow";
			element.className = "unfollow";
		}
		console.log(data);
	}
	
	function friendAjax() {
	   $.ajax(
				{//json
	                url: "${pageContext.request.contextPath}"+"/user/friend",
	                async:true,
	                contentType:"application/json;charset=UTF-8",
	                method:"POST", // GET
	                dataType:"JSON",
	                beforeSend:function(xhr){
	                	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	                },
	                success:function(data, textStatus, jqXHR)
	                {
	                	console.log(data);
						print(data);
	                },
	                error:function(jqXHR, textStatus, errorThrown ){
	                    console.log(jqXHR);
	                    console.log(textStatus);
	                    console.log(errorThrown);
	                }
	            }
			)
	}

	function print(data){
		let mainDiv = document.getElementById("friends");

		console.log(mainDiv);
		for(var i = 0; i < data.length; i++){
			let friendDiv = document.createElement("div");
			friendDiv.style.cssText = "margin-top: 15px; margin-right: 10px; margin-bottom: 15px";
			let friendDiv_span = document.createElement("span");
			let fiendDiv_span_img = document.createElement("img");
			fiendDiv_span_img.style.cssText = "height: 80px; width: 80px";
			fiendDiv_span_img.src = "${pageContext.request.contextPath}"+data[i].profile_img;
			let friendDiv_span2 = document.createElement("span");
			friendDiv_span2.innerText = data[i].user_name;
			
			friendDiv_span.appendChild(fiendDiv_span_img);
			friendDiv.appendChild(friendDiv_span);
			friendDiv.appendChild(friendDiv_span2);
			console.log(friendDiv);
			mainDiv.appendChild(friendDiv);
			let br1 = document.createElement("div");
			br1.className = "dropdown-divider";
			mainDiv.appendChild(br1);
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
								<div class="card-body" style="width: 100%; height: 100%;">
                                    <div id="plus-friend" style="height: 165px; display: flex;">
                                        
                                    </div>
									<div class="dropdown-divider"></div>
                                    <div id="friends" style="height: 100%px;">
                                        
                                    </div>
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
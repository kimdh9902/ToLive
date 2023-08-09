<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>뷰어</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js">
   
</script>
<script src="https://code.jquery.com/jquery-3.7.0.js">
   /*    integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
    crossorigin="anonymous"> */
</script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/vendors/mdi/css/materialdesignicons.min.css.map">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/vendors/css/vendor.bundle.base.css">

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/assets/css/style.css">

<link rel="shortcut icon"
   href="${pageContext.request.contextPath}/resources/assets/images/favicon.png" />

<script
   src="${pageContext.request.contextPath}/resources/assets/vendors/js/vendor.bundle.base.js"></script>

<script
   src="${pageContext.request.contextPath}/resources/assets/vendors/chart.js/Chart.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/js/off-canvas.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/js/hoverable-collapse.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/js/misc.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/js/settings.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/assets/js/todolist.js"></script>

<script
   src="${pageContext.request.contextPath}/resources/assets/js/dashboard.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>

<style type="text/css">
</style>
<script>
function goSubmit() {
		var content = document.getElementById("contents");
		var title = document.getElementById("title");
		if (title.value == '') {
			alert("제목을 입력해주세요");
			return false;
		}
		if (content.value == '') {
			alert("내용을 입력해주세요");
			return false;
		}

		console.log(content.value);
		console.log(title.value);
		return true;
	}

	window.onload = function() {
		document.getElementById("back")
	}

	function uploadFileAjax(){
	      var formData = new FormData();
	      var inputFile = document.getElementsByName("uploadFile");
	      var files = inputFile[0].files;
	      console.log(files);
	      for(var i=0; i < files.length; i++){
	         formData.append("uploadFile",files[i]);
	      }
	      
	      $.ajax({
	         url:'${pageContext.servletContext.contextPath}/marzipano/uploadAjaxAction'
	         ,processData : false
	         ,contentType: false
	         ,data: formData
	         ,dataType:"json"
	         ,beforeSend:function(xhr){
	             	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        }
	         ,type: 'POST'
	         ,success : function(jsonArray){
	            alert("uploaded");
	            let div = document.getElementById("board_contents_container");
	            
				
	           
				var fileName = jsonArray[0].src.replace(".zip","");
				fileName = fileName.replace("/trip/display/attach?fileName=","");
				
	  

				


	            for(var i=0 ; i < jsonArray.length ; i++){
					if(jsonArray[0].src.endsWith(".jpg")  || jsonArray[0].src.endsWith(".jpeg") ||jsonArray[0].src.endsWith(".png")){	
	               let imgDiv = document.createElement("div");
	               let imgObj = document.createElement("img");
				   imgObj.style.maxWidth = "800px";
				   imgObj.style.maxHeight = "450px";
	               console.log("jsonArray["+i+"] - " + jsonArray[i]);   
	               console.log("img src - " + jsonArray[i].src);
	               imgDiv.appendChild(imgObj);
	               imgObj.src = jsonArray[i].src;
	               
	               div.appendChild(imgDiv);
				}else if(jsonArray[0].src.endsWith(".zip")){
					let viewerPath = jsonArray[0].src.replace(".zip","");
					
					$.ajax({
    					url: "${pageContext.servletContext.contextPath}/marzipano/test01?viewerPath=" + fileName,
    					type: "GET",
    					dataType: "html",
						beforeSend:function(xhr){
	             		xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        			}
						,				
    					success: function(response) {
      					// 호출 결과로 받아온 JSP 페이지를 현재 페이지에 추가합니다.
					
      					$('#2').append(response);
					
    					},
    					error: function(xhr, status, error) {
      			
    }
  });




				}
	            }
	    	}
	      });
	   }







</script>
<style>
.custom-btn {
	display: inline-block;
	padding: 6px 12px;
	background-color: #5cb85c;
	border: 1px solid #4cae4c;
	border-radius: 5px;
	color: white;
	font-weight: bold;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="col p-3">
		<input type="file" name="uploadFile" accept=".png, .jpg, .jpeg, .zip"
			multiple="multiple" />
		<button onclick="uploadFileAjax();" class="custom-btn">전송</button>
		<hr>
		<br>
		
	</div>
	
		 <div class="mb-3 mt-3" id="main_container">
			
         	<div class="mb-3 mt-3" contenteditable="true" id="board_contents_container">

				<div id="2"></div>
			</div> 
	</div>          


</body>
</html>
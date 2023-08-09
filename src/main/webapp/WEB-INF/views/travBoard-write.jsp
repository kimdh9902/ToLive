<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>후기글 작성 페이지</title>
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
<script
   src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>

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

      uploadFileAjax();
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
	         ,async:false
	         ,data: formData
	         ,dataType:"json"
	         ,beforeSend:function(xhr){
	             	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        }
	         ,type: 'POST'
	         ,success : function(jsonArray){
               console.log("업로드 성공");
	         }});
   }
   
   function goTool(){
	   location.href = "${pageContext.servletContext.contextPath}/marzipano/marzipanoTool";
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
   <div class="container">
      <h2 style="text-align: center;">후기글 작성 페이지</h2>
      <form
         action="${pageContext.request.contextPath}/travBoard/travBoard-insert"
         method="post">
         <div class="row">

            <div class="mb-3 mt-3 col p-3">
               <label for="title">제목:</label> <input type="text"
                  class="form-control" id="title" name="title"
                  placeholder="제목을 입력해주세요">
            </div>

            <div class="mb-3 mt-3 col p-3">
               <label for="id">작성자:</label>
               <div class="form-control" id="id">${requestScope.travBoardList.user_id == null ? SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id : requestScope.travBoardList.user_id}</div>
            </div>
         </div>

         <div class="mb-3 mt-3">
            <label for="contents">내용:</label>
            <textarea class="form-control" id="contents" name="contents"
               rows="5" placeholder="내용을 입력해주세요"></textarea>
         </div>

         <div class="row">
            <div class="col p-3">
               <a
                  href="${pageContext.request.contextPath}/menu/travBoard?user_id=${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}">
                  <button id="back" type="button" class="custom-btn">여행후기글
                     목록</button>
               </a>
            </div>
				<div class="col p-3">
					<input type="file" name="uploadFile"
						accept=".png, .jpg, .jpeg, .zip" multiple="multiple" />
					<hr>
					<br>
				</div>
				

				<div class="col p-3">
               <button type="reset" class="btn btn-warning">초기화</button>
            </div>


            <div class="col p-3">
               <button id="sub" type="submit" class="custom-btn"
                  onclick="return goSubmit()">등록하기</button>
            </div>
         </div>

         <input type="hidden" name="id"
            value="${requestScope.travBoardList.user_id == null ? SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id : requestScope.travBoardList.user_id}">
         <input type="hidden" name="${_csrf.parameterName}"
            value="${_csrf.token}" />
      </form>
      <button class="custom-btn" onclick=goTool()>
				Tool
	  </button>
   </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login Page</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
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
    var msg = '<%=request.getParameter("msg")%>';
   
   window.onload = function(){
      showMsg();      
   }
   function showMsg() {
      console.log(msg);
      if(msg != null && msg != "" && msg != "null")
         {
          alert(msg);
         }
   }
        function verify(){
           var element;
            element = document.getElementById("userId");
            msg = "id를 입력"
            if(!isValid(element, msg))
            {
                return false;
            }
            
            element = document.getElementById("userPw");
            msg = "pw를 입력"
            if(!isValid(element, msg))
            {
                return false;
            }
            return true;
        }

        function isValid(element, msg)
        {
            let result = false;
            if(element.value == '')
            {
                alert(msg);
                element.focus();
                result = false;
            }else
            {
                result = true;
            }
            return result;
        }
    </script>
</head>
<body>
   <div class="container-scroller" style="width: 400px; height: 400px; position: absolute; top: 50%; left: 50%; transform: translate(-45%, -45%);">
      <div class="col" style="width: 50%; height: 50%;">
         <form class="forms-smaple" action="${pageContext.request.servletContext.contextPath }/auth/login" method="post" style="width: 100%; height: 100%; text-align: center;">
            <h2 class="form-title">로그인</h2>
            <br>
            <div class="form-group">
               <label for="userId" style="margin-right: 15px">아이디</label> 
               <input type="text" id="userId" name="userId">
            </div>
            <div class="form-group">
               <label for="userPw">비밀번호</label> 
               <input type="password" id="userPw" name="userPw">
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input class="btn btn-success" type="submit" id="log" value="로그인" style="width: 231px; height: 30px; margin-left: 10px" onclick="return verify()">
         </form>
         <form action="${pageContext.request.contextPath}/auth/register" method="get" style="text-align: center;">
            <button class="btn btn-primary" id="register" style="width: 231px; height: 30px; margin-top: 10px; margin-left: 10px">회원가입</button>
         </form>
      </div>
   </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>회원가입</title>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
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
        <script type="text/javascript">
        var msg = '<%=request.getParameter("msg")%>';
       const seoul = ["종로구","중구","용산구","성동구","동대문구","중랑구","성북구","도봉구","노원구","은평구","서대문구","마포구","양천구","강서구","구로구","영등포구","동작구","관악구","서초구","강남구","송파구","강동구"];
        const seoulvalue = ["1111","1114","1117","1120","1123","1126","1129","1132","1135","1138","1141","1144","1147","1150","1153","1156","1159","1162","1165","1168","1171","1174"];
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

        function locationSidoDelete(){
            var gungu = document.getElementById("location-sel2");
            for (let i = gungu.options.length-1; i > 0; i--) {
                gungu.remove(i);
            }
        }

        function locationSidoOption(element){
            let opList = null;
            console.log("opti len="+element.options.length);
            if(element.options.length > 1){
                locationSidoDelete();
            }
            let gungu = document.getElementById("location-sel2");
            switch(element.value){
                case "1":
                for(var i = 0; i < seoul.length; i++){
                    var op = document.createElement("option");
                    op.text = seoul[i];
                    op.value = seoulvalue[i];
                    gungu.appendChild(op);
                }
            break;
            }
            return opList;
        }

        function isLocation(){
            var sido = document.getElementById("location-sel");
            var gungu = document.getElementById("location-sel2");
            
            if(sido.value == 0)
                return false;
            if(gungu.value == 0)
                return false;
            
                
            return true;
        }
        
        function isSuccess() {
        	if(isLocation()){
        		
        	}
        	alert("회원가입 실패")
        	return false;
		}
        </script>
    </head>

    <body>
        <div class="container-scroller">
            <!-- 왼쪽 슬라이드 바 로고 -->
            <!-- <div class="container-fluid page-body-wrapper"> -->
            <div class="col-sm-3" style="margin-left: 39%; margin-top: 3%">
               <br>
                    <form class="forms-sample" action="${pageContext.request.contextPath}/auth/register" method="post" style="text-align: center;" onsubmit="return isSuccess()">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input class="form-control" type="text" id="id" name="id" required><br>
                        </div>
                        <div class="form-group">
                            <label for="pw">비밀번호</label>
                            <input class="form-control" type="password" id="pw" name="pw" required><br>
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input class="form-control" type="text" id="name" name="name" required><br>
                        </div>
                        <div class="form-group">
                            <label for="birth">생년월일</label>
                            <input class="form-control" type="date" id="birth" name="birth" required><br>
                        </div>
                        <div class="form-group">
                            <label for="phone">전화번호</label>
                            <input class="form-control" type="tel" id="phone" name="phone"
                                pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" alt="ex)010-1234-5678" required><br>
                        </div>
                        <div class="form-group">
                            <label for="location">지역</label><br>
                            <select style="margin-right: 7px" id="location-sel" onchange="locationSidoOption(this)" required><br>
                                <option value="0" selected>시/도 선택</option>
                                <option value="1">서울 특별시</option>
                                <option value="2">부산광역시</option>
                                <option value="3">대구광역시</option>
                                <option value="4">인천광역시</option>
                                <option value="5">광주광역시</option>
                                <option value="6">대전광역시</option>
                                <option value="7">울산광역시</option>
                                <option value="8">충청북도</option>
                                <option value="9">충청남도</option>
                                <option value="10">전라북도</option>
                                <option value="11">경상남도</option>
                                <option value="12">제주특별자치도</option>
                                <option value="13">강원특별자치도</option>
                            </select>
                            <select id="location-sel2" name="location" required><br>
                                <option value="0" selected>군/구 선택</option>
                            
                            </select>
                        </div>
                        <input type="submit" class="btn-outline-info" style="background-color: #8f5fe8; color: white; width: 200px" id="register" value="전송">
                    </form>
            </div>
        </div>
    </body>

    </html>
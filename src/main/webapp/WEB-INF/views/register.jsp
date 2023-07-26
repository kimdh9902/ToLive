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
            getLocationAjax(element.value);
            
            return opList;
        }
	
        function makeOption(location) {
        	let gungu = document.getElementById("location-sel2");
        	for(var i = 0; i < location.length; i++){
            	var option = document.createElement("option");
                option.text = location[i].location_name;
            	option.value = location[i].location_id;
                gungu.appendChild(option);
            }		
		}
        
        function getLocationAjax(location_value){
        	var returnData = null;
        	if(location_value != 0){
	        	let data = {
	        		location_name : location_value
	        	}
	            $.ajax(
	            	{
	           		url:  "${ pageContext.servletContext.contextPath }"+"/auth/location",
	                async:true,
	                contentType:"application/json;charset=UTF-8",
	                data: JSON.stringify(data),
	                method:"POST",
	                dataType:"JSON",
	                success:function(data, textStatus, jqXHR)
	                {
	                	console.log(data);
	                	makeOption(data);
	                },
	                error:function(jqXHR, textStatus, errorThrown ){
	                    console.log(jqXHR);
	                    console.log(textStatus);
	                    console.log(errorThrown);
	                }	
	            	}
	            )
        	}
        }

        function isLocation(){
            var sido = document.getElementById("location-sel");
            var gungu = document.getElementById("location-sel2");
               
            if(sido.value == 0){
                alert("시,도 선택");
                sido.focus();
                return false;
            }
                
            if(gungu.value == 0){
                alert("군,구 선택");
                gungu.focus();
                return false;
            }
 
            return true;
        }
        
        function isRegisterAjax(idP, pwP, nameP, birthP, phoneP, locationP){
        	let result = false;
            let data = {
                id : idP,
                pw : pwP,
                name : nameP,
                birth : birthP,
                phone : phoneP,
                location : locationP
            }
            $.ajax(
                {
                url:  "${ pageContext.servletContext.contextPath }/auth/register",
                async:false,
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify(data),
                method:"POST",
                dataType:"JSON",
                success:function(data, textStatus, jqXHR)
                {
                    console.log(data);
                    result = data;
                },
                error:function(jqXHR, textStatus, errorThrown ){
                    console.log(jqXHR);
                    console.log(textStatus);
                    console.log(errorThrown);
                }	
                }
            )
            return result;
        }
		
        function idCheckAjax(id){
            let result = null;
            let data = {
                id : id.value
            }
            $.ajax(
                {
                url:"${ pageContext.servletContext.contextPath }/auth/idcheck",
                async:false,
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify(data),
                method:"POST",
                dataType:"JSON",
                success:function(data, textStatus, jqXHR)
                {
                    console.log(data);
                    result = data;
                },
                error:function(jqXHR, textStatus, errorThrown ){
                    console.log(jqXHR);
                    console.log(textStatus);
                    console.log(errorThrown);
                }	
                }
            )
            return result;
        }
        
        function idCheck(){
        	var id = document.getElementById("id");
        	console.log(id.value);
            if(idCheckAjax(id)){
            	alert("이미 사용중인 ID");
            	id.value = "";
            }
            else{
            	alert("사용가능한 ID");
            }
        }

        function isSuccess() {
            let form_box = document.getElementById("register-form");
          	
            let result = isRegisterAjax(
            form_box.children[0].children[1].value,
            form_box.children[1].children[1].value,
            form_box.children[2].children[1].value, 
            form_box.children[3].children[1].value,
            form_box.children[4].children[1].value,
            form_box.children[5].children[4].value,
            );
            if(result){
                alert("회원가입 성공")
                // window.location.href = "${pageContext.request.contextPath}/auth/login"
            }
        	return result;
		}
        </script>
    </head>

    <body>
        <div class="container-scroller">
            <!-- 왼쪽 슬라이드 바 로고 -->
            <!-- <div class="container-fluid page-body-wrapper"> -->
            <div class="col-sm-3" style="margin-left: 39%; margin-top: 3%">
               <br>
                    <form id="register-form" class="forms-sample" action="${pageContext.request.contextPath}/auth/login" method="get" style="text-align: center;" onsubmit="return isSuccess()">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input class="form-control" type="text" id="id" name="id" required>
                            <input type="button" onclick="idCheck()" value="id중복확인">
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
                            <select style="margin-right: 7px" id="location-sel" onchange="locationSidoOption(this);" required>
                                <option value ="0" selected>시/도 선택</option>
                                <option value ="서울특별시">서울특별시</option>
                                <option value ="부산광역시">부산광역시</option>
                                <option value ="대구광역시">대구광역시</option>
                                <option value ="인천광역시">인천광역시</option>
                                <option value ="광주광역시">광주광역시</option>
                                <option value ="대전광역시">대전광역시</option>
                                <option value ="울산광역시">울산광역시</option>
                                <option value ="충청북도">충청북도</option>
                                <option value ="충청남도">충청남도</option>
                                <option value ="전라북도">전라북도</option>
                                <option value ="경상남도">경상남도</option>
                                <option value ="제주특별자치도">제주특별자치도</option>
                                <option value ="강원특별자치도">강원특별자치도</option>
                            </select>
                            <br>
                            <select id="location-sel2" name="location" required><br>
                                <option value="0" selected>군/구 선택</option>
                            
                            </select>
                        </div>
                        <input type="submit" class="btn-outline-info" style="background-color: #8f5fe8; color: white; width: 200px" id="register" value="전송" onclick="return isLocation();">
                    </form>
            </div>
        </div>
    </body>

    </html>
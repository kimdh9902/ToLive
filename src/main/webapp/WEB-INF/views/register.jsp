<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>
    <style>
        .can{
            background-color: #8f5fe8; 
            color: white; 
            width: 200px;
        }
        .cant{
            background-color: #564b6d; 
            color: white; 
            width: 200px;
        }
        .container-scroller{
            width: 50%; 
            height: 100%;
        }

        .col-sm-3 > div{
            width: 80%;
            height: 100%;
        }
        .overlap {
            background-color: #9da85c;
        }
        .hash {
            background-color: #d8db1a;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        @media only screen and (max-width: 600px) {
            .container-form {
                width: 100%;
                left: 0;
            }
        }
    </style>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        let GV_HASH;//해쉬태그 목록
        let GV_HASH_SELECT = new Array(0);//유저가 고른 해쉬태그 목록
        const GV_HASH_LEN = 12;
        

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
	                beforeSend:function(xhr){
	                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	                },
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

        function isSubmit(){
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

            if(GV_HASH_SELECT.length < 3){
                alert("3개 이상의 관심사를 선택해주세요");
                return false;
            }
            return true;
        }
        
        function isRegisterAjax(idP, pwP, nameP, birthP, phoneP, locationP){
        	let result = false;
            let hashL = getHashTags();
            console.log("getHashList")
            console.log(hashL);
            let data = {
                id : idP,
                pw : pwP,
                name : nameP,
                birthday : birthP,
                phone_number : phoneP,
                location_id : locationP,
                hashList : hashL
            };
            console.log(JSON.stringify(data));
            $.ajax(
                {
                url:  "${ pageContext.servletContext.contextPath }/auth/register",
                async:false,
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify(data),
                method:"POST",
                dataType:"JSON",
                beforeSend:function(xhr){
                	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                },
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
                beforeSend:function(xhr){
                	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                },
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
            let register = document.getElementById("register");
        	console.log(id.value);
            if(idCheckAjax(id)){
            	alert("이미 사용중인 ID");
            	id.value = "";
                register.classList.add("cant");
                register.classList.remove("can");
                register.disabled = true;
            }
            else{
            	alert("사용가능한 ID");
                register.classList.add("can");
                register.classList.remove("cant");
                register.disabled = false;
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

        function hashLoadAjax(){
            $.ajax(
                {
                url:"${ pageContext.servletContext.contextPath }/auth/hash",
                async:false,
                contentType:"application/json;charset=UTF-8",
                method:"POST",
                dataType:"JSON",
                beforeSend:function(xhr){
                	xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                },
                success:function(data, textStatus, jqXHR)
                {
                    console.log(data);
                    GV_HASH = data;
                },
                error:function(jqXHR, textStatus, errorThrown ){
                    console.log(jqXHR);
                    console.log(textStatus);
                    console.log(errorThrown);
                }	
                }
            )
        }
        
        window.onload = function(){
            hashLoadAjax();
            let result = randHash();
            printHashList(result);
        }
        // 해쉬태그 추출
        function getHashTags(){
            let hashLab = document.getElementById("history");
            let hashList = hashLab.innerText.split("#");
            
            hashList.shift();
            let result = Array(0);
            for(var i = 0; i < hashList.length; i++){
                let hash = hashList[i].replace(',', ''); // 쉼표를 공백으로 바꿈
                result[i] = findHashIndex(GV_HASH, "#"+hash);
            }
            return result;
        }
        // 랜덤값 뽑기
        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min)) + min;
        }
        /* Array에서 밸류값 찾기
        * 가장 처음 일치하는 인덱스를 반환
        * 찾으면 인덱스
        * 못찾으면 -1
        **/
        function find(list, value){
            var result = -1;
            for(var i = 0; i < list.length; i++){
                if(list[i] == undefined){
                    break;
                }
                if(typeof list[i] == "string"){
                    if(list[i].trim() == value){
                        result = i;
                        break;
                    }
                }else{
                    if(list[i] == value){
                        result = i;
                        break;
                    }
                }
                
            }
            return result;
        }
        // 해쉬태그 정수값 찾기
        function findHashIndex(list, value){
            for(var i = 0; i < list.length; i++){
                if(list[i] == value)
                {
                    return i;
                }
            }
            return -1;
        }
        // 온클릭
        function reRoll(){
            let result = randHash();
            printHashList(result);
            console.log(getHashTags());
        }
        // 해쉬태그 랜덤 생성
        function randHash(){
            let rand_List = Array(GV_HASH_LEN);
            let i = 0;
            while(rand_List[i] == undefined && i < rand_List.length){
                
                let rand = getRandomInt(0, GV_HASH.length);
                if( find(rand_List, rand) == -1 ){
                    rand_List[i] = find(GV_HASH_SELECT, GV_HASH[rand]) != -1 ? ""+rand : rand;
                    i++;
                }
            }
            console.log(rand_List);
            return rand_List;
        }
        // 해쉬태그 이전 버튼 제거
        function removeHashList(){
            let hashDiv = document.getElementById("hash_list");
            let length = hashDiv.childElementCount - 6;
            for(var i = 0; i < length; i++){
                hashDiv.removeChild(hashDiv.lastChild);
            }
        }
        // 해쉬태그 버튼 토글
        function btnToggle(btn){
            if(btn.className == "overlap"){
                btn.className = "hash";
            }else{
            btn.className = "overlap";
            }
        }
        // 해쉬태그 현재 선택상태
        function selectedBtn(val){
            GV_HASH_SELECT[GV_HASH_SELECT.length] = GV_HASH[val];
            updateSelected();
        }
        // 선택한 해쉬태그들 출력
        function updateSelected(){
            let historyLab = document.getElementById("history");
            historyLab.innerText = GV_HASH_SELECT;
        }
        // 해쉬태그 버튼 온클릭
        function selectButton(element){
            let index = find(GV_HASH_SELECT, GV_HASH[element.value]);
            if(index != -1){
                GV_HASH_SELECT.splice(index, 1);
                updateSelected();
            }else{
                selectedBtn(element.value);
            }
            
            btnToggle(element);
        }
        // 해쉬태그 버튼 추가
        function printHashList(hashList){
            removeHashList();
            let hashDiv = document.getElementById("hash_list");
            for(var i = 0; i < hashList.length; i++){
                let btn = document.createElement("button");
                //중복된 해시태그 처리
                btn.type = "button";
                btn.className = "hash";
                btn.id = "hash_btn"+i;
                btn.value = hashList[i];
                btn.onclick = function() {selectButton(this);}
                btn.innerText = GV_HASH[hashList[i]];
                if(typeof hashList[i] == "string"){
                    btnToggle(btn);
                    btn.disabled = "true";
                }
                hashDiv.appendChild(btn);
            }
        }
        </script>
    </head>

    <body>
        <!-- transform: translate(0%, -50%);  container-scroller --> 
        <div class="container-scroller" style="position: absolute; top: 10%; left: 25%;">
            <!-- 왼쪽 슬라이드 바 로고 -->
            <!-- <div class="container-fluid page-body-wrapper"> -->
            <form id="register-form" class="forms-sample container-form" action="${pageContext.request.contextPath}/auth/login" method="get" style="text-align: center; width: 80%; height: 100%; position: absolute; left: 10%;" onsubmit="return isSuccess()">
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
                    <label for="birthday">생년월일</label>
                    <input class="form-control" type="date" id="birth" name="birthday" required><br>
                </div>
                <div class="form-group">
                    <label for="phone_number">전화번호</label>
                    <input class="form-control" type="tel" id="phone" name="phone_number"
                        pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}"  required><br>
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
                <div class="form-group" id="hash_list">
                    <label for="ReRoll" >관심사 선택</label><br>
                    <label for="ReRoll" id="history"></label><br>
                	<button type="button" value="ReRoll" onclick="reRoll()">ReRoll</button>
                    <br>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="submit" class="cant" id="register" value="전송" onclick="return isSubmit();" disabled="true">
            </form>
        </div>
    </body>

    </html>
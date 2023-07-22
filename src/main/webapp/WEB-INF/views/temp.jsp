function ajaxCall() {
    let data = {
        id : '${sessionScope.SESS_ID }'
    };
    $.ajax({//json
        url : "${pageContext.request.contextPath}" + "/alarm",
        async : true,
        headers : {
            "content-type" : "application/json"
        },
        contentType : "application/json;charset=UTF-8",
        data : data,
        method : "GET",
        dataType : "JSON",
        success : function(data, textStatus, jqXHR) {
            console.log(data);
            printAlarm(data);
            /* console.log("data:" + data.jsonList); */
            /* var userList = JSON.parse(data); */
            /* console.log("uL"+userList); */

        },
        error : function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}

function make(msg) {
    let alarm = document.getElementById("alarm");

    var div_divider = document.createElement("div");
    div_divider.className = "dropdown-divider";
    alarm.appendChild(div_divider);
    // --------------------------------------------------------------
    var a_drop = document.createElement("a");
    a_drop.className = "dropdown-item preview-item";
    var div_thumb = document.createElement("div");
    div_thumb.className = "preview-thumbnail";
    var prf_img = document.createElement("img");
    prf_img.className = "rounded-circle profile-pic";
    prf_img.src = "${pageContext.request.contextPath}/resources/img/images.jpg";
    div_thumb.appendChild(prf_img);
    a_drop.appendChild(div_thumb);
    //----------------------------------------------------
    var div_content = document.createElement("div");
    div_content.className = "preview-item-content";
    var p_text = document.createElement("p");
    p_text.innerText = msg //메세지 입력!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    div_content.appendChild(p_text);
    a_drop.appendChild(div_content);
    alarm.appendChild(a_drop);
    console.log(alarm);
}

function printAlarm(userList) {
    let alarm = document.getElementById("alarm");
    let isOpne = document.getElementById("isalarm");

    if (isOpne.className == "nav-item dropdown border-left show") {
        console.log("true");
        for (var i = 0; i < userList.length; i++) {
            make(userList[i].msg);
        }
    } else {
        console.log("false");
        for (var i = alarm.childElementCount - 1; i > 1; i--) {
            alarm.removeChild(alarm.children[i]);
        }
    }
}
<!-- 왼쪽 슬라이드 바 로고 -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <div
        class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
        <!-- 이미지를 링크화 한것 -->
        <a class="card-title text-primary" style="text-align: left;"
            href="${pageContext.request.contextPath}/main/">TriptoLive</a> 
            <a class="sidebar-brand brand-logo-mini"
            href="${pageContext.request.contextPath}/main/"> <img
            src="${pageContext.request.contextPath}/resources/assets/images/logo-mini.svg"
            alt="logo" /></a>
        <!-- ---------------------------------------------------------------------------- -->
    </div>
    <!-- 슬라이드바 리스트 -->
    <ul class="nav">
        <li class="nav-item profile">
            <div class="profile-desc">
                <a
                    href="${pageContext.request.servletContext.contextPath}/menu/profile?user_id=${sessionScope.SESS_ID}">
                    <!-- 프로필 링크 -->
                    <div class="profile-pic">
                        <div class="count-indicator">
                            <img class="img-xs rounded-circle "
                                src="${pageContext.request.contextPath}/resources/img/images.jpg" alt="">
                            <span class="count bg-success"></span>
                        </div>
                        <div class="profile-name">
                            <h5 class="mb-0 font-weight-normal">${sessionScope.SESS_NAME }</h5>
                        </div>
                    </div>
                </a>
                <!-- 프로필 링크 끝 -->
                <!-- 프로필 추가메뉴 -->
                <a href="#" id="profile-dropdown" data-toggle="dropdown"><i
                    class="mdi mdi-dots-vertical"></i></a>
                <div
                    class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list"
                    aria-labelledby="profile-dropdown">
                    <a href="#" class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-dark rounded-circle">
                                <i class="mdi mdi-settings text-primary"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <p class="preview-subject ellipsis mb-1 text-small">Account
                                settings</p>
                        </div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-dark rounded-circle">
                                <i class="mdi mdi-onepassword  text-info"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <p class="preview-subject ellipsis mb-1 text-small">Change
                                Password</p>
                        </div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-dark rounded-circle">
                                <i class="mdi mdi-calendar-today text-success"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <p class="preview-subject ellipsis mb-1 text-small">To-do
                                list</p>
                        </div>
                    </a>
                </div>
                <!-- 프로필 추가메뉴 끝-->
            </div> <!-- 프로필 끝 -->
        </li>					
        <!-- 메인 -->
        <li class="nav-item menu-items">
        <a class="nav-link" href="${pageContext.request.contextPath}/main/"> 
        <span class="menu-icon"> <i class="mdi mdi-airballoon"></i></span> 
        <span class="menu-title">여행 후기글</span>
        </a></li>

        <!-- 파티 찾기 -->
        <li class="nav-item menu-items">
        <a class="nav-link" href="${pageContext.request.contextPath}/menu/partyBoard/"> 
        <span class="menu-icon"> 
        <i class="mdi mdi-account-multiple-plus"></i></span> 
        <span class="menu-title">파티 찾기</span>
        </a></li>

        <!-- 친구 검색 -->				
        <li class="nav-item menu-items"><a class="nav-link"
            href="${pageContext.request.contextPath}/menu/findUser"> <span
                class="menu-icon"> <i class="mdi mdi-account-multiple-plus"></i></span>
                <span class="menu-title">친구 검색</span>
        </a></li>

        <!-- 명예의 전당 -->
        <li class="nav-item menu-items"><a class="nav-link"
            href="${pageContext.request.contextPath}/menu/starBoard"> <span
                class="menu-icon"> <i class="mdi mdi-trophy-variant"></i></span> <span
                class="menu-title">명예의 전당</span>
        </a></li>
        
        <li class="nav-item menu-items">
            <a class="nav-link" href="#auth" data-toggle="collapse" aria-expanded="false" aria-controls="auth"> <!--  -->
                <span class="menu-icon">
                    <i class="mdi mdi-account-multiple-outline"></i>
                </span>
                <span class="menu-title">친구</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/menu/findUser"> 
                    <span class="menu-icon"> <i class="mdi mdi-account-multiple-plus"></i></span> <span class="menu-title">유저 검색</span>
                    </a></li>
                  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/menu/friendList"> 
                    <span class="menu-icon"> <i class="mdi mdi-folder-account"></i></span> <span class="menu-title">친구 목록</span>
                    </a></li>
                </ul>
            </div>
        </li>
    </ul>
</nav>
<!-- 왼쪽 슬라이드바 -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <div class="sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top">
        <!-- 이미지를 링크화 한것 -->
        <a class="card-title text-primary" style="text-align: left;"
            href="${pageContext.request.contextPath}/main">TriptoLive</a>
        <a
            class="sidebar-brand brand-logo-mini"
            href="${pageContext.request.contextPath}/main"> 
            <img
            src="${pageContext.request.contextPath}/assets/images/logo-mini.svg"
            alt="logo" />
        </a>
        <!-- ---------------------------------------------------------------------------- -->
    </div>
    <!-- 슬라이드바 리스트 -->
    <ul class="nav">
        <li class="nav-item profile">
            <div class="profile-desc">
                <a href="${pageContext.request.servletContext.contextPath}/menu/profile?user_id=${sessionScope.SESS_ID}">
                    <!-- 프로필 링크 -->
                    <div class="profile-pic">
                        <div class="count-indicator">
                            <img class="img-xs rounded-circle"
                                src="${pageContext.request.contextPath}/resources/img/images.jpg" alt="">
                            <span class="count bg-success"></span>
                        </div>
                        <div class="profile-name">
                            <h5 class="mb-0 font-weight-normal">${sessionScope.SESS_NAME }</h5>
                        </div>
                    </div>
                </a>
                <!-- 프로필 링크 끝 -->
                <a href="#" id="profile-dropdown" data-toggle="dropdown"><i
                    class="mdi mdi-dots-vertical"></i></a>
                <div class="dropdown-menu dropdown-menu-right sidebar-dropdown preview-list" aria-labelledby="profile-dropdown">
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
            </div> <!-- 프로필 끝 -->
        </li>
        <!-- 메인 -->
        <li class="nav-item menu-items">
            <a class="nav-link" href="${pageContext.request.contextPath}/main/"> 
                <span class="menu-icon"> <i class="mdi mdi-airballoon"></i></span>
                <span class="menu-title">여행 후기글</span>
            </a>
        </li>

        <%-- <!-- 파티 찾기 -->
        <li class="nav-item menu-items"><a class="nav-link"
            href="${pageContext.request.contextPath}/menu/partyBoard"> <span
                class="menu-icon"> <i class="mdi mdi-account-search"></i></span> <span
                class="menu-title">파티 찾기</span>
        </a></li> --%>

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
            <a class="nav-link" href="#friend" data-toggle="collapse" aria-expanded="false" aria-controls="friend"> <!--  -->
                <span class="menu-icon">
                    <i class="mdi mdi-account-multiple-outline"></i>
                </span>
                <span class="menu-title">친구</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="friend">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> 
                        <a class="nav-link" href="${pageContext.request.contextPath}/menu/findUser"> 
                            <span class="menu-icon"> <i class="mdi mdi-account-multiple-plus"></i></span>
                            <span class="menu-title">유저 검색</span>
                        </a>
                    </li>
                  <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath}/menu/friendList"> 
                    <span class="menu-icon"> <i class="mdi mdi-folder-account"></i></span> <span class="menu-title">친구 목록</span>
                    </a></li>
                </ul>
            </div>
        </li>
    </ul>
</nav>
<!-- 상단바 -->
<nav class="navbar p-0 fixed-top d-flex flex-row">
    <div class="navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center">
        <a class="navbar-brand brand-logo-mini" href="${pageContext.request.contextPath}/main"> 
            <img src="${pageContext.request.contextPath}/assets/images/logo-mini.svg" alt="logo" /></a>
    </div>
    <div
        class="navbar-menu-wrapper flex-grow d-flex align-items-stretch">
        <button class="navbar-toggler navbar-toggler align-self-center"
            type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
        </button>
        <!-- 상단바 박스들-->
        <ul class="navbar-nav navbar-nav-right">
            <!-- 알림종 -->
            <li id="isalarm" class="nav-item dropdown border-left"><a
                class="nav-link count-indicator dropdown-toggle"
                id="notificationDropdown" href="#" data-toggle="dropdown"
                onclick="ajaxCall()"> <i class="mdi mdi-bell"></i> <span
                    class="count bg-danger"></span>
            </a>
                <div
                    class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                    aria-labelledby="notificationDropdown" id="alarm">
                    <h6 class="p-3 mb-0">Notifications</h6>
                    <div class="dropdown-divider"></div>
                </div></li>
            <li class="nav-item dropdown"><a class="nav-link"
                id="profileDropdown" href="#" data-toggle="dropdown">
                    <div class="navbar-profile">
                        <img class="img-xs rounded-circle"
                            src="${pageContext.request.contextPath}/img/images.jpg" alt="">
                        <p class="mb-0 d-none d-sm-block navbar-profile-name">${sessionScope.SESS_NAME }</p>
                        <i class="mdi mdi-menu-down d-none d-sm-block"></i>
                    </div>
            </a>
                <div
                    class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
                    aria-labelledby="profileDropdown">
                    <h6 class="p-3 mb-0">Profile</h6>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-dark rounded-circle">
                                <i class="mdi mdi-settings text-success"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <p class="preview-subject mb-1">Settings</p>
                        </div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <!-- 로그아웃 링크 연결해야함@@@@@@@@@@@ -->
                    <a href="${pageContext.request.contextPath}/logout"
                        class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-dark rounded-circle">
                                <i class="mdi mdi-logout text-danger"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <p class="preview-subject mb-1">로그아웃</p>
                        </div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <p class="p-3 mb-0 text-center">Advanced settings</p>
                </div></li>
        </ul>
        <button
            class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
            type="button" data-toggle="offcanvas">
            <span class="mdi mdi-format-line-spacing"></span>
        </button>
    </div>
</nav>
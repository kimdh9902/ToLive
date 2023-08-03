// alarmStateChange() 알림종에 빨간 동그라미 토글
let GV_path;
let GV_sess_id;
let GV_sess_name;

function init(path, sess_id, sess_name){
    GV_path = path;
    GV_sess_id = sess_id
    GV_sess_name = sess_name;
	let base = document.getElementById("container-scroller");
    let base_div = document.getElementById("container-body-wrapper");
    let left_nav = makeLeftSlideBar();
    let topNav = makeTopNavBar();

    //추가 필요 작업
    

    //페이지에 붙이기
    if (base.firstChild) {
        base.insertBefore(left_nav, base.firstChild); //첫번째 자식의 이전에다가 append 하겠다
    } else {
        base.appendChild(left_nav);
    }
    if(base_div.firstChild){
        base_div.insertBefore(topNav, base_div.firstChild);
    } else {
        base_div.appendChild(topNav);
    }
    alarmIsOpenAjax(path, sess_id); // 안읽은 알람 체크 ●
    alarmAjax(path, sess_id);
    //추가 이벤트 작업
    // let alarm_a = document.getElementById("alarmDropdown");
    // alarm_a.onclick = function() {
    //     alarmAjax(path, sess_id);
    // }
}

function makeLeftSlideBar(){
    //프로필
    let left_nav = document.createElement("nav");
    left_nav.className = "sidebar sidebar-offcanvas";
    left_nav.id = "sidebar";
    //nav[0]
    //nav > div
    let logo_div = document.createElement("div");
    logo_div.className = "sidebar-brand-wrapper d-none d-lg-flex align-items-center justify-content-center fixed-top";
    //nav div > a
    let logo_a = document.createElement("a");
    logo_a.className = "card-title text-primary";
    logo_a.style.textAlign = "left";
    logo_a.href = GV_path+"/main/";
    logo_a.innerText = "TriptoLive";
    // nav div > a
    let logo_a2 = document.createElement("a");
    logo_a2.className = "sidebar-brand brand-logo-mini";
    logo_a2.href = GV_path+"/main/";
    // nav div > a > img
    let logo_a2_img = document.createElement("img");
    logo_a2_img.src = GV_path+"/assets/images/logo-mini.svg";
    logo_a2_img.alt = "logo";
    logo_div.appendChild(logo_a);
    logo_a2.appendChild(logo_a2_img);
    logo_div.appendChild(logo_a2);

    //nav[1]
    //nav > ul
    let menu_list = document.createElement("ul");
    menu_list.className = "nav";
    //nav > ul > li
    let menu_li1 = document.createElement("li");
    menu_li1.className = "nav-item profile";
    //nav > ul > li > div
    let menu_li1_div = document.createElement("div");
    menu_li1_div.className = "profile-desc";
    //nav > ul > li > div > a
    let menu_li1_div_a = document.createElement("a");
    menu_li1_div_a.href = GV_path+"/menu/profile?user_id="+GV_sess_id;
    //nav > ul > li > div > a > div
    let menu_li1_div_a_div = document.createElement("div");
    menu_li1_div_a_div.className = "profile-pic";
    //nav > ul > li > div > a > div > div
    let menu_li1_div_a_div_div = document.createElement("div");
    menu_li1_div_a_div_div.className = "count-indicator";
    //nav > ul > li > div > a > div > div > img
    let menu_li1_div_a_div_div_img = document.createElement("img");
    menu_li1_div_a_div_div_img.className = "img-xs rounded-circle";
    menu_li1_div_a_div_div_img.src = GV_path+"/resources/TripToLive/default/default.jpg";
    menu_li1_div_a_div_div_img.alt = "no";
    //nav > ul > li > div > a > div > div > span
    let menu_li1_div_a_div_div_span = document.createElement("span");
    menu_li1_div_a_div_div_span.className = "count bg-success";
    //nav > ul > li > div > a > div > div
    let menu_li1_div_a_div_div2 = document.createElement("div");
    menu_li1_div_a_div_div2.className = "profile-name";
    //nav > ul > li > div > a > div > div > h5
    let menu_li1_div_a_div_div2_h5 = document.createElement("h5");
    menu_li1_div_a_div_div2_h5.className = "mb-0 font-weight-normal";
    menu_li1_div_a_div_div2_h5.innerText = GV_sess_name;
    menu_li1_div_a_div_div.appendChild(menu_li1_div_a_div_div_img);
    menu_li1_div_a_div_div.appendChild(menu_li1_div_a_div_div_span);
    menu_li1_div_a_div_div2.appendChild(menu_li1_div_a_div_div2_h5);
    menu_li1_div_a_div.appendChild(menu_li1_div_a_div_div);
    menu_li1_div_a_div.appendChild(menu_li1_div_a_div_div2);
    menu_li1_div_a.appendChild(menu_li1_div_a_div);
    menu_li1_div.appendChild(menu_li1_div_a);
    // 프로필 링크 끝
    //드롭다운 ...
    //nav > ul > li > div > a
    let menu_li1_div_a2 = document.createElement("a");
    menu_li1_div_a2.href = "#";
    menu_li1_div_a2.id = "profile-dropdown";
    menu_li1_div_a2.setAttribute("data-toggle", "dropdown");
    //nav > ul > li > div > a > i
    let menu_li1_div_a2_i = document.createElement("i");
    menu_li1_div_a2_i.className = "mdi mdi-dots-vertical";
    menu_li1_div_a2.appendChild(menu_li1_div_a2_i);
    menu_li1_div.appendChild(menu_li1_div_a2);
    //드롭다운 ... 끝
    //드롭다운 메뉴
    //nav > ul > li > div > div
    let menu_li1_div_div = document.createElement("div");
    menu_li1_div_div.className = "dropdown-menu dropdown-menu-right sidebar-dropdown preview-list";
    menu_li1_div_div.setAttribute("aria-labelledby", "profile-dropdown");
    //nav > ul > li > div > div > a
    let menu_li1_div_div_a = document.createElement("a");
    menu_li1_div_div_a.href = "#";
    menu_li1_div_div_a.className = "dropdown-item preview-item";
    //nav > ul > li > div > div > a > div
    let menu_li1_div_div_a_div = document.createElement("div");
    menu_li1_div_div_a_div.className = "preview-thumbnail";
    //nav > ul > li > div > div > a > div > div
    let menu_li1_div_div_a_div_div = document.createElement("div");
    menu_li1_div_div_a_div_div.className = "preview-icon bg-dark rounded-circle";
    //nav > ul > li > div > div > a > div > div > i
    let menu_li1_div_div_a_div_div_i = document.createElement("i");
    menu_li1_div_div_a_div_div_i.className = "mdi mdi-settings text-primary"
    //nav > ul > li > div > div > a > div
    let menu_li1_div_div_a_div2 = document.createElement("div");
    menu_li1_div_div_a_div2.className = "preview-item-content";
    //nav > ul > li > div > div > a > div > p
    let menu_li1_div_div_a_div2_p = document.createElement("p");
    menu_li1_div_div_a_div2_p.className = "preview-subject ellipsis mb-1 text-small";
    menu_li1_div_div_a_div2_p.innerText = "Account settings";
    // endline
    //nav > ul > li > div > div > div
    let menu_li1_div_div_div = document.createElement("div");
    menu_li1_div_div_div.className = "dropdown-divider";

    menu_li1_div_div_a_div_div.appendChild(menu_li1_div_div_a_div_div_i);
    menu_li1_div_div_a_div.appendChild(menu_li1_div_div_a_div_div);
    menu_li1_div_div_a_div2.appendChild(menu_li1_div_div_a_div2_p);
    menu_li1_div_div_a.appendChild(menu_li1_div_div_a_div);
    menu_li1_div_div_a.appendChild(menu_li1_div_div_a_div2);
    menu_li1_div_div.appendChild(menu_li1_div_div_a);
    menu_li1_div.appendChild(menu_li1_div_div);
    menu_li1.appendChild(menu_li1_div);
    menu_list.appendChild(menu_li1);
    //드롭다운 메뉴 끝
    //프로필 끝
    //메뉴
    let menu_li2 = makeMenuLi(GV_path, "settings/settings_addHash", "mdi mdi-folder", "해쉬 추가");
    let menu_li3 = makeMenuLi(GV_path, "settings/settings_updateProfile", "mdi mdi-drupal", "프로필 수정");
    let menu_li4 = makeMenuLi(GV_path, "settings/settings_requestInfluencer", "mdi mdi-glasses", "인플루언서 신청");
    let menu_li5 = makeMenuLi(GV_path, "settings/settings_updateGrade", "mdi mdi-lock-open", "공개범위 변경");
    menu_list.appendChild(menu_li2);
    menu_list.appendChild(menu_li3);
    menu_list.appendChild(menu_li4);
    menu_list.appendChild(menu_li5);
    //메뉴 끝
    left_nav.appendChild(logo_div);
    // left_nav.appendChild(div);
    left_nav.appendChild(menu_list); //ul
    return left_nav;
}

function makeToggleMenuLi(icon_name, menu_name, id, tog_nameArr, tog_iconArr, tog_pathArr){
    //nav > ul > li
    let menu_li = document.createElement("li");
    menu_li.className = "nav-item menu-items";
    //nav > ul > li > a
    let menu_li_a = document.createElement("a");
    menu_li_a.className = "nav-link";
    menu_li_a.href = "#"+id;
    menu_li_a.setAttribute("data-toggle", "collapse");
    menu_li_a.setAttribute("aria-expanded", "false");
    menu_li_a.setAttribute("aria-controls", id);
    //nav > ul > li > a > span
    let menu_li_a_span = document.createElement("span");
    menu_li_a_span.className = "menu-icon";
    //nav > ul > li > a > span > i
    let menu_li_a_span_i = document.createElement("i");
    menu_li_a_span_i.className = icon_name;
    //nav > ul > li > a > span
    let menu_li_a_span2 = document.createElement("span");
    menu_li_a_span2.className = "menu-title";
    menu_li_a_span2.innerText = menu_name;
    //nav > ul > li > a > i
    let menu_li_a_i = document.createElement("i");
    menu_li_a_i.className = "menu-arrow";
    //nav > ul > li > div
    let menu_li_div = document.createElement("div");
    menu_li_div.className = "collapse";
    menu_li_div.id = id;
    //nav > ul > li > div > ul
    let menu_li_div_ul = document.createElement("ul");
    menu_li_div_ul.className = "nav flex-column sub-menu";
    //nav > ul > li > div > ul > li
    
    for(var i = 0; i < tog_nameArr.length; i++){
        let menu_li_div_ul_li = document.createElement("li");
        menu_li_div_ul_li.className = "nav-item";
        let menu_li_div_ul_li_a = document.createElement("a");
        menu_li_div_ul_li_a.className = "nav-link";
        menu_li_div_ul_li_a.href = tog_pathArr[i];
        let menu_li_div_ul_li_a_span = document.createElement("span");
        menu_li_div_ul_li_a_span.className = "menu-icon";
        let menu_li_div_ul_li_a_span_i = document.createElement("i");
        menu_li_div_ul_li_a_span_i.className = tog_iconArr[i];
        let menu_li_div_ul_li_a_span2 = document.createElement("span");
        menu_li_div_ul_li_a_span2.innerText = tog_nameArr[i];
        menu_li_div_ul_li_a_span.appendChild(menu_li_div_ul_li_a_span_i);
        menu_li_div_ul_li_a.appendChild(menu_li_div_ul_li_a_span);
        menu_li_div_ul_li_a.appendChild(menu_li_div_ul_li_a_span2);
        menu_li_div_ul_li.appendChild(menu_li_div_ul_li_a);
        menu_li_div_ul.appendChild(menu_li_div_ul_li);
    }
    menu_li_a_span.appendChild(menu_li_a_span_i);
    menu_li_a.appendChild(menu_li_a_span);
    menu_li_a.appendChild(menu_li_a_span2);
    menu_li_a.appendChild(menu_li_a_i);
    menu_li_div.appendChild(menu_li_div_ul);

    menu_li.appendChild(menu_li_a);
    menu_li.appendChild(menu_li_div);
    return menu_li;
}

function makeMenuLi(path, link_path, icon_name, menu_name){
    
    //nav > ul > li
    let menu_li = document.createElement("li");
    menu_li.className = "nav-item menu-items";
    //nav > ul > li > a
    let menu_li_a = document.createElement("a");
    menu_li_a.className = "nav-link";
    menu_li_a.href = path+"/"+link_path;
    //nav > ul > li > a > span
    let menu_li_a_span = document.createElement("span");
    menu_li_a_span.className = "menu-icon";
    //nav > ul > li > a > span > i
    let menu_li_a_span_i = document.createElement("i");
    menu_li_a_span_i.className = icon_name;
    //nav > ul > li > a > span
    let menu_li_a_span2 = document.createElement("span");
    menu_li_a_span2.className = "menu-title";
    menu_li_a_span2.innerText = menu_name;
    menu_li_a_span.appendChild(menu_li_a_span_i);
    menu_li_a.appendChild(menu_li_a_span);
    menu_li_a.appendChild(menu_li_a_span2);

    menu_li.appendChild(menu_li_a);
    return menu_li;
}

function makeTopNavBar(){
    let topNav = document.createElement("nav");
    topNav.className = "navbar p-0 fixed-top d-flex flex-row";
    //미니로고
    //nav > div
    let logo = document.createElement("div");
    logo.className = "navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center";
    //nav > div > a
    let logo_a = document.createElement("a");
    logo_a.className = "navbar-brand brand-logo-mini";
    logo_a.href = GV_path+"/main/";
    //nav > div > a > img
    let logo_a_img = document.createElement("img");
    logo_a_img.src = GV_path+"/assets/images/logo-mini.svg";
    logo_a_img.alt = "logo";
    logo_a.appendChild(logo_a_img);
    logo.appendChild(logo_a);
    //미니로고 끝
    //nav > div
    let topNav_div = document.createElement("div");
    topNav_div.className = "navbar-menu-wrapper flex-grow d-flex align-items-stretch";
    //네비바 토글
    //nav > div > btn
    let topNav_div_btn = document.createElement("button");
    topNav_div_btn.className = "navbar-toggler navbar-toggler align-self-center";
    topNav_div_btn.type = "button";
    topNav_div_btn.setAttribute("data-toggle", "minimize");
    //nav > div > btn > span
    let topNav_div_btn_span = document.createElement("span");
    topNav_div_btn_span.className = "mdi mdi-menu";
    topNav_div_btn.appendChild(topNav_div_btn_span);
    topNav_div.appendChild(topNav_div_btn);
    //네비바 토글 끝
    //아이콘
    //nav > div > ul
    let iconList = document.createElement("ul");
    iconList.className = "navbar-nav navbar-nav-right";
    //nav > div > ul > li
    // let iconList_li1 = document.createElement("li");
    let iconList_li1_a_span = iconSpan("alarm_state");
    iconList_li1 = createIcon("alarmDropdown", "alarm", "알림", "mdi mdi-bell", iconList_li1_a_span);
    iconList_li1.className = "nav-item dropdown border-left";
    iconList_li1.id = "isalarm";
    
    let iconList_li2 = document.createElement("li");
    iconList_li2.className = "nav-item dropdown";
    //상단 프로필
    let iconList_li2_a = document.createElement("a");
    iconList_li2_a.className = "nav-link";
    iconList_li2_a.id = "profileDropdown";
    iconList_li2_a.href = "#";
    iconList_li2_a.setAttribute("data-toggle", "dropdown");
    let iconList_li2_a_div = document.createElement("div");
    iconList_li2_a_div.className = "navbar-profile";
    let iconList_li2_a_div_img = document.createElement("img");
    iconList_li2_a_div_img.className = "img-xs rounded-circle";
    iconList_li2_a_div_img.src = GV_path+"/resources/TripToLive/default/default.jpg";
    iconList_li2_a_div_img.alt = "noImg"
    let iconList_li2_a_div_p = document.createElement("p");
    iconList_li2_a_div_p.className = "mb-0 d-none d-sm-block navbar-profile-name";
    iconList_li2_a_div_p.innerText = GV_sess_name;
    let iconList_li2_a_div_i = document.createElement("i");
    iconList_li2_a_div_i.className = "mdi mdi-menu-down d-none d-sm-block";
    //상단 프로필 드랍메뉴
    let iconList_li2_div = document.createElement("div");
    iconList_li2_div.className = "dropdown-menu dropdown-menu-right navbar-dropdown preview-list";
    iconList_li2_div.setAttribute("aria-labelledby", "profileDropdown");
    let iconList_li2_div_h6 = document.createElement("h6");
    iconList_li2_div_h6.className = "p-3 mb-0";
    iconList_li2_div_h6.innerText = "Profile";

    let iconList_li2_div_div = document.createElement("div");
    iconList_li2_div_div.className = "dropdown-divider";

    let iconList_li2_div_a = document.createElement("a");
    iconList_li2_div_a.className = "dropdown-item preview-item";
    iconList_li2_div_a.href = GV_path+"/settings/";
    let iconList_li2_div_a_div = document.createElement("div");
    iconList_li2_div_a_div.className = "preview-thumbnail";
    let iconList_li2_div_a_div_div = document.createElement("div");
    iconList_li2_div_a_div_div.className = "preview-icon bg-dark rounded-circle";
    let iconList_li2_div_a_div_div_i = document.createElement("i");
    iconList_li2_div_a_div_div_i.className = "mdi mdi-settings text-success";
    let iconList_li2_div_a_div2 = document.createElement("div");
    iconList_li2_div_a_div2.className = "preview-item-content";
    let iconList_li2_div_a_div2_p = document.createElement("p");
    iconList_li2_div_a_div2_p.className = "preview-subject mb-1";
    iconList_li2_div_a_div2_p.innerText = "Settings";

    let iconList_li2_div_div2 = document.createElement("div");
    iconList_li2_div_div2.className = "dropdown-divider";

    let iconList_li2_div_a2 = document.createElement("a");
    iconList_li2_div_a2.className = "dropdown-item preview-item"
    iconList_li2_div_a2.href = GV_path+"/auth/logout";
    let iconList_li2_div_a2_div = document.createElement("div");
    iconList_li2_div_a2_div.className = "preview-thumbnail";
    let iconList_li2_div_a2_div_div = document.createElement("div");
    iconList_li2_div_a2_div_div.className = "preview-icon bg-dark rounded-circle";
    let iconList_li2_div_a2_div_div_i = document.createElement("i");
    iconList_li2_div_a2_div_div_i.className = "mdi mdi-logout text-danger";
    let iconList_li2_div_a2_div2 = document.createElement("div");
    iconList_li2_div_a2_div2.className = "preview-item-content";
    let iconList_li2_div_a2_div2_p = document.createElement("p");
    iconList_li2_div_a2_div2_p.innerText = "로그아웃";
    let iconList_li2_div_div3 = document.createElement("div");
    iconList_li2_div_div3.className = "dropdown-divider";
    let iconList_li2_div_p = document.createElement("p");
    iconList_li2_div_p.innerText = "Profile Menu";

    iconList_li2_a_div.appendChild(iconList_li2_a_div_img);
    iconList_li2_a_div.appendChild(iconList_li2_a_div_p);
    iconList_li2_a_div.appendChild(iconList_li2_a_div_i);
    iconList_li2_a.appendChild(iconList_li2_a_div);

    iconList_li2_div_a.appendChild(iconList_li2_div_a_div);
    iconList_li2_div_a.appendChild(iconList_li2_div_a_div_div);
    iconList_li2_div_a.appendChild(iconList_li2_div_a_div_div_i);
    iconList_li2_div_a.appendChild(iconList_li2_div_a_div2);
    iconList_li2_div_a.appendChild(iconList_li2_div_a_div2_p);

    iconList_li2_div_a2.appendChild(iconList_li2_div_a2_div);
    iconList_li2_div_a2.appendChild(iconList_li2_div_a2_div_div);
    iconList_li2_div_a2.appendChild(iconList_li2_div_a2_div_div_i);
    iconList_li2_div_a2_div2.appendChild(iconList_li2_div_a2_div2_p);
    iconList_li2_div_a2.appendChild(iconList_li2_div_a2_div2);

    iconList_li2_div.appendChild(iconList_li2_div_h6);
    iconList_li2_div.appendChild(iconList_li2_div_div);
    iconList_li2_div.appendChild(iconList_li2_div_a);
    iconList_li2_div.appendChild(iconList_li2_div_div2);
    iconList_li2_div.appendChild(iconList_li2_div_a2);
    iconList_li2_div.appendChild(iconList_li2_div_div3);
    iconList_li2_div.appendChild(iconList_li2_div_p);

    iconList_li2.appendChild(iconList_li2_a);
    iconList_li2.appendChild(iconList_li2_div);
    //상단 프로필 드랍메뉴 끝
    //상단 프로필 끝
    let topNav_div_btn2 = document.createElement("button");
    topNav_div_btn2.className = "navbar-toggler navbar-toggler-right d-lg-none align-self-center";
    topNav_div_btn2.type = "button";
    topNav_div_btn2.setAttribute("data-toggle", "offcanvas");
    let topNav_div_btn2_span = document.createElement("span");
    topNav_div_btn2_span.className = "mdi mdi-format-line-spacing";
    topNav_div_btn2.appendChild(topNav_div_btn2_span);

    
    iconList.appendChild(iconList_li1);
    iconList.appendChild(iconList_li2);

    topNav_div.appendChild(topNav_div_btn);
    topNav_div.appendChild(iconList);
    topNav_div.appendChild(topNav_div_btn2);
    //아이콘 끝
    topNav.appendChild(logo);
    topNav.appendChild(topNav_div);
    return topNav;
}


function alarmAjax(path, sess_id) {
    let data = {
        user_id : sess_id
    };
    $.ajax({//json
        url : path+"/user/alarm",
        async : true,
        contentType : "application/json;charset=UTF-8",
        data : data,
        method : "GET",
        dataType : "JSON",
        success : function(data, textStatus, jqXHR) {
            console.log(data);
            printAlarm(data);
        },
        error : function(jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        }
    })
}

function make(alarm_no, is_open, img, b_no, msg){
    // 열람 여부에 따라 스타일 변경
    let alarm = document.getElementById("alarm");

    var div_divider = document.createElement("div"); div_divider.className = "dropdown-divider";
    alarm.appendChild(div_divider);
    // --------------------------------------------------------------
    
    var a_drop = document.createElement("a"); 
    a_drop.href = GV_path+"/menu/alarm?alarm_no="+alarm_no+"&b_no="+b_no;
    a_drop.classList.add("dropdown-item");
    a_drop.classList.add("preview-item");

    var div_thumb = document.createElement("div"); 
    div_thumb.className = "preview-thumbnail";
    var prf_img = document.createElement("img");
    prf_img.className = "rounded-circle profile-pic"; 
    prf_img.src = GV_path+img;

    div_thumb.appendChild(prf_img);
    a_drop.appendChild(div_thumb);
    //----------------------------------------------------
    var div_content = document.createElement("div"); 
    div_content.className = "preview-item-content";
    var p_text = document.createElement("p"); 
    p_text.innerText = msg //메세지 입력!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    if(is_open == 1){
        console.log("읽었음 : "+ alarm_no);
        //#13151b
        a_drop.style.backgroundColor = '#13151b';
        p_text.style.color = "#e6e9ed";
    }
    div_content.appendChild(p_text);
    a_drop.appendChild(div_content);
    alarm.appendChild(a_drop);
    // console.log(alarm);
}

function printAlarm(userList){
    // let isOpen = document.getElementById("isalarm");

    let alarm = document.getElementById("alarm");
    // removeAlarm(alarm);
    for(var i = 0; i < userList.length; i++){
        make(userList[i].alarm_no, userList[i].is_open, userList[i].profile_img, userList[i].b_no,userList[i].msg);
    }
}

function removeAlarm(alarm){
    console.log("remove");
    for(var i = alarm.childElementCount-1; i > 1; i--){
        alarm.removeChild(alarm.children[i]);
    }
}
// 빨간 동그라미는 jsp에서 onload 시 alarmStateChange호출
function iconSpan(id){//, text
    let iconList_li1_a_span = document.createElement("span");
    iconList_li1_a_span.classList.add("count");
    iconList_li1_a_span.id = id;//"alarm_state";
    // iconList_li1_a_span.style.backgroundColor = color;
    // if(text != null || text != undefined){
        
    // }
    return iconList_li1_a_span;
}
function createIcon(a_id, drop_id, banner_name, icon, span){
    let iconList_li = document.createElement("li");
    let iconList_li_a = document.createElement("a");
    iconList_li_a.className = "nav-link count-indicator dropdown-toggle";
    iconList_li_a.id = a_id; //"notificationDropdown";
    iconList_li_a.href = "#";
    iconList_li_a.setAttribute("data-toggle", "dropdown");
    // iconList_li_a.onclick = alarmAjax(path, sess_id);
    let iconList_li_a_i = document.createElement("i");
    iconList_li_a_i.className = icon;//"mdi mdi-bell";   
    
    let iconList_li_div = document.createElement("div");
    iconList_li_div.className = "dropdown-menu dropdown-menu-right navbar-dropdown preview-list"
    iconList_li_div.setAttribute("aria-labelledby", a_id);//"notificationDropdown"
    iconList_li_div.id = drop_id;//"alarm";
    let iconList_li_div_h6 = document.createElement("h6");
    iconList_li_div_h6.className = "p-3 mb-0";
    iconList_li_div_h6.innerText = banner_name;//"알림";
    let iconList_li_div_div = document.createElement("div");
    iconList_li_div_div.className = "dropdown-divider";

    iconList_li_a.appendChild(iconList_li_a_i);
    iconList_li_a.appendChild(span);//iconList_li1_a_span
    iconList_li_div.appendChild(iconList_li_div_h6);
    iconList_li_div.appendChild(iconList_li_div_div);
    iconList_li.appendChild(iconList_li_a);
    iconList_li.appendChild(iconList_li_div);
    return iconList_li;
}

function alarmStateChange(){
    let alarm_span = document.getElementById("alarm_state");
    alarm_span.classList.toggle("bg-danger");
}

function alarmIsOpenAjax(path, sess_id) {
    let data = {
        user_id : sess_id
    };
    $.ajax({//json
        url : path+"/user/is-alarm",
        async : true,
        contentType : "application/json;charset=UTF-8",
        data : data,
        method : "GET",
        dataType : "JSON",
        success : function(data, textStatus, jqXHR) {
            console.log("알람 체크 "+data);
            if(data)
            {
                alarmStateChange();
            }
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
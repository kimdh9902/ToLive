function init(path, sess_id, sess_name){
	let base = document.getElementById("container-scroller");
    let left_nav = makeLeftSlideBar(path, sess_id, sess_name);
    let topNav = makeTopNavBar(path);
    if (base.firstChild) {
        base.insertBefore(left_nav, base.firstChild); //첫번째 자식의 이전에다가 append 하겠다
      } else {
        base.appendChild(left_nav);
      }
}

function makeLeftSlideBar(path, sess_id, sess_name){
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
    logo_a.href = path+"/main/";
    logo_a.innerText = "TriptoLive";
    // nav div > a
    let logo_a2 = document.createElement("a");
    logo_a2.className = "sidebar-brand brand-logo-mini";
    logo_a2.href = path+"/main/";
    // nav div > a > img
    let logo_a2_img = document.createElement("img");
    logo_a2_img.src = path+"/assets/images/logo-mini.svg";
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
    menu_li1_div_a.href = path+"/menu/profile?user_id="+sess_id;
    //nav > ul > li > div > a > div
    let menu_li1_div_a_div = document.createElement("div");
    menu_li1_div_a_div.className = "profile-pic";
    //nav > ul > li > div > a > div > div
    let menu_li1_div_a_div_div = document.createElement("div");
    menu_li1_div_a_div_div.className = "count-indicator";
    //nav > ul > li > div > a > div > div > img
    let menu_li1_div_a_div_div_img = document.createElement("img");
    menu_li1_div_a_div_div_img.className = "img-xs rounded-circle";
    menu_li1_div_a_div_div_img.src = path+"/resources/TripToLive/default/default.jpg";
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
    menu_li1_div_a_div_div2_h5.innerText = sess_name;
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
    let menu_li2 = makeMenuLi(path, "mdi mdi-airballoon", "여행 후기글");
    let menu_li3 = makeMenuLi(path, "mdi mdi-airballoon", "파티 찾기");
    let menu_li4 = makeMenuLi(path, "mdi mdi-airballoon", "명예의 전당");
    let toggle_menu_name = new Array();
    toggle_menu_name.push("유저 검색");
    toggle_menu_name.push("친구 목록");
    let toggle_menu_icon = new Array();
    toggle_menu_icon.push("mdi mdi-account-multiple-plus");
    toggle_menu_icon.push("mdi mdi-folder-account");
    let toggle_menu_path = new Array();
    toggle_menu_path.push(path+"/menu/findUser");
    toggle_menu_path.push(path+"/menu/friendList");
    let menu_li5 = makeToggleMenuLi("mdi mdi-account-multiple-outline", "친구", "friend" ,toggle_menu_name, toggle_menu_icon, toggle_menu_path);
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

function makeMenuLi(path, icon_name, menu_name){
    
    //nav > ul > li
    let menu_li = document.createElement("li");
    menu_li.className = "nav-item menu-items";
    //nav > ul > li > a
    let menu_li_a = document.createElement("a");
    menu_li_a.className = "nav-link";
    menu_li_a.href = path+"/main/";
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

function makeTopNavBar(path){
    let topNav = document.createElement("nav");
    topNav.className = "navbar p-0 fixed-top d-flex flex-row";
    //nav > div
    //미니로고
    let logo = document.createElement("div");
    logo.className = "navbar-brand-wrapper d-flex d-lg-none align-items-center justify-content-center";
    let logo_a = document.createElement("a");
    logo_a.className = "navbar-brand brand-logo-mini";
    logo_a.href = path+"/main/";
    let logo_a_img = document.createElement("img");
    logo_a_img.src = path+"/assets/images/logo-mini.svg";
    logo_a_img.alt = "logo";
    logo_a.appendChild(logo_a_img);
    logo.appendChild(logo_a);
    //미니로고 끝
    
    let topNav_div = document.createElement("div");
    topNav_div.className = "navbar-menu-wrapper flex-grow d-flex align-items-stretch";
    //네비바 토글
    let topNav_div_btn = document.createElement("button");
    topNav_div_btn.className = "navbar-toggler navbar-toggler align-self-center";
    topNav_div_btn.type = "button";
    topNav_div_btn.setAttribute("data-toggle", "minimize");
    let topNav_div_btn_span = document.createElement("span");
    topNav_div_btn_span.className = "mdi mdi-menu";
    topNav_div_btn.appendChild(topNav_div_btn_span);
    topNav_div.appendChild(topNav_div_btn);
    //네비바 토글 끝
    
    //아이콘
    
    //아이콘 끝
    topNav.appendChild(topNav_div);
    topNav.appendChild(logo);

}
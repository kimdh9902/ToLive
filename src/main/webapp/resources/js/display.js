function init(path, sess_id, sess_name){
	
    makeLeftSlideBar(path);
}

function makeLeftSlideBar(path, sess_id, sess_name){
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
    logo_a_a.className = "sidebar-brand brand-logo-mini";
    logo_a_a.href = path+"/main/";
    // nav div > a > img
    let logo_a2_img = document.createElement("img");
    logo_a2_img.src = path+"/assets/images/logo-mini.svg";
    logo_a2_img.alt = "logo";
    logo_div.appendChild(logo_a);
    logo_a2.appendChild(logo_a2_img);
    logo_div.appendChild(logo_a2);
    left_nav.appendChild(logo_div);

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
    //드롭다운 메뉴 끝
}

function makeTopNavBar(){

}
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>친구 검색</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"
	integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
	crossorigin="anonymous"></script>
    
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
        <script src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>
        <!-- End custom js for this page -->
<script type="text/javascript">
	/* function ajaxCall() {
		console.log("test");
	} */
	// class Table{
    //     table
    //     tr
    //     th
    //     td
    //     constructor(id){
    //         this.table = document.createElement("table");
    //         this.table.className = "table-dark";
    //         this.table.id = id;
    //         // this.table.className = "table_st"
    //     }
    //     openTr(){
    //         this.tr = document.createElement("tr");
    //     }
    //     closeTr(){
    //         this.table.appendChild(this.tr);
    //         this.tr = undefined;
    //     }
    //     insertTh(data){
    //         this.th = document.createElement("th");
    //         this.th.append(data);
    //         this.tr.append(this.th);
    //     }
    //     insertTd(data){
    //         this.td = document.createElement("td");
    //         this.td.append(data);
    //         this.tr.append(this.td);
    //     }
    //     end(){
	// 		var result_table = document.getElementById("print");
	// 		if(result_table.childElementCount >= 1)
	// 			result_table.removeChild(result_table.children[0]);
    //     	document.getElementById("print").appendChild(this.table);
    //     }
    // }

	function ajaxCall_search(){
		var inpBox = document.getElementById("user");
			console.log(typeof inpBox.value);
            let data =  { user: inpBox.value};
            console.log("data"+JSON.stringify(data));
            $.ajax(
                {//json
                url: "${pageContext.request.contextPath}" +"/menu/search",
                async:true,
                contentType:"application/json;charset=UTF-8",
                data: JSON.stringify(data),
                method:"POST",
                dataType:"JSON",
                success:function(data, textStatus, jqXHR)
                {
                	console.log(data);
                	searchUser(data);
					/* console.log("data:" + data.jsonList); */
					/* var userList = JSON.parse(data); */
					/* console.log("uL"+userList); */
					
                },
                error:function(jqXHR, textStatus, errorThrown ){
                    console.log(jqXHR);
                    console.log(textStatus);
                    console.log(errorThrown);
                }
                }
            )
        }
	
	function searchUser(userList){
        deleteUser();
        const path = "${pageContext.servletContext.contextPath}";
        let print_div = document.getElementById("print");
        for(var i = 0; i < userList.length; i++){
            let a = document.createElement("a");
            a.href = path+"/menu/profile?user_id="+userList[i].user_id;

            let a_div = document.createElement("div");
            a_div.style.display = "flex";
            a_div.style.width = "100%";
            a_div.style.height = "100px";
            a_div.style.border = "1px white solid";
            a_div.style.padding = "10px 10px 10px 10px";

            let a_div_span = document.createElement("span");
            let a_div_span_img = document.createElement("img");
            a_div_span_img.src = path+userList[i].profile_img;
            a_div_span_img.style.width = "80px";
            a_div_span_img.style.height = "100%";
            a_div_span_img.style.marginRight = "20px";

            let a_div_p = document.createElement("p");
            a_div_p.style.width = "80%";
            a_div_p.style.height = "100%";

            let div_p_span = document.createElement("span");
            div_p_span.innerText = userList[i].user_id;
            div_p_span.style.color = "white";
            div_p_span.style.marginLeft = "10%";

            let div_p_span2 = document.createElement("span");
            div_p_span2.innerText = userList[i].user_name;
            div_p_span2.style.color = "white";
            div_p_span2.style.marginLeft = "20%";

            a_div_span.appendChild(a_div_span_img);
            a_div.appendChild(a_div_span);

            a_div_span.appendChild(a_div_span_img);
            a_div_p.appendChild(div_p_span);
            a_div_p.appendChild(div_p_span2);

            a_div.appendChild(a_div_span);
            a_div.appendChild(a_div_p);
            
            a.appendChild(a_div);
    
            print_div.appendChild(a);
        }
		// var tab = new Table("table");
		// tab.openTr();
		// /* tab.insertTh("아이디"); */
		// tab.insertTh("이름");
		// tab.closeTr();
		// printFriend(tab, userList);
		// tab.end();
	}

    function deleteUser(){
        let printDiv = document.getElementById("print");
        console.log(printDiv.children[0]);
        console.log(printDiv.firstElementChild);
        while(printDiv.firstElementChild != null){
            printDiv.children[0].remove();
        }
    }

    window.onload = function(){
		init("${ pageContext.servletContext.contextPath}", "${sessionScope.SESS_ID}", "${sessionScope.SESS_NAME}");
	}
    </script>
</head>
<body>
	<div class="container-scroller" id="container-scroller">
		<div class="container-fluid page-body-wrapper" id="container-body-wrapper">
			<div class="main-panel">
				<!-- 컨텐츠 간격 컨테이너 -->
				<div class="content-wrapper">
					<!-- 실제 컨텐츠 박스 -->
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body" style="height: 80px; position: relative; display: flex; align-items: center;">
									<div class="form-group" style="position: absolute; top: 25%; left: 42%; transform: translate(-20%, -20%);">
										<label for="user_search" style="color: white;">검색할ID
											또는 이름</label><br> <input type="text" id="user" name="user"
											style="margin-right: 40px; width: 180px" height="30px">
										<input class="btn btn-light btn-rounded"
											style="margin-left: 10px; width: 150px;" type="submit"
											value="검색" onclick="ajaxCall_search()">
									</div>
								</div>
                                <div class="card-footer" id="print">
									
                                </div>
							</div>
						</div>
					</div>
					<!-- 컨텐츠 박스 끝 -->
				</div>
				<!-- 컨텐츠 컨테이너 끝-->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted d-block text-center text-sm-left d-sm-inline-block">3조
							프로젝트</span>
						<!-- <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin templates</a> from Bootstrapdash.com</span> -->
					</div>
				</footer>
			</div>
			<!-- 메인 패널 끝 -->
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>명예의 전당</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</script>
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
<script src="${ pageContext.servletContext.contextPath }/resources/js/display.js"></script>
<script>
   class Table{
        tr
        tbody
        th
        td
        constructor(id){
            this.tbody = document.createElement("tbody");
            this.tbody.id = id == undefined ? "tbody": id;
        }
        getTr(){
            return this.tr;
        }
        openTr(){
            this.tr = document.createElement("tr");
        }
        closeTr(){
            this.tbody.appendChild(this.tr);
            this.tr = undefined;
        }
        insertTh(data){
            this.th = document.createElement("th");
            this.th.append(data);
            this.tr.append(this.th);
        }
        insertTd(data){
            this.td = document.createElement("td");
            this.td.append(data);
            this.tr.append(this.td);
        }
        insertTdLink(data){
              var a = document.createElement("a");
            a.href = "";
            this.td = document.createElement("td");
            this.td.append(data);
            a.appendChild(this.td);
            this.tr.append(a);
        }
        end(){
         var result_table = document.getElementById("starBoard");
           result_table.appendChild(this.tbody);
        }
    }

   class StarBoardVO{
      // int b_no;
      // String title;
      // String user_id;
      // int views;
      b_no;
      title;
      user_id;
      views;
      getB_no() {
      return this.b_no;
      }
      setB_no(b_no) {
         this.b_no = b_no;
      }
      getTitle() {
         return this.title;
      }
      setTitle(title) {
         this.title = title;
      }
      getUser_id() {
         return this.user_id;
      }
       setUser_id(user_id) {
         this.user_id = user_id;
      }
      getViews() {
         return this.views;
      }
      setViews(views) {
         this.views = views;
      }
   }
   window.onload = function(){
	   init("${ pageContext.servletContext.contextPath}", "${sessionScope.SESS_ID}", "${sessionScope.SESS_NAME}");
      /* const params = new URLSearchParams(window.location.search);
      const list = params.get("list");
      const parsedString = list.split(',').slice(1);
      
      parsedString[0] = parsedString[0].substr(1, parsedString[0].length);
      parsedString[parsedString.length -1] = parsedString[parsedString.length -1].substr(0, parsedString[parsedString.length -1].length-1);
      const sb_list = new Array();
      const table = new Table();
      
      for(var i = 0; i < (parsedString.length / 4); i++)
      {
         var indx = 4 * i;
         var vo = new StarBoardVO();
         vo.setB_no((parsedString[indx].split('='))[1]);
         vo.setTitle((parsedString[indx + 1].split('='))[1]);
         vo.setUser_id((parsedString[indx + 2].split('='))[1]);
         vo.setViews((parsedString[indx + 3].split('='))[1]);
         sb_list.push(vo);
      }
      console.log(sb_list[0]);
      console.log(sb_list[0].getB_no());
      console.log(sb_list[1]);
      for(var i = 0; i < sb_list.length; i++)
      {
         table.openTr();
         table.insertTd(sb_list[i].getB_no());
         table.insertTdLink(sb_list[i].getTitle());
         table.insertTd(sb_list[i].getUser_id());
         table.insertTd(sb_list[i].getViews());
         table.closeTr();
      }
      table.end(); */
   }

   /* const list = params.get("list");
   console.log(list); */
   
</script>
</head>
<body>
	<div class="container-scroller" id="container-scroller">
		<div class="container-fluid page-body-wrapper" id="container-body-wrapper">
			<div class="main-panel" style="overflow: hidden; height: 1200px">
				<!-- 컨텐츠 간격 컨테이너 -->
				<div class="content-wrapper">
					<!-- 실제 컨텐츠 박스 -->
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<table id="starBoard" class="table" style="width: 100%;">
										<thead>
											<tr>
												<th>글 번호</th>
												<th>제목</th>
												<th>아이디</th>
												<th>조회수</th>
											</tr>
										</thead>

									</table>
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
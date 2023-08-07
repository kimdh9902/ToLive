<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>관리자 페이지 - 이용현황(메인)</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
   integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
   crossorigin="anonymous">
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- plugins:css -->
<link rel="stylesheet"
   href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
   href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
   href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap.css">
<link rel="stylesheet"
   href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet"
   href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.carousel.min.css">
<link rel="stylesheet"
   href="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.theme.default.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet"
   href="${ pageContext.servletContext.contextPath }/resources/assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon"
   href="${ pageContext.servletContext.contextPath }/resources/assets/images/favicon.png" />
<!-- plugins:js -->
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/chart.js/Chart.min.js"></script>
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/progressbar.js/progressbar.min.js"></script>
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap.min.js"></script>
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/vendors/owl-carousel-2/owl.carousel.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/js/off-canvas.js"></script>
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/js/hoverable-collapse.js"></script>
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/js/misc.js"></script>
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/js/settings.js"></script>
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script
   src="${ pageContext.servletContext.contextPath }/resources/assets/js/dashboard.js"></script>
<!-- End custom js for this page -->
<script
   src="${ pageContext.servletContext.contextPath }/resources/js/displayAdmin.js"></script>
<script>
   window.onload = function() {
      init(
            "${pageContext.request.servletContext.contextPath }",
            "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.id}",
            "${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}",
            "${_csrf.headerName}", "${_csrf.token}");
      displayNotice('${noticeVO.notice_contents}');
   }
</script>
</head>

<body>
   <div class="container-scroller" id="container-scroller">
      <div class="container-fluid page-body-wrapper"
         id="container-body-wrapper">
         <div class="main-panel">
            <div id="noticeContainer"></div>
            <div class="content-wrapper">
               <div class="row">
                  <div class="col-12 grid-margin">
                     <div class="card">
                        <div class="card-body">
                          <!-- 차트 -->
                          <div class="chart-box">
                          	<div id="line_chart">
                          	</div>
                       	  </div> <!-- chart end -->
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <footer class="footer">
               <div
                  class="d-sm-flex justify-content-center justify-content-sm-between">
                  <span
                     class="text-muted d-block text-center text-sm-left d-sm-inline-block">
                     3조 프로젝트 </span>
               </div>
            </footer>
         </div>
      </div>
   </div>
<script>
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);

//차트 생성
function drawChart() {
  const originalData = new google.visualization.arrayToDataTable([
      ['Year', '이용자', 'influencer*10','게시글 수/10'],
      ['4월', 500, 280, 237],
      ['5월', 643, 320, 310],
      ['6월', 573, 330, 382],
      ['7월', 704, 350, 341],
      ['8월', 798, 420, 397]
    ]);

  let data = originalData.clone();
    
  let options = {
    title: 'TripToLive 이용 현황 - Google Chart',
    pointSize: 15,
    width : 850,
    height : 500,
    titleTextStyle: { color: 'black' },
    hAxis: {
        textStyle: { fontSize: 15, color: 'black' },
        baselineColor: 'black'
    },
    vAxis: {
        title: '',
        ticks: [0, 250, 500, 750, 1000],
        format: '#,###',
    },
    legend: {
      textStyle: { position: 'top', fontSize: 13, color: 'black' },
    },
    series: {
        0: { color: '#F0A57C', lineWidth: 2, visibleInLegend: true },
        1: { color: '#91FFC3', lineWidth: 2, visibleInLegend: true },
        2: { color: '#87cefa', lineWidth: 2, visibleInLegend: true }
    }
  };

  let chart = new google.visualization.LineChart(document.getElementById('line_chart'));

  // 이벤트 리스너 추가
  google.visualization.events.addListener(chart, 'click', function(target) {
    if (target.targetID.match(/legendentry#\d+/)) {
      let index = parseInt(target.targetID.slice(12));
  
      for (let i = 0; i < data.getNumberOfRows(); i++) {
        let value = data.getValue(i, index + 1);
  
        if (value === null) {
          data.setValue(i, index + 1, originalData.getValue(i, index + 1));
        } else {
          data.setValue(i, index + 1, null);
        }
      }
  
      chart.draw(data, options);
    }
  });
  
  chart.draw(data, options);
}
</script>
</body>
</html>
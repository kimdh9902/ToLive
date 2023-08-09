<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>marzipanoModuleOutput</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, minimal-ui" />
<style> @-ms-viewport { width: device-width; } </style>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/vendor/reset.min.css">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/assets/css/style.css">
</head>
<body class="single-scene view-control-buttons">


  <div class="mz-container" >
    <div id="pano"></div>
    <button id="close" class="close close-button-white"></button>

    <div id="titleBar">
      <h1 class="sceneName"></h1>
    </div>
  </div>

  

<script type="text/javascript" src="https:////cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/vendor/es5-shim.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/vendor/eventShim.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/vendor/classList.js"></script>
<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/vendor/requestAnimationFrame.js" ></script>
<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/vendor/screenfull.min.js" ></script>
<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/vendor/bowser.min.js" ></script>
<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/vendor/marzipano.js" ></script>

		<!-- jsp:param에 폴더 경로를 받아와서 해당 경로를 marzipanoViewer.jsp에서 사용하는 부분 -->
		<!-- ${param.viewerPath} jsp:param name value 로 받아와서 사용 -->
		<!-- jsp 페이지에서 param 부분에 필요한 값을 넣어서 전달 -->
		<!-- marzipanoViewer.jsp 종료 -->
<script src="${ pageContext.servletContext.contextPath }/resources/TripToLive/board_contents/${param.viewerPath}/data.js"></script>
		<!-- 받아온 폴더값을 folderPath 변수에 집어넣어서 index.js의 folderPath에서 사용하도록 만드는 부분 -->
<c:set var="folderPath" value="${param.viewerPath}"/>
<script>
	var folderPath = '${folderPath}';
</script>
		<!-- index.js 종료 -->
<script src="${ pageContext.servletContext.contextPath }/resources/marzipanoViewer/assets/js/index.js"></script>
 


</body>
</html>

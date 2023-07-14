<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload-action</title>

</head>
<body>
   <form action="${pageContext.servletContext.contextPath }/file/board" method="post" enctype="multipart/form-data">
      <input type="file" name="uploadFile" accept="image/*"/>
      <input type="hidden" name="b_no" value="22">
      <input type="submit" ></input>
   </form>
   <br>
   <form action="${pageContext.servletContext.contextPath }/file/attach" method="get">
      <input type="submit" ></input>
   </form>  
<%--    ${msg }
   <br>
   <a href="${pageContext.servletContext.contextPath }/upload/uploadForm">파일업로드 계속하기</a>
   
   <br>
   업로드된 이미지 파일
   <div >
      <img src="${pageContext.servletContext.contextPath }/file/attach?fileName=${originalFileName}"
         style="border: 1px solid red" />
   </div> --%>
   
</body>
</html>
   <%-- <form action="${pageContext.servletContext.contextPath }/upload/uploadFormAction" method="post" enctype="multipart/form-data">
      <input type="file" name="uploadFile" multiple="multiple"/>
      <input type="submit" ></input>
   </form>  --%>
   
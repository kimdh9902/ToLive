<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>
</head>
<body>

	토큰? = ${_csrf.token}
	<!-- 사용자 VO에서 이름 가져오기 -->
	<c:if test="${SPRING_SECURITY_CONTEXT.authentication.principal.userVO != null}" >
		<h2>VO</h2>
		<p>User Name from UsersVO: ${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.name}</p>
		<p>User Name from UsersVO: ${SPRING_SECURITY_CONTEXT.authentication.principal.userVO.phone_number}</p>
	</c:if>
</body>
</html>

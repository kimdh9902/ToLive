<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Hash</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>해쉬태그 아이디</td>
			<td>해쉬태그명</td>
		</tr>
		<c:forEach var="hash" items="${hashList}">

			<tr>
				<td>${hash.hash_id}</td>
				<td>${hash.hash_tag}</td>
			</tr>
		</c:forEach>
	</table>

	<P>The time on the server is ${serverTime}.</P>
</body>
</html>

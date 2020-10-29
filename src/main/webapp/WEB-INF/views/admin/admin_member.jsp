<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 관리</title>
<style></style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>회원탈퇴</th>
		</tr>
		<c:forEach items="${admemberlist}" var="market_member">
		<tr>
			<td>${market_member.id}</td>
			<td>${market_member.name}</td>
			<td>${market_member.email}</td>
		</tr>	
		</c:forEach>	
	</table>
</body>
</html>
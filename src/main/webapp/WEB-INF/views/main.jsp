<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MRS-main / 로그인시</title>
<style>
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>

	<c:import url="navi.jsp"></c:import>

<h3>${sessionScope.loginid }님 안녕하세요 메인입니다.</h3>
<div>
<div> <a href="what"> 무엇을? </a></div>
<div> <a href="where"> 어디서? </a></div>
</div>

</body>
</html>
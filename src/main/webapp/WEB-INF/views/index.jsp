<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body style="overflow-x: hidden;">
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	<%-- 	<h3>${sessionScope.loginid }</h3> --%>
	<div class="main">
		<div>
			<div class="main_top">
				<div>
					<h1 class="main_tit">외식업 예비 창업자를 위한 </h1>
					<p class="main_tit"> 서울 상권 분석 서비스, </p>
					<p class="main_tit">Seoul Commercial-districts Analysis</p>
				</div>
				<!--진짜 세상 구리다 누가 간지나게 해줄사람 없나요  -->
			</div>
			<div class="container">
		      <div class="row">
		        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
		          <div class="each-services">
		          	<a href="service_explain">
			            <img src="resources/img/intro.png" alt="Services">
			            <span>서비스 소개</span>
		            </a>
		          </div>
		        </div>
	   	        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
		          <div class="each-services services2">
		          	<a href="what">
			            <img src="resources/img/what.png" alt="Services">
			            <span>무엇을?</span>
		            </a>
		          </div>
		        </div>
		        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
		          <div class="each-services services3">
			          <a href="where">
				          <img src="resources/img/where.png" alt="Services">
				          <span>어디서?</span>
			          </a>
		          </div>
		        </div>
		      </div>
		    </div>

	    </div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>

<script>
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
	}	
	
</script>
</html>
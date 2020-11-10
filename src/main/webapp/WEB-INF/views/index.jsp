<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MRS</title>
<style>

	.service_name{
	    width: 100%;
	    height: 300px;
	    background-color: #3985F5;
	    color: white;
	    font-size: 50px;
	    text-align: center;
		line-height:300px;
	}
	
	.explain{
	    text-align: center;
		margin-top: 20px;
	}
	
	.ex_img{
	    width: 100%;
	    height: 700px;
	    outline: 1px solid orange;
	}
	
	p{
	    font-size: 20px;
	}
</style>
</head>
<body>

	<c:import url="./navi.jsp"></c:import>
	<h3>${sessionScope.loginid }</h3>

	<div class="service_name">SCA Service</div>
	<div class="explain">
	    <h1>SCA(Seoul Commerce Analysis) Service</h1>
	    <p>
	        어쩌구 저쩌구 여기에 설명쓰기<br>
	        어쩌구 저쩌구 여기에 설명쓰기<br>
	        어쩌구 저쩌구 여기에 설명쓰기<br>
	        어쩌구 저쩌구 여기에 설명쓰기<br>
	        어쩌구 저쩌구 여기에 설명쓰기<br>
	        어쩌구 저쩌구 여기에 설명쓰기<br>
	        어쩌구 저쩌구 여기에 설명쓰기<br>
	    </p>
	    <div class="ex_img"></div>
	</div>



</body>

<script>
/* 이렇게 주면 로그인/ 로그아웃 할때마다 뜸
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}
*/

</script>
</html>
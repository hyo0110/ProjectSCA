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

	.main_top{
	    width: 100%;
	    height: 300px;
	   /*  background-color: #3985F5; */
	   /*  color: white;
	    font-size: 50px;
	    text-align: center;
		line-height:300px; */
	}
	.main_box{
		width: 1200px;
		height: 300px;
		/* outline: 1px solid black; */
		margin: 0 auto;
		margin-top: 200px;
	}
	
	.img1{
		margin-right: 85px;
	}
	.img2{
		margin-right: 85px;
	}
	
	.img1:hover,.img2:hover,.img3:hover{
		opacity: 80%;
		cursor: pointer;
	}
	
		.bar_scrap{
	    position: fixed;
	    width: 150px;
	    height: 100px;
	    top: 558px;
	    right: 130px;
	    outline: 1px solid red;
	}
	.bar_search{
	    position: fixed;
	    width: 150px;
	    height: 200px;
	    top: 690px;
	    right: 130px;
	    outline: 1px solid blue;
	}
	

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
<%-- 	<h3>${sessionScope.loginid }</h3> --%>

	<div class="main_top">
		<img src="resources/img/main.gif" style="width: 100%;">
	</div>
	<div class="main_box">
	    <img src="resources/img/service_explain.PNG" width="340px;" class="img1" onclick="location.href='service_explain'">
	    <img src="resources/img/what.PNG" width="340px;" class="img2" onclick="location.href='what'">
	    <img src="resources/img/where.PNG" width="340px;" class="img3" onclick="location.href='where'">
	</div>
	<div class="bar_menu">
	    <div class="bar_scrap">스크랩한 글 갯수</div>
	    <div class="bar_search">최근 검색한 조건</div>
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
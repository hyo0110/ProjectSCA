<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
	.mainbox{
	position: relative;
	top: 200px;
	width: 100%;
	height: 100%;
	font-family: 'Open Sans', sans-serif;
	}
	.main_what{
    width: 30%;
    height: 600px;
    float: left;
    margin-left: 150px;
    margin-right: 100px;
    outline: 1px solid blue;
    text-align: center; 
	}
	.main_where{
	    width: 30%;
	    height: 600px;
	    float: left;
	    outline: 1px solid blue;
	    text-align: center; 
	}
	.bar_scrap{
	    position: fixed;
	    width: 15%;
	    height: 100px;
	    top: 256px;
	    right: 150px;
	    outline: 1px solid red;
	}
	.bar_search{
	    position: fixed;
	    width: 15%;
	    height: 200px;
	    top: 400px;
	    right: 150px;
	    outline: 1px solid blue;
	}
	
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>

<div class="mainbox">
	<div class="main_what">
		<p>무엇을 할 지 정하셨나요? 그럼 어디서 하는게 좋을지 추천드릴게요!</p>
		<img src="resources/img/map_seoul.jpg" width="550px" height="550px" onclick="location.href='where'"/>
	</div>
	<div class="main_where"> 
		<p>어디서 할 지 정하셨나요? 그럼 무엇을 하는게 좋을지 추천 드릴게요!</p>
		<img src="resources/img/food.jpg" width="550px" height="550px" onclick="location.href='what'">		
	</div>
	<div class="bar_menu">
	    <div class="bar_scrap">스크랩한 글 갯수</div>
	    <div class="bar_search">최근 검색한 글 갯수</div>
	</div>
</div>

</body>
</html>
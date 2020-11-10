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

	.mainbox{
	position: relative;
	top: 200px;
	width: 100%;
	height: 100%;
	}
	.main_what{
    width: 30%;
    height: 400px;
    float: left;
    margin-left: 150px;
    margin-right: 100px;
    outline: 1px solid blue;
	}
	.main_where{
	    width: 30%;
	    height: 400px;
	    float: left;
	    outline: 1px solid blue;
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
	<div class="main_what"> <a href="what"> 무엇을? </a></div>
	<div class="main_where"> 
		<img src="resources/img/seoulmap.PNG" onclick="location.href='where'"/>
	</div>
	<div class="bar_menu">
	    <div class="bar_scrap">스크랩한 글 갯수</div>
	    <div class="bar_search">최근 검색한 글 갯수</div>
	</div>
</div>

</body>
</html>
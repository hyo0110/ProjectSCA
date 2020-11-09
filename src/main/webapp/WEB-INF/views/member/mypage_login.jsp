<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-재로그인</title>
<style>
ul {
	padding : 0;
	margin : 0;
}
li {
	list-style: none;
	padding : 0;
	margin : 0;
}
a {
	text-decoration: none;
	padding : 0;
	margin : 0;
}
.lnb_items {
	width : 560px;
	height : 40px;
	display: inline-block;
	border : 1px solid #3d3d3d;
}
.lnb_item {
	width : 24.8%;
	height : 40px;
	border-right : 1px solid #3d3d3d;
	float : left;
	text-align:center;
}
.lnb_item:last-child { /* lnb 중에 마지막 요소 */
	border-right: 0;
}
.lnb_item a {
	width : 100%;
	height : 40px;
	color : #3d3d3d;
	text-align:center;
	line-height : 40px;
	vertical-align : middle;
}
.container {
	display : inline-block;
}
.snb_wrap {
	float : left;
}
.snb_items {
	border: 1px solid #3d3d3d;
	width : 140px;
}
.snb_item {
	width : 140px;
	height: 40px;
	border-bottom : 1px solid #3d3d3d;
	text-align : center;
}
.snb_item a {
	width : 140px;
	height: 40px;
	color : #3d3d3d;
	line-height : 40px;
	vertical-align : middle;
}
.snb_item:last-child {
	border-bottom : 0;
}
.re_login_wrap {
	float:left;
	width : 420px;
	height : 120px;
}
.re_login {
width : 100%;
height : 100%;
	border : 1px solid #3d3d3d;
	background-color : #ededed;
}
.re_login label {
	display:block;
}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



</head>
<body>
	<c:import url="../navi.jsp"></c:import>

	<div class="doc_wrap">

		<div class="container">
			<div class="snb_wrap">
				<ul class="snb_items">
					<li class="snb_item"><a href="#n">회원정보</a></li>
					<li class="snb_item"><a href="#n">스크랩</a></li>
					<li class="snb_item"><a href="#n">글목록</a></li>
				</ul>
			</div>
			<div class="re_login_wrap">
				<div class="re_login">
					<form action="mypage_login" method="POST">
						<div>
							<label for="user_id">아이디<input type="text" id="user_id" name="id" value="${loginid}"  disabled /></label>
							<label for="user_pw">패스워드<input type="password" id="user_pw" name="pw"   /></label>
						</div>
						<div>
							<input type="submit" value="로그인" />
						</div>
					</form>
				</div>
			</div>
	
	
	
</body>
</html>
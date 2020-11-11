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

.container {
	display : inline-block;
}
.snb_wrap {
	float : left;
}
.snb_items {
	/* border: 1px solid #3d3d3d; */
	width : 250px;
}
.snb_item {
	width : 250px;
	height: 40px;
	/* border-bottom : 1px solid #3d3d3d; */
	text-align : center;
	border\-radius: 0px 25px 25px 0px; 
	/* border: 1px solid lightgray; */
}
.snb_item a {
	width : 140px;
	height: 40px;
	/* color : #3d3d3d; */
	line-height : 40px;
	vertical-align : middle;
}
.snb_item:last-child {
	border-bottom : 0;
}
.detail_wrap {
	float:left;
	width : 850px;
	height: 500px;
	position: absolute;
    left: 50%;
    top: 38%;
    transform: translate(-50%,-50%);
}
.detail {
width : 100%;
height : 100%;
/* border : 1px solid #3d3d3d; */
/* background-color : #ededed; */
}
button{
			background-color:#0064FF;
            color:white;
            padding:13px 80px;
            color:#fff;
            font-size:17px;
            border: none;
            cursor: pointer;           
}

</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
		<div style="margin-top:50px;">
			<div class="snb_wrap">
				<ul class="snb_items">
					<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_login">회원정보</a></li>
					<li class="snb_item"><a href="mypage_scrap">스크랩</a></li>
					<li class="snb_item"><a href="mypage_written?page=1">글목록</a></li>
				</ul>
			</div>
			<div class="detail_wrap" style="border-radius:25px; border: 1px solid lightgray;">
				<div class="detail">
					<h3 style="text-align: center; margin-top: 40px; margin-bottom: 20px;">회원정보</h3>
					<p style="font-size:15px; text-align: center; margin-bottom: 20px;">회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</p>
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">아이디</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> ${member.id}</div>
					</div>
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">이름</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> ${member.name}</div>
					</div>
					<div style="width: 100%; height: 65px; margin-bottom: 20px;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">이메일</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> ${member.email}</div>
					</div>
					<div style="text-align: center; margin-top: 60px;">
						<button type="button" onclick="location.href='deleteMember'" style="margin-right: 30px;">탈퇴</button> <!-- 탈퇴여부 -->
						<button type="button" onclick="location.href='mypage_update'">수정</button>
					</div>
				</div>
			</div> 
		</div>	
</body>
<script>

</script>
</html>
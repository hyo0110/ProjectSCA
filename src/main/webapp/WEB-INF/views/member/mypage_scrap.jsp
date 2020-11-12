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
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/


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
.scrap_wrap {
	float:left;
	width : 850px;
	height: 500px;
	position: absolute;
    left: 50%;
    top: 38%;
    transform: translate(-50%,-50%);
}
.scrapbox {
width : 100%;
height : 100%;
	/* border : 1px solid #3d3d3d; */
	/* background-color : #ededed; */
}
table,th,td{
				border-bottom: 1px solid lightgray;
				border-collapse: collapse;
				padding: 10px 10px;
				
			}
table{
position: absolute;
left: 6%;
top: 5%;
}		
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
			<div style="margin-top:50px; font-family: 'Noto Sans KR', sans-serif;">
				<div class="snb_wrap">
					<ul class="snb_items">
						<li class="snb_item"><a href="mypage_detail">회원정보</a></li>
						<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_scrap">스크랩</a></li>
						<li class="snb_item"><a href="mypage_written?page=1">글목록</a></li>
					</ul>
				</div>
			</div>
			<div class="scrap_wrap" style="border-radius:20px; border: 1px solid lightgray; font-family: 'Noto Sans KR', sans-serif;">
				<div class="scrapbox">
					<table>
						<tr>
							<th style="width: 7%;">번호</th>
							<th style="width: 60%;">제목</th>
							<th style="width: 10%; text-align: center;">삭제</th>
						</tr>
						<c:forEach items = "${list}" var = "scrap">
						<tr>
							<td>${scrap.scrap_idx}</td>
							<td><a href="whereresult?${scrap.parameter}">${scrap.scrap_sub}</a></td>
							<td><a href="scrap_delete?idx=${scrap.scrap_idx}">삭제</a></td>
						</tr>
						</c:forEach>
						</table>
				</div>
			</div>
	
	
	
</body>
</html>
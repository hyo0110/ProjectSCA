<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-스크랩</title>
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
.scrap_wrap {
	float:left;
	width : 420px;
	height : 120px;
}
.scrapbox {
width : 100%;
height : 100%;
	border : 1px solid #3d3d3d;
	background-color : #ededed;
}
table,th,td{
				border: 1px solid black;
				border-collapse: collapse;
				padding: 10px 10px;
			}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
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
			<div class="scrap_wrap">
				<div class="scrapbox">
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>삭제</th>
						</tr>
						<c:forEach items = "${list}" var = "scrap">
						<tr>
							<td>${scrap.scrap_idx}</td>
							<td>${scrap.scrap_sub}</td>
							<td><a href="scrap_delete?idx=${scrap.scrap_idx}">삭제</a></td>
						</tr>
						</c:forEach>
						</table>
				</div>
			</div>
	
	
	
</body>
</html>
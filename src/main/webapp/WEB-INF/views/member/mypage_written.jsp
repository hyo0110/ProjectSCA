<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-내가쓴글</title>
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
		.board_wrap {
			float:left;
			width : 420px;
			height : 120px;
		}
		.boardbox {
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
		.pageitem {
			float: left;
		}
		.active {
			padding : 5px 5px;
			background: yellow;
		}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<div class="doc_wrap">
		<div class="lnb_wrap">
		<ul class="lnb_items">
			<li class="lnb_item"><a href="#n">검색</a></li>
			<li class="lnb_item"><a href="#n">마이페이지</a></li>
			<li class="lnb_item"><a href="#n">게시판</a></li>
			<li class="lnb_item"><a href="#n">고객센터</a></li>
		</ul>
		</div>
		<div class="container">
			<div class="snb_wrap">
				<ul class="snb_items">
					<li class="snb_item"><a href="#n">회원정보</a></li>
					<li class="snb_item"><a href="#n">스크랩</a></li>
					<li class="snb_item"><a href="#n">글목록</a></li>
				</ul>
			</div>
			<div class="board_wrap">
				<div class="boardbox">
					<table>
						<tr>
							<th>글 유형</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
						<c:forEach items = "${list}" var = "board">
						<tr>
							<td>${board.board_name}</td>
							<td><a href="board_detail?idx=${board.board_idx}">${board.subject}</a></td>
							<td>${board.reg_date}</td>
						</tr>
						</c:forEach>
						</table>
						<ul>
			
						<c:forEach var="i" begin="1" end="${totalPage}">
							<li 
								class="pageitem"
								<c:out value="${curPage == i ? 'style=background:red;' : ''}"/>><!-- li -->
								<a href="mypage_written?page=${i}">${i}</a>	
							</li>
						</c:forEach>
						</ul>
				</div>
			</div>
	
	
	
</body>
</html>
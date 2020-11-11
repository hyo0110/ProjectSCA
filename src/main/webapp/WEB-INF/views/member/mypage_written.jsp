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
	.board_wrap {
	float:left;
	width : 850px;
	height: 580px;
	position: absolute;
    left: 50%;
    top: 42%;
    transform: translate(-50%,-50%);
	}
	.boardbox {
		width : 100%;
		height : 100%;
/* 		border : 1px solid #3d3d3d;
		background-color : #ededed; */
	}
	table,th,td{
		border-bottom: 1px solid lightgray;
		border-collapse: collapse;
		padding: 10px 10px;
	}
	
	table{
	position: absolute;
	left: 5%;
	top: 5%;
	
	}	
	.pageitem {
		float: left;
	}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
			<div style="margin-top:50px;">
				<div class="snb_wrap">
					<ul class="snb_items">
						<li class="snb_item"><a href="mypage_detail">회원정보</a></li>
						<li class="snb_item"><a href="mypage_scrap">스크랩</a></li>
						<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_written?page=1">글목록</a></li>
					</ul>
				</div>
			</div>
			<div class="board_wrap" style="border-radius:20px; border: 1px solid lightgray;">
				<div class="boardbox">
					<table>
						<tr>
							<th style="width: 120px;">글 유형</th>
							<th style="width: 510px;">제목</th>
							<th style="width: 130px;">등록일</th>
						</tr>
						<c:forEach items = "${list}" var = "board">
						<tr>
							<td>
							<c:if test="${board.board_name =='freeboard'}">
								자유게시판
							</c:if>
							<c:if test="${board.board_name =='contact'}">
								고객센터
							</c:if>
							</td>
							<td><a href="detail?idx=${board.board_idx}&type=${board.board_type}&pri=${board.private_bbs}">${board.subject}</a>
							<c:if test="${board.board_type==1}">
								(${board.bchk == '1' ? 'Y' : 'N'})
							</c:if>
							</td>
							<td>${board.reg_date}</td>
						</tr>
						</c:forEach>
						</table>
						
						<ul style="top: 536px; position: absolute; left: 368px;">
						<c:if test="${curPage > 1}"><li class="pageitem"><a href="mypage_written?page=${curPage-1}">이전</a></li></c:if>
						<c:forEach var="i" begin="1" end="${totalPage}">
							<li class="pageitem"<c:out value="${curPage == i ? 'style= font-weight:600;' : ''}"/>><a href="mypage_written?page=${i}">${i}</a>	</li>
						</c:forEach>
						<c:if test="${curPage ne totalPage}"><li class="pageitem"><a href="mypage_written?page=${curPage+1}">다음</a></li></c:if>
						</ul>
						
				</div>
			</div>
	
	
	
</body>
</html>
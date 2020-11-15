<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/my_page.css">
<style>
	table {
		width : 100%;
	}
	.boardbox {
		width : 100%;
		height : 100%;
	}
	table,th,td{
		border-bottom: 1px solid lightgray;
		border-collapse: collapse;
		padding: 10px;
	}

	.pageitem {
		float: left;
	}
</style>

</head>
<body style="overflow-x: hidden;">

	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	
	<div class="containerbox">
		<div class="snb_wrap">
			<ul class="snb_items">
				<li class="snb_item"><a href="mypage_login">회원정보</a></li>
				<li class="snb_item"><a href="mypage_scrap">스크랩</a></li>
				<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_written?page=1">글목록</a></li>
			</ul>
		</div>
		<div class="detail_wrap">
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
			</div>
			<div class="page_wrp">
				<ul>
					<c:if test="${curPage > 1}"><li class="pageitem"><a href="mypage_written?page=${curPage-1}">이전</a></li></c:if>
					<c:forEach var="i" begin="1" end="${totalPage}">
						<li class="pageitem"<c:out value="${curPage == i ? 'style= font-weight:600;' : ''}"/>><a href="mypage_written?page=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${curPage ne totalPage}"><li class="pageitem"><a href="mypage_written?page=${curPage+1}">다음</a></li></c:if>
				</ul>	
			</div>
			
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>
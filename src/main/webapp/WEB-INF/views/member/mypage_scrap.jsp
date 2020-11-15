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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	table {
		width : 100%;
	}
	table, td, th {
		border-bottom: 1px solid lightgray;
		border-collapse: collapse;
		padding : 10px;
	}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	<div style=" width: 1920px; height: 600px;">	
			<div class="containerbox">
				<div class="snb_wrap">
					<ul class="snb_items">
						<li class="snb_item"><a href="mypage_login">회원정보</a></li>
						<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_scrap">스크랩</a></li>
						<li class="snb_item"><a href="mypage_written?page=1">글목록</a></li>
					</ul>
				</div>
		
				<div class="detail_wrap">
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
			</div>
	</div>	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>
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
	
	#footer	{
		position:relative;
		top:550px;
		text-align:left!important;
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
						<li class="snb_item"><a href="mypage_scrap">스크랩</a></li>
						<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_written?page=1">글목록</a></li>
					</ul>
				</div>
			</div>
			<div class="board_wrap" style="border-radius:20px; border: 1px solid lightgray; font-family: 'Noto Sans KR', sans-serif;">
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
	<!--Footer Links-->
   	<footer id="footer" class="page-footer text-center text-md-left pt-4">
    <div class="container-fluid">
      <div class="row">
        <!--First column-->
        <div class="col-md-3">
          <h5 class="text-uppercase font-weight-bold mb-4">Our Company</h5>
          <p>Our mission is to organize the commercial district information and make it universially accessible and useful </p>
        </div>
        <!--/.First column-->

        <hr class="w-100 clearfix d-md-none">

        <!--Second column-->
        <div class="col-md-2 mx-auto">
          <h5 class="text-uppercase font-weight-bold mb-4">Location</h5>
          <ul class="list-unstyled">
            <li>115, Gasan digital 2-ro, Geumcheon-gu, Seoul, Republic of Korea</li>
          </ul>
        </div>
        <!--/.Second column-->

        <hr class="w-100 clearfix d-md-none">

        <!--Third column-->
        <div class="col-md-2 mx-auto">
          <h5 class="text-uppercase font-weight-bold mb-4">About Us</h5>
          <ul class="list-unstyled">
            <li>Contacts</li>
            <li>Terms</li>
            <li>Condition</li>
            <li>Privacy Policy</li>
          </ul>
        </div>
        <!--/.Third column-->

        <hr class="w-100 clearfix d-md-none">

        <!--Fourth column-->
        <div class="col-md-2 mx-auto">
          <h5 class="text-uppercase font-weight-bold mb-4">FOLLOW US</h5>
          <ul class="list-unstyled">
            <li>Facebook</li>
            <li>Twitter</li>
            <li>Instargram</li>
            <li>RSS</li>
          </ul>
        </div>
        <!--/.Fourth column-->

      </div>
    </div>
    <!--/.Footer Links-->

    <hr>
    
    <!--Copyright-->
    <div class="footer-copyright py-3 text-center">
      <div class="container-fluid">
        © 2020 Copyright: <a href="http://localhost:8080/project">Goodeesite.com</a>
      </div>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

body{
	font-family: 'Noto Sans KR', sans-serif;
}
		#writebutton{
			background-color: #0064FF;
			color: white;
		} 

#footer	{
		position:absolute;
		top:800px;
		text-align:center!important;
		width: -webkit-fill-available;
}

</style>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script> 
</head>
<body>
		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
		<c:if test="${type==0}">
			<h1 style="position: relative; margin-top: 1%; left:15px;">자유게시판</h1>
		</c:if>
		<c:if test="${type==1}">
			<h1 style="position: relative; margin-top: 1%; left:15px;">고객센터</h1>
		</c:if>
			<div class="col-md-6" style="position: relative; max-width: 95%; left: 2%; margin-top: 1%; font-size: 15px;">
				  <table class="table table-hover">
					<thead style="background-color: #0064FF; color: white;  font-family : '도현', 산세 리프;">
						<tr>
							<th style="width: 5%;">글번호</th>
							<th style="width: 45%;">제목</th>
							<th style="width: 10%;">작성자</th>
							<th style="width: 15%;">작성일</th>
							<th style="width: 5%;">조회수</th>
						</tr>
					</thead>
					<tbody id="boardList">
						<!--  리스트 출력 -->
					</tbody>
					<tr>
						<td colspan="4" style="text-align: center;">
							<form action="opSearch" method="GET">
								<select name="search_option">
									<option value="all"
										<c:if test="${search_option == 'all'}"></c:if>>제목+내용</option>
									<option value="title"
										<c:if test="${search_option == 'title'}"></c:if>>제목</option>
									<option value="content"
										<c:if test="${search_option == 'content'}"></c:if>>내용</option>
								</select> 
								<input type="text" name="keyword" value="${keyword}" />
								<input 	type="submit" value="검색" />
								<input type="hidden" name="type" value="${type}" />
							</form>
						</td>
						<td style="text-align: right;">
							<button onclick="location.href='writeForm?type=${type}'" id="writebutton">글쓰기</button>
						</td>
					</tr>

				</table>
			</div>
			<div class="container"   style="position: absolute; left: 35%;">
				<nav arial-label="Page navigation" style="text-align: center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
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
<script>
	var type = "${type}";

	$(document).ready(function ajaxcall(type) {
		//console.log(type);			
		if (type == '0') {
			$("#boardList").empty();
			listCall(1);
		} else {
			$("#boardList").empty();
			listCall(1);
		}

	});

	function listCall(page) {
		var ppn = 10;

		$.ajax({
			url : "listcall",
			type : 'get',
			data : {
				"ppn" : ppn,
				"page" : page,
				"type" : type
			},
			dataType : 'json',
			success : function(data) {
				var type = data.type;
				console.log(type);

				listPrint(data.list);//게시물 그리기
				console.log(data.range);
				//플러그인 사용
				$("#pagination").twbsPagination({
					startPage : data.currPage, //시작페이지
					totalPages : data.range, //만들 수 있는 총 페이지 수
					visiblePages : 5, //보여줄 페이지 수 
					onPageClick : function(event, page, type) { //event : 해당 이벤트 객체 / page : 내가 몇 페이지 클릭 했는지
						//console.log(event);
						listCall(page);
					}
				});
			},
			error : function(e) {
				console.log(e);
			}

		});
	}

	function listPrint(list) {
		//console.log(list); //5개만 배열로 찍힘
		var content = "";
		var bchk = "";
		var private_bbs = "";

		list.forEach(function(item) {
			content += "<tr>";
			content += "<td>" + item.board_idx + "</td>";
			if (item.board_type == 1) { // 고객센터일때
				if (item.bchk == 0) { // 댓글확인여부 Y랑 N 띄우기
					bchk = "N";
				} else {
					bchk = "Y";
				}
				if (item.private_bbs == 1) { //비밀글 여부
					private_bbs = "비밀글";
					content += "<td>(" + private_bbs + ")<a href='detail?idx="
							+ item.board_idx + "&type=" + item.board_type
							+ "&pri=" + item.private_bbs + "'>" + item.subject
							+ "</a> [" + bchk + "]</td>";
				} else {
					content += "<td><a href='detail?idx=" + item.board_idx
							+ "&type=" + item.board_type + "&pri="
							+ item.private_bbs + "'>" + item.subject + "</a> ["
							+ bchk + "]</td>";
				}
			} else {
				content += "<td><a href='detail?idx=" + item.board_idx
						+ "&type=" + item.board_type + "&pri="
						+ item.private_bbs + "'>" + item.subject + "</a> ["+item.com_total+"]</td>";
			}

			content += "<td>" + item.id + "</td>";
			var date = new Date(item.reg_date);
			content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>";
			content += "<td>" + item.bHit + "</td>";
			content += "</tr>";
		});
		$("#boardList").empty(); // 이걸 안하면 데이터가 계속 쌓이게 됨
		//근데 empty를 하면 제목들이 다 날라가서 html5에서는 thead와 tbody로 해서 tbody에만 적용할 수 있음
		$("#boardList").append(content);
		content = ""; //내용이 끝나면 append 내용을 비워줌 
	}

	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
</html>
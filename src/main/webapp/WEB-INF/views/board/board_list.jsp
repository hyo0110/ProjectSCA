<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>


<style>
/* 
		.lnb_items {
			width: -webkit-fill-available;
			height: 40px;
			display: inline-block;
			border: 1px solid #3d3d3d;
		}
		
		.lnb_item {
			width: 24.8%;
			height: 40px;
			border-right: 1px solid #3d3d3d;
			float: left;
			text-align: center;
		}
		
		.lnb_item:last-child { /* lnb 중에 마지막 요소 */
			border-right: 0;
		}
		
		.lnb_item a {
			width: 100%;
			height: 40px;
			color: #3d3d3d;
			text-align: center;
			line-height: 40px;
			vertical-align: middle;
		} */
		
		/* .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
		    padding: 8px;
		    line-height: 1.42857143;
		    vertical-align: top;
		    border-top: 1px solid blue;
		} */
		
		#writebutton{
			background-color: #0064FF;
			color: white;
		}

</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
</head>
<body>
		<c:import url="../navi.jsp"></c:import> 
		<%-- <div class="doc_wrap">
				<div class="lnb_wrap">
					<ul class="lnb_items">
						<li class="lnb_item"><a href="main">검색</a></li>
						<li class="lnb_item"><a href="mypage_login">마이페이지</a></li>
						<li class="lnb_item"><a href="typelist?type=0">게시판</a></li>
						<li class="lnb_item"><a href="typelist?type=1">고객센터</a></li>
					</ul>
				</div>
			</div>  
			<div style="position: relative;">
				<c:choose>
					<c:when test="${sessionScope.loginid eq  null}">
						<button onclick="location.href='index'">로그인</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='logout'">로그아웃</button>
					</c:otherwise>
				</c:choose>
			</div> --%>
			<div class="col-md-6" style="position: relative; max-width: 95%; left: 2%; margin-top: 3%; font-size: 15px;">
				  <table class="table table-hover">
					<thead style="background-color: #0064FF; color: white;">
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
								</select> <input type="text" name="keyword" value="${keyword}" /> <input
									type="submit" value="검색" /> <input type="hidden" name="type"
									value="${type}" />
							</form>
						</td>
						<td style="text-align: right;">
							<button onclick="location.href='writeForm?type=${type}'" id="writebutton">글쓰기</button>
						</td>
					</tr>
					<tr>
						<td id="paging" colspan="5" style="text-align: center;">
							<div class="container"   style="position: absolute; left: 37%;">
								<nav arial-label="Page navigation" style="text-align: center">
									<ul class="pagination" id="pagination"></ul>
								</nav>
							</div>
						</td>
					</tr>
				</table>
			</div>

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
						listCall(page, type);
					}
				});
			},
			error : function(e) {
				console.log(e);
			}

		});
	}

	function listPrint(list) {
		console.log(list); //5개만 배열로 찍힘
		var content = "";
		var bchk = "";
		var private_bbs = "";
		list.forEach(function(item) {
			content += "<tr>";
			content += "<td>" + item.board_idx + "</td>";
			console.log("확인여부 : " + item.board_type);
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
							+ "</a>(" + bchk + ")</td>";
				} else {
					content += "<td><a href='detail?idx=" + item.board_idx
							+ "&type=" + item.board_type + "&pri="
							+ item.private_bbs + "'>" + item.subject + "</a>("
							+ bchk + ")</td>";
				}
			} else {
				content += "<td><a href='detail?idx=" + item.board_idx
						+ "&type=" + item.board_type + "&pri="
						+ item.private_bbs + "'>" + item.subject + "</a></td>";
			}

			//content += "<td>"+item.reg_date+"</td>"; // miliseconds 단위로 표시가 됨
			content += "<td>" + item.id + "</td>";
			var date = new Date(item.reg_date);
			content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>";
			//console.log(date.toLocaleDateString("ko-KR")); //toLocalDateString : 해당지역의 날짜를 string(ko-KR)으로 바꿔랏!
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
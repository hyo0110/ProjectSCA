<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/

#footerBox{ /*footer에는 relative를 주면 안됨*/
    margin-top: 80px;
   width: 100%; height: 200px;
   background-color:white;
   bottom: 0;
}


#footerBox>#infoBox{
   position: relative; /*부모*/
   width: 1600px; height: 200px;
   margin:0 auto;
}

#infoBox address{
   position: absolute;
   color: #555;
   font: 0.9rem/180% 'NanumGothic';
   width: 50%; height: 50px
    top:50%; left:50%;
    transform:translate(-50%, -50%);
    bottom:0px;
    text-align: center;
}

</style>
	 
</head>
<body style="overflow-x: hidden;">
		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
		<c:if test="${type==0}">
			<h1 style="position: relative; margin-top: 1%; left:20px; font-family: 'Noto Sans KR', sans-serif;">자유게시판</h1>
		</c:if>
		<c:if test="${type==1}">
			<h1 style="position: relative; margin-top: 1%; left:20px;font-family: 'Noto Sans KR', sans-serif;">고객센터</h1>
		</c:if>
			<div class="col-md-6" style="position: relative; max-width: 95%; left: 2%; margin-top: 1%; font-size: 15px; margin-bottom: -16px; ">
				  <table class="table table-hover table-bordered">
					<thead style=" font-family: 'Noto Sans KR', sans-serif; font-size: 25px;">
						<tr>
							<th style="width: 5%; text-align: center;">글번호</th>
							<th style="width: 45%; text-align: center;">제목</th>
							<th style="width: 10%; text-align: center;">작성자</th>
							<th style="width: 15%; text-align: center;">작성일</th>
							<th style="width: 5%; text-align: center;">조회수</th>
						</tr>
					</thead>
					<tbody id="boardList" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px;">
						<!--  리스트 출력 -->
					</tbody>
				</table>
			</div>
			<div style="width: 1780px;left: 52px;background-color:#F6F6F6;height: 25px;position: relative;padding-right: 5px;padding-left: 5px; margin-bottom: 1%;"></div>
			
			<div style="position: relative; text-align: center; font-family: 'Noto Sans KR', sans-serif;">
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
				<input 	type="submit" value="검색" style="border: 1px solid #dee2e6; font-family: 'Noto Sans KR', sans-serif;" class="btn btn-default"/>
				<input type="hidden" name="type" value="${type}" />
			</form>
			</div>
			
			<button onclick="location.href='writeForm?type=${type}'"  style="position: relative;text-align: center;left: 90%;top: -27px; border: 1px solid #dee2e6; font-family: 'Noto Sans KR', sans-serif;" class="btn btn-default">글쓰기</button>
			<div class="container"   style="position: absolute; left: 38%;">
				<nav arial-label="Page navigation" style="text-align: center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>



</body>

<footer id="footerBox"> <!--#########width:100% footer시작-->
	<hr style="margin: 0 0;">
   <section id="infoBox"> <!--@@width:1100px infoBox시작 -->


      <address>
         08505 서울시 금천구 가산디지털2로 115, 509호,811호(가산동, 대륭테크노타운3차) 대표 공효진 <br> 이메일 mastereum@sca.net FAX.02-6740-4949<br>고객상담센터 1577-4410 COPYRIGHT ⓒ 2020 SCA. ALL RIGHT RESERVED.
      </address>

   </section><!--@@@@@@@@@@@@@@infoBox끝 -->
</footer><!--###################################footer끝 -->

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

				listPrint(data.list);
				console.log(data.range);
				//플러그인 사용
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작페이지
					totalPages:data.range, //만들 수 있는 총 페이지 수
					visiblePages: 5, //보여줄 페이지 수 
					onPageClick:function(event,page,type){ //event : 해당 이벤트 객체 / page : 내가 몇 페이지 클릭 했는지
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
			content += "<td style='text-align: center; '>" + item.board_idx + "</td>";
			if (item.board_type == 1) { // 고객센터일때
				if (item.bchk == 0) { // 댓글확인여부 Y랑 N 띄우기
					bchk = "N";
				} else {
					bchk = "Y";
				}
				if (item.private_bbs == 1) { //비밀글 여부
					private_bbs = "비밀글";
					content += "<td>&nbsp;&nbsp;&nbsp;(" + private_bbs + ")<a href='detail?idx="
							+ item.board_idx + "&type=" + item.board_type
							+ "&pri=" + item.private_bbs + "'>" + item.subject
							+ "</a> [" + bchk + "]</td>";
				} else {
					content += "<td><a href='detail?idx=" + item.board_idx
							+ "&type=" + item.board_type + "&pri="
							+ item.private_bbs + "'>&nbsp;&nbsp;&nbsp;" + item.subject + "</a> ["
							+ bchk + "]</td>";
				}
			} else {
				content += "<td><a href='detail?idx=" + item.board_idx
						+ "&type=" + item.board_type + "&pri="
						+ item.private_bbs + "'>&nbsp;&nbsp;&nbsp;" + item.subject + "</a> ["+item.com_total+"]</td>";
			}

			content += "<td style='text-align: center;'>" + item.id + "</td>";
			var date = new Date(item.reg_date);
			content += "<td style='text-align: center;'>" + date.toLocaleDateString("ko-KR") + "</td>";
			content += "<td style='text-align: center;'>" + item.bHit + "</td>";
			content += "</tr>";
		});
		$("#boardList").empty(); 
		$("#boardList").append(content);
		content = ""; 
	}

	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	}
</script>
</html>
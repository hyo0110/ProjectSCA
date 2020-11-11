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
			
		</style>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script> 
	</head>
	<body>
	<c:import url="../navi.jsp"></c:import> 
		
		<div class="col-md-6" style="position: relative; max-width: 95%; left: 2%; margin-top: 3%; font-size: 15px;">
			<table class="table table-hover">
				<thead style="background-color: #0064FF; color: white;">
					<tr>
						<p>${count}개의 글이 있습니다. </p>
					</tr>
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
			<!--
			<tbody>
				<c:forEach items="${list}" var="bbs">
					<tr>
					<td>${bbs.board_idx}</td>
					<td>
						<a href="detail?idx=${bbs.board_idx}&type=${type}&pri=${bbs.private_bbs}">${bbs.subject}</a>
					</td>
					<td>${bbs.id}</td>
					<td>${bbs.reg_date}</td>
					<td>${bbs.bHit}</td>
					</tr>
				</c:forEach>
			</tbody>
			  -->
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
		
	</body>
	<script>
	var type = "${type}";	
	var map = "${map}";
	
	var keyword = "${keyword}";
	var option = "${search_option}";
	
	$(document).ready(
			function ajaxcall (type){
				console.log(type);					
				if(type == '0'){
					$("#boardList").empty();
					resultpaging(1);
				} else{
					$("#boardList").empty();
					resultpaging(1);
				}
				
			});
	
	function resultpaging(page){
		var ppn = 5;
		var list = "${list}";
		$.ajax({
			url:"resultpaging",
			type:'get',
			data:{
				"ppn":ppn,
				"page":page,
				"type":type,
				"list":list,
				"keyword":keyword,
				"search_option":option
			},
			dataType:'json',
			success:function(data){
				var type = data.type;
				console.log(type);
				
				listPrint(data.list);//게시물 그리기
				console.log(data.range);
				//플러그인 사용
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작페이지
					totalPages:data.range, //만들 수 있는 총 페이지 수
					visiblePages: 5, //보여줄 페이지 수 
					onPageClick:function(event,page,type){ //event : 해당 이벤트 객체 / page : 내가 몇 페이지 클릭 했는지
						console.log(event);
						resultpaging(page,type);
					}
				});
			},
			error:function(e){
				console.log(e);
			}
			
		});
	}
	
	function listPrint(list){
		console.log(list);
		var content = "";
		list.forEach(function(list){
			content += "<tr>";
			 content += "<td>"+list.board_idx+"</td>";
			 content += "<td><a href='detail?idx="+list.board_idx+"&type="+list.board_type+"&pri="+list.private_bbs+"'>"+list.subject+"</a></td>"; 
			
			 content += "<td>"+list.id+"</td>";
			 var date = new Date(list.reg_date);
			 content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
			 //console.log(date.toLocaleDateString("ko-KR")); //toLocalDateString : 해당지역의 날짜를 string(ko-KR)으로 바꿔랏!
			 content += "<td>"+list.bHit+"</td>";
			 content += "</tr>";
		});
		$("#boardList").empty(); // 이걸 안하면 데이터가 계속 쌓이게 됨
		//근데 empty를 하면 제목들이 다 날라가서 html5에서는 thead와 tbody로 해서 tbody에만 적용할 수 있음
		$("#boardList").append(content);
		content = ""; //내용이 끝나면 append 내용을 비워줌 
	
	}
	
	 
		
		var msg = "${msg}";
		if(msg !=""){
			alert(msg);
		}
	</script>
	</html>
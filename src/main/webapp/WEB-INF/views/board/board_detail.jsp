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
			table,th,td{
				border: 1px solid black;
				border-collapse: collapse;
				padding: 10px 10px;
			}
			
			#cominput{
				position : absolute;
				bottom: 46%;
			}
			
		</style>
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>

	</head>
	<body>
	<c:import url="../navi.jsp"></c:import> 
		<table>
				<tr><th>번호</th><td>${info.board_idx}</td></tr>
				<tr><th>작성자</th><td>${info.id}</td></tr>
				<tr><th>제목</th><td>${info.subject}</td></tr>
				<tr><th>내용</th><td>${info.content}</td></tr>
			</table>
			<br/>
			
			<table>
			<tbody id="comList">
				<!-- 댓글 리스트 출력 -->
			</tbody>
			
			<c:choose>
	            <c:when test="${info.board_type eq '1'}"> <!-- 고객센터일때 어드민만 작성가능 -->
	            	<c:if test="${sessionScope.loginid eq 'admin'}">
			            <div id="cominput">
							댓글 : <input type="text" value="" id="content" >  <input type="button" value="작성" onclick = insert()>	
						</div>
					</c:if>
	            </c:when>
	             <c:when test="${info.board_type eq '0'}"> <!-- 자유게시판일때 --> 
		            <div id="cominput">
						댓글 : <input type="text" value="" id="content" >  <input type="button" value="작성" onclick = insert()>	
					</div>
				</c:when> 
	          </c:choose>
	          
	         <c:if test="!${comCnt == 0}">
			<tr>
			<td id="paging" colspan="5" style="text-align: center;">
				<div class="container"> <!-- class의 이름은 api로 지정되어 있음 -->
					<nav arial-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
			</tr>
			</c:if> 
		</table>	

		<c:if test="${sessionScope.loginid eq info.id || sessionScope.loginid eq 'admin'}">
		<a href="./delete?idx=${info.board_idx}&type=${info.board_type}">삭제</a>
		<a href="./updateForm?idx=${info.board_idx}&type=${info.board_type}">수정</a>
		</c:if>
		<c:choose>
		<c:when test="${sessionScope.loginid eq 'admin'}">
			<c:if test="${info.board_type eq '0'}">
				<a href="./admin?page=1">목록보기</a>
			</c:if>
			<c:if test="${info.board_type eq '1'}">
				<a href="./admin_faqboard?page=1">목록보기</a>
			</c:if>
		</c:when>
		<c:otherwise>
			<a href="./typelist?type=${info.board_type}">목록보기</a>
		</c:otherwise>
		</c:choose>
	</body>
	
	<script>
	
		listCall(1);
		
		
		function listCall(page){
			var ppn = 5;
			var idx = "${info.board_idx}";
			$.ajax({
				url: "comlist",
				type:'get',
				data:{
					"ppn":ppn,
					"page":page,
					"idx": idx
				}, 
				dataType :'json',
				success:function(data){
					listPrint(data.list);//게시물 그리기
					//플러그인 사용
					$("#pagination").twbsPagination({
						startPage:data.currPage, //시작페이지
						totalPages:data.range, //만들 수 있는 총 페이지 수
						visiblePages: 5, //보여줄 페이지 수 
						onPageClick:function(event,page){ //event : 해당 이벤트 객체 / page : 내가 몇 페이지 클릭 했는지
							listCall(page);
						}
					});
				},
				error:function(e){
					console.log(e);
				}
				
			});
		}
		
		var loginId = "${sessionScope.loginid }";
		
		function listPrint(list){ 
			//console.log(list); 
			var content ="";
			
			list.forEach(function(item){
				 content += "<tr>";
				 content += "<input type='hidden' name ='com_idx' value="+item.com_idx+">";
				 content += "<input type='hidden' name ='board_idx' value="+item.board_idx+">";
				 content += "<th>"+item.id+"</th>";
				 content += "<td>"+item.com_content+"</td>";
				 var date = new Date(item.com_reg_date);
				 content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
				 if(item.id == loginId){
				 	content += "<td><input type='button' value='삭제' id='"+item.com_idx+"' onclick=del(this)></td>";
				 } else{
					 content += "</tr>";
					  
				 }
				 content += "</tr>";
				 //console.log(content);
			});
			$("#comList").empty(); 
			$("#comList").append(content);
			content += "";
		}
		
		function del(d){
			console.log(d.id);
			var idx = d.id;
			var board_idx = "${info.board_idx}";
			$.ajax({
				url: "delCom",
				type:'get',
				data:{
					"idx":idx,
					"board_idx":board_idx
				}, 
				dataType :'json',
				success:function(data){
					console.log("삭제성공");
					var msg = data.msg;
					alert(msg);
					location.reload();
					
				},
				error:function(e){
					console.log(e);
				}
				
			});	
		}
		
		
		function insert(){
			var board_idx = "${info.board_idx}";
			var id = "${sessionScope.loginid}";
			var content = $("#content").val();
			console.log(board_idx+"/"+id+"/"+content);
			
			$.ajax({
				url: "insertCom",
				type:'get',
				data:{
					"idx":board_idx,
					"id":id,
					"content":content
				}, 
				dataType :'json',
				success:function(data){
					console.log("등록");
					var msg = data.msg;
					alert(msg);
					location.reload();
				},
				error:function(e){
					console.log(e);
				}
				
			});	
		}
		
		
		var msg = "${msg}";
		if(msg !=""){
			alert(msg);
		}
		
	</script>
</html>
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
					
			#cominput{
				position : absolute;
				bottom: 46%;
				font-family: 'Noto Sans KR', sans-serif;
			}
			
			 .likebutton{
		      text-decoration: none;
		      font-size:15px;
		      color: gray;
		      padding:12px 25px;
		      margin:15px;
		      display:inline-block;
		      border-radius: 3px;
		      border: 1px solid #dee2e6;
		      font-family: 'Noto Sans KR', sans-serif;
		    }

			 .likebutton:hover{
			 text-decoration: none;
			 background-color: #009fe3;
			color:white;
			 }

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

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script> 
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	
		<div class="col-md-6" style="position: relative; max-width: 80%; left: 10%; margin-top: 3%; font-size: 15px; min-height: 700px;">
			<table  class="table table-hover table-bordered">
				<tr  style="background-color: #AFAFAF; color: white;">
				<th style="font-family: 'Noto Sans KR', sans-serif;; font-size: 22px; text-align: center;">작성일</th>
					<td style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px; text-align: center;">${info.reg_date}</td>
				<th style="font-family: 'Noto Sans KR', sans-serif; font-size: 22px; text-align: center;">작성자</th>
					<td style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px; text-align: center;">${info.id}</td>
				<th style="font-family: 'Noto Sans KR', sans-serif; font-size: 22px; text-align: center;">조회수</th>
					<td style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px; text-align: center;">${info.bHit}</td>
				</tr>
				<tr>
					<th  style="font-family: 'Noto Sans KR', sans-serif; font-size: 22px; text-align: center;">제목</th>
					<td colspan = "5" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px;">${info.subject}</td>
				</tr>
				<tr style="border-bottom:1px solid black; height: 600px;">
					<th style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px; vertical-align:middle; text-align: center;">내용</th>
					<td colspan = "5" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px;">${info.content}</td>
				</tr>
			</table>
		 </div> 
			
			<br/>
			
		<div class="col-md-6" style="position: relative; max-width: 80%; left: 13%; margin-top: 0%; font-size: 15px;">
			<table  class="table table-borderless" style=" max-width: 93%;">
			<tbody id="comList" >
				<!-- 댓글 리스트 출력 -->
			</tbody>
			<tr id="pa">
				<td id="paging" colspan="2"style="text-align: center;height: 63px;">
					<div class="container"   style="position: absolute; left: 36%;">
						<nav arial-label="Page navigation" style="text-align: center">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
				</td>
			</tr>
		</table>	
	</div>
				<c:choose>
	            <c:when test="${info.board_type eq '1'}"> <!-- 고객센터일때 어드민만 작성가능 -->
	            	<c:if test="${sessionScope.loginid eq 'admin'}">
			            <div id="cominput" style="position: relative;left: 14%; margin-top: 3%;">
							<h3>답변 </h3><br/>
							<input type="text" value="" id="content" style="width:70%;height: 150px; font-family: 'Noto Sans KR', sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="작성" onclick = insert() style="height: 152px; width: 100px;margin-left: -20px; border: 1px solid #dee2e6; margin-top: -5px; font-family: 'Noto Sans KR', sans-serif;"class="btn btn-default">	
						</div>
					</c:if>
	            </c:when>
	             <c:when test="${info.board_type eq '0'}"> <!-- 자유게시판일때 --> 
		            <div id="cominput" style="position: relative;left: 14%; margin-top: 3%;">
						<h3>댓글 </h3><br/>
						<input type="text" value="" id="content" style="width:70%;height: 150px; font-family: 'Noto Sans KR', sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="작성" onclick = insert() style="height: 152px; width: 100px;margin-left: -20px; border: 1px solid #dee2e6; margin-top: -5px; font-family: 'Noto Sans KR', sans-serif;" class="btn btn-default">
					</div>
				</c:when> 
	          </c:choose>  
	          <br/>
		<c:if test="${sessionScope.loginid eq info.id || sessionScope.loginid eq 'admin'}">
			<a href="./delete?idx=${info.board_idx}&type=${info.board_type}" class="likebutton" style="position: relative; left: 17%;">삭제</a>
			<a href="./updateForm?idx=${info.board_idx}&type=${info.board_type}" class="likebutton" style="position: relative; left: 5%;">수정</a>
		</c:if>		

		<c:choose>
		<c:when test="${sessionScope.loginid eq 'admin'}">
			<c:if test="${info.board_type eq '0'}">
				<a href="./admin?type=0" class="likebutton"style="position: absolute;left: 84%; font-family: 'Noto Sans KR', sans-serif;">처음으로</a>
			</c:if>
			<c:if test="${info.board_type eq '1'}">
				<a href="./admin?type=1" class="likebutton" style="position: absolute;left: 84%; font-family: 'Noto Sans KR', sans-serif;">처음으로</a>
			</c:if>
		</c:when>
		
		<c:when test ="${sessionScope.loginid ne 'admin'}">
			<a href="./typelist?type=${info.board_type}" class="likebutton" style="position: absolute;left: 84%; font-family: 'Noto Sans KR', sans-serif;">처음으로</a>
		</c:when>
		
		</c:choose>
	
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

					if(data.allCnt !=0){
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
					}else{
						console.log(data.allCnt);
						$("#pa").remove();
						var content ="<th style='font-size:20px; font-family: 'Noto Sans KR', sans-serif;'>등록된 댓글이 없습니다.</th>";
						$("#comList").append(content);
					}
				},
				error:function(e){
					console.log(e);
					console.log("실패");
				}
				
			});
		}
		
		var loginId = "${sessionScope.loginid }";
		
		function listPrint(list){ 
			//console.log(list); 
			var content ="";
			
			list.forEach(function(item){
					 content += "<tr style='border-bottom: 1px solid #dee2e6; font-family: 'Noto Sans KR', sans-serif;'>";
					 content += "<input type='hidden' name ='com_idx' value="+item.com_idx+">";
					 content += "<input type='hidden' name ='board_idx' value="+item.board_idx+">";
					 content += "<th style='width: 70px; border-color:black; font-size:20px;'>"+item.id+"</th>";
					 var date = new Date(item.com_reg_date);
					 content += "<td style='border-color:black; font-size:20px;'>"+item.com_content+"</td>";
					 content += "     <td style='width: 190px; color:gray;'>["+date.toLocaleDateString("ko-KR")+"]";
					 if(item.id == loginId){
					 	content += "&nbsp<input type='button' value='삭제' id='"+item.com_idx+"' onclick=del(this) style='left: 88%;position: absolute; border: 1px solid #dee2e6; font-family: 'Noto Sans KR', sans-serif;' class='btn btn-default btn-sm'></td>";
					 } else{
						 content += "</td>";
						  
					 }
					 content += "</tr>";
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
			if(content==''){
				content = "내용 없음";
			}
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
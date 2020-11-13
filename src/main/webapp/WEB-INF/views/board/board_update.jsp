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

			
			input[type='text']{
				width: 100%;
			}
			
			#editable{
			text-align: left;
			width:98%;
			height: 500px;
			border: 1px solid gray;
			padding 5px;
			overflow: auto; 
			}

			
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
		
	<form action="update" method = "post">
		<input type="hidden" name ="type" value="${info.board_type}">
		<input type="hidden" name ="idx" value="${info.board_idx}">
		<div class="col-md-6" style="position: relative; max-width: 90%; left: 2%; margin-top: 3%; font-size: 15px;">
			<table  class="table table-hover">
				<c:if test="${sessionScope.loginid ne ''}">
					<input type=hidden name=id value="${sessionScope.loginid}">
				</c:if>
				<tr>
					<th>제목</th>
					<td><input type = "text" name = "subject"/></td>
				</tr>
				<tr>
					<th>내용</th> 
					<td style="width: 80%;">
						<div id="editable" contenteditable="true">${info.content}</div> 
						<input id = "content" type="hidden" name="content" value="" />
					</td>
				</tr>
				<c:if test="${info.board_type=='0'}"> <!-- 자유게시판(0)이면 수정의 파일업로드 기능 존재함 -->
				<tr>
					<th>파일첨부</th>
					<td>
						<input type="button" onclick="fileUp()" value ="파일 업로드 " style="text-align: center; border: 1px solid #dee2e6;" class="btn btn-default"/>
						<div id="files"></div>
					</td>
				</tr>
				</c:if>

			</table>
			</div>
			<input type = "button" onclick = "save()" value = "저장" style="position: relative;text-align: center;left: 88%; border: 1px solid #dee2e6;" class="btn btn-default"/>
		</form>
		
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
  
</body>
<script>

 		//뒤로가기 막기
	    history.pushState(null,'',location.href);
		window.onpopstate = function(){
		 	history.go(0);
			alert("저장하기전엔 뒤로 가실 수 없습니다.");
		}			
 		
		//삭제버튼 붙이기
		$(document).ready(function(){
			$("#editable img").each(function(idx,item){//idx = 갯수 , item = ???
				console.log(idx,item);
				 $(item).after("&nbsp;&nbsp;<input id='${path}' type='button' value='삭제' onclick='del(this)' style='text-align: center;border: 1px solid #dee2e6;' class='btn btn-default btn-sm'><br/>");
			});
		});


		
		function fileUp(){ //파일 업로드 새창 띄우기
			var myWin = window.open('uploadForm','파일 업로드','width=600, height=200'); 
		}
		
		//파일 삭제 버튼 
		function del(elem){
			//console.log(elem); 
			var file = $(elem).prevAll();
			var name = file[0].outerHTML.split("/")[2].split(" ")[0];
			var fileName = name.substring(name.indexOf('"'),name);
			console.log(fileName);
 			$.ajax({
				url:'updateFileDelete',
				type:'get',
				data:{'fileName':fileName}, 
				dataType:'json',
				success:function(data){
					console.log(data);
					if(data.success == 1){
						alert("파일 삭제");
						$(elem).prev().remove(); 
						$(elem).remove(); 
					}
				}, error:function(e){
					
				}
			}); 
		}
		
		//저장시키기
		function save(){
			if(confirm("등록하시겠습니까?")==true){
				$("#editable input[type='button']").remove();
				$("#content").val($("#editable").html()); 
				$("form").submit(); 
			}else{
				
			}
		}
</script>
</html>
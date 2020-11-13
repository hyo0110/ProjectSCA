<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SCA Service</title>
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
		/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
		/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/

			table,th,td{
				border: 1px solid black;
				border-collapse: collapse;
				padding: 10px 10px;
			}
			
			table.board{
				width:100%;
			}
			
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
			text-overflow: ellipsis;
			}
		
		</style>
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>

		<form action="write" method = "post">
		<input type="hidden" name ="type" value="${type}">
		<div class="col-md-6" style="position: relative; max-width: 95%; left: 2%; margin-top: 3%; font-size: 15px;">
			<table class="table table-hover table-bordered">
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
						<div id="editable" contenteditable="true"></div> 
						<input id = "content" type="hidden" name="content" value=""/>
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td>
						<input type="button" onclick="fileUp()" value ="파일 업로드 " style="text-align: center; border: 1px solid #dee2e6;" class="btn btn-default"/>
						<div id="files"></div>
					</td>
				</tr>
			</table>
			</div>
			<input type = "button" value = "저장"  style="position: relative;text-align: center;left: 88%; border: 1px solid #dee2e6;" class="btn btn-default" onclick="save()"/>
			<input type="button" value="뒤로가기" onclick="goback()" style="position: relative;text-align: center;left: 88%; border: 1px solid #dee2e6;" class="btn btn-default"/>
		</form>
		
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	</body>
	<script>
		
		function save(){
			if(confirm("등록하시겠습니까?")==true){
				$("#editable input[type='button']").remove();
				$("#content").val($("#editable").html()); 
				$("form").submit(); 
			}else{
				
			}

		}
	
	
		function fileUp(){ //파일 업로드 새창 띄우기
			var myWin = window.open('uploadForm','파일 업로드','width=600, height=200'); 
		}
		
		//파일 삭제 버튼 
		function del(elem){
			console.log(elem); 
			var fileName = elem.id.split("/")[1]; 
			console.log(fileName);
			$.ajax({
				url:'fileDelete',
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
		
		function goback() { //뒤로가기 버튼
			window.history.back();
		}
	</script>
</html>
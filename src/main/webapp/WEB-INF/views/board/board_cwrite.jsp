<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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

			table,th,td{
				border: 1px solid black;
				border-collapse: collapse;
				padding: 10px 10px;
			}
			
			input[type='text']{
				width: 85%;
			}
		
			
			#content{
				width:100%;
				height: 500px;
				resize: none;
			}
		
		</style>
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
		<form action="cwrite" method = "post">
		<input type="hidden" name ="type" value="${type}">
		<div class="col-md-6" style="position: relative; max-width: 95%; left: 2%; margin-top: 3%; font-size: 15px;">
			<table class="table table-hover table-bordered">
				<c:if test="${sessionScope.loginid ne ''}">
					<input type=hidden name=id value="${sessionScope.loginid}">
				</c:if>
				<tr>
					<th>제목</th>
					<td>
					<input type = "text" name = "subject"/> &nbsp
					<input type="checkbox" name="privatecheck" id="privatecheck"/>비밀글	
					<input type="hidden" name="privateHidden" id="privateHidden"/>
					</td>
				</tr>
				<tr>
					<th >내용</th>
					<td style="width: 80%;"><textarea name = "content" id="content"></textarea></td>
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
			$("form").submit(); 
		}else{
			
		}

	}
	
	
	$("#privatecheck").change(function(){
		if ($("#privatecheck").is(":checked")) {
	    $("#privateHidden").val('1');
		} else {
		    $("#privateHidden").val('0');
			}
		}
	);
	
	function goback() { //뒤로가기 버튼
		window.history.back();
	}

	</script>
</html>
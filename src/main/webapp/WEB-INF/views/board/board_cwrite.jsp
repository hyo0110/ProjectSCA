<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>

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
		<c:import url="../navi.jsp"></c:import> 
		<form action="cwrite" method = "post">
		<input type="hidden" name ="type" value="${type}">
		<div class="col-md-6" style="position: relative; max-width: 95%; left: 2%; margin-top: 3%; font-size: 15px;">
			<table class="table table-hover">
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
					<th>내용</th>
					<td><textarea name = "content" id="content"></textarea></td>
				</tr>
				<tr>
					<td colspan = "2">
					<input type = "submit" value = "저장"/>
					<input type="button" value="뒤로가기" onclick="goback()">
					</td>
				</tr>
			</table>
			</div>
		</form>
	</body>
	<script>

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
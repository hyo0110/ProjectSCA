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
				width: 100%;
			}
		
			
			textarea{
				width:100%;
				height: 100%
			}
			
			
		</style>
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
		<form action="cwrite" method = "post">
		<input type="hidden" name ="type" value="${type}">
			<table>
				<tr>
				<c:if test="${sessionScope.loginid ne ''}">
					<th>작성자</th>
					<td>
					${sessionScope.loginid}
					<input type=hidden name=id value="${sessionScope.loginid}">
					<input type="checkbox" name="privatecheck" id="privatecheck"/>비밀글	
					<input type="hidden" name="privateHidden" id="privateHidden"/>
				</td>
				</c:if>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type = "text" name = "subject"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name = "content"></textarea></td>
				</tr>
				<tr>
					<td colspan = "2"><input type = "submit" value = "저장"/></td>
				</tr>
			</table>
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
	

	</script>
</html>
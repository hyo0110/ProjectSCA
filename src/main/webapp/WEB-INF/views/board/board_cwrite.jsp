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
				<!-- 로그인 기능과 연동했을 때 세션값으로 작성자를 지정하려고 합니다. 지우지 마세요!
				<c:if test="${sessionScope.loginId != null}">
					<th>작성자</th>
					<td>
					${sessionScope.loginId}
					<input type = "hidden" name = "id" value="${sessionScope.loginId}"/>
					<div><input type="checkbox" name="private" value="1"/>비밀글	</div>
					</td>
				</c:if>
				-->
				<th>작성자</th>
				<td>
				<input type = "text" name = "id" value="test"/>
				<input type="checkbox" name="privatecheck" id="privatecheck"/>비밀글	
				<input type="hidden" name="privateHidden" id="privateHidden"/>
				</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<style>
	table,th,td{
					border:1px solid black;
					border-collapse: collapse;
					padding: 5px 10px;
				}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<form action="login" method=POST >
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="login"/>
					<input type="button" value="회원가입" onclick="location.href='joinForm'"/>
				</td>
			</tr>
		</table>
	</form>	
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		}
	
</script>
</html>
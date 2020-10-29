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
		</style>
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
		<table>
			<tr><th>번호</th><td>${info.board_idx}</td></tr>
			<tr><th>작성자</th><td>${info.id}</td></tr>
			<tr><th>제목</th><td>${info.subject}</td></tr>
			<tr><th>내용</th><td>${info.content}</td></tr>
		</table>
		<a href="./delete?idx=${info.board_idx}&type=${info.board_type}">삭제</a>
		<a href="./updateForm?idx=${info.board_idx}&type=${info.board_type}">수정</a>
		<a href="./typelist?type=${info.board_type}">목록보기</a>
	</body>
		<script>
	
		var msg = "${msg}";
		if(msg !=""){
			alert(msg);
		}
		
	</script>
</html>
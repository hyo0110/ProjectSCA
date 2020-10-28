<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<td>환영합니다. 
<spring:eval expression="@config['manager.id']"/> 님
</td>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시글 관리</title>
<style></style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${adminlist}" var="market_board">
		<tr>
			<td>${market_board.board_idx}</td>
			<td>${market_board.subject}</td>
			<td>${market_board.id}</td>
			<td>${market_board.reg_date}</td>
			<td>${market_board.bhit}</td>
			<td>
			<input type="button" onclick="ajaxCall(${market_board.board_idx})" value="삭제" id="Del"/>
			</td>
		</tr>	
		</c:forEach>			
	</table>

</body> 

<script>


	function ajaxCall(board_idx){
		
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
				url:"admindel",
				type:'GET',
				data:{'board_idx':board_idx},
				dataType:'JSON',
				success:function(d){	
					//디비랑 페이지가 삭제되지만 페이지 새로고침이 안된다.
					console.log("성공했니?");
					$('.Del').remove(this);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else{
			
		}
		
	}


</script>
</html>
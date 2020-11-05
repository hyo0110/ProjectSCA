<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무엇을 결과 화면</title>
<style>
		.lnb_items {
		width : 560px;
		height : 40px;
		display: inline-block;
		border : 1px solid #3d3d3d;
		}
		.lnb_item {
			width : 24.8%;
			height : 40px;
			border-right : 1px solid #3d3d3d;
			float : left;
			text-align:center;
		}
		.lnb_item:last-child { /* lnb 중에 마지막 요소 */
			border-right: 0;
		}
		.lnb_item a {
			width : 100%;
			height : 40px;
			color : #3d3d3d;
			text-align:center;
			line-height : 40px;
			vertical-align : middle;
		}
		
		#news_section{
			border : 1px solid darkblue;
			width: 400px;			
		}
		
		.news_item{
			display: block;
			text-overflow: ellipsis;
			overflow: hidden;
			white-space: nowrap;
		}

</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>

<div class="doc_wrap">
		<div class="lnb_wrap">
		<ul class="lnb_items">
			<li class="lnb_item"><a href="main">검색</a></li>
			<li class="lnb_item"><a href="mypage_login">마이페이지</a></li>
			<li class="lnb_item"><a href="typelist?type=0">게시판</a></li>
			<li class="lnb_item"><a href="typelist?type=1">고객센터</a></li>
		</ul>
		</div>
	</div>
	
        <c:choose>
            <c:when test="${sessionScope.loginid eq  null}">
               <button onclick="location.href='index'">로그인</button>
            </c:when>
            <c:otherwise>
               <button onclick="location.href='logout'">로그아웃</button>
            </c:otherwise>
       </c:choose>
       
       


안녕하세욥! ㅇㅇㅇ구 입니다.
<h3>${region} 입니다 </h3>

<div id ="news_section">
	<ul id ="news_list">
	</ul>
</div>

</body>

<script>

	var region = "${region}";
	
	$(document).ready(function(){
		$.ajax({
				url: "newslist",
				type:'get',
				data:{
					"region":region
				}, 
				dataType :'json',
				success:function(data){
					//div ="news_sectoin" 에다 가져온 애들을 넣어야함.
					console.log(data);
					//console.log(data.title_1);
					//console.log(data.link_1);
					
					$("#news_list").append("<li><a href='"+data.link_1+"' class = 'news_item'>"+data.title_1+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_2+"' class = 'news_item'>"+data.title_2+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_3+"' class = 'news_item'>"+data.title_3+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_4+"' class = 'news_item'>"+data.title_4+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_5+"' class = 'news_item'>"+data.title_5+"</a></li>");
					 
					},
				error: function(e){
					console.log(e)
				}
		});
		});

</script>
</html>
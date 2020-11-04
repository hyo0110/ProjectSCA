<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-회원정보수정</title>
<style>
ul {
	padding : 0;
	margin : 0;
}
li {
	list-style: none;
	padding : 0;
	margin : 0;
}
a {
	text-decoration: none;
	padding : 0;
	margin : 0;
}
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
.container {
	display : inline-block;
}
.snb_wrap {
	float : left;
}
.snb_items {
	border: 1px solid #3d3d3d;
	width : 140px;
}
.snb_item {
	width : 140px;
	height: 40px;
	border-bottom : 1px solid #3d3d3d;
	text-align : center;
}
.snb_item a {
	width : 140px;
	height: 40px;
	color : #3d3d3d;
	line-height : 40px;
	vertical-align : middle;
}
.snb_item:last-child {
	border-bottom : 0;
}
.detail_wrap {
	float:left;
	width : 420px;
}
.detail {
width : 100%;
height : 100%;
	border : 1px solid #3d3d3d;
	background-color : #ededed;
}

</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<div class="doc_wrap">
		<div class="lnb_wrap">
		<ul class="lnb_items">
			<li class="lnb_item"><a href="#n">검색</a></li>
			<li class="lnb_item"><a href="#n">마이페이지</a></li>
			<li class="lnb_item"><a href="#n">게시판</a></li>
			<li class="lnb_item"><a href="#n">고객센터</a></li>
		</ul>
		</div>
		<div class="container">
			<div class="snb_wrap">
				<ul class="snb_items">
					<li class="snb_item"><a href="#n">회원정보</a></li>
					<li class="snb_item"><a href="#n">스크랩</a></li>
					<li class="snb_item"><a href="#n">글목록</a></li>
				</ul>
			</div>
			<div class="detail_wrap"> 
				<div class="detail">
				<form action="updateMember" method="post" onsubmit="return pwchk()">
					<p>아이디: <input type ="text" name="user_id" value="${member.id}" readonly></p>
					<p>비밀번호 :<input type ="password" name="user_pw"></p>
					<p>비밀번호확인 : <input type ="password" name="user_pw2" onchange="pwchk()"/><span id="pwchk"></span></p>
					<p>이름 :<input type ="text" name="user_name" value="${member.name}"></p>
					<p>이메일 :<input type ="email" name="user_email" value="${member.email}"></p>

					<input type= "submit" value ="확인" />
					<button onclick="location.href = 'redirect:/mypage_detail'">취소</button>
					
					
					</form>
				</div>
			</div>
	
</body>

<script>
//비밀번호 중복확인-----------------------------------------------------------------------------------------------------------------

var overpw = false;

function pwchk(){
	var pw1 = $("input[name='user_pw']").val();
	var pw2 = $("input[name='user_pw2']").val();
	console.log(pw1+"/"+pw2);  
	if(pw1!=pw2){
		document.getElementById('pwchk').innerHTML='비밀번호가 일치하지않습니다. 다시 확인해주세요.'
        document.getElementById('pwchk').style.color='red';
		//console.log("일치하지않음");
	}else{
		document.getElementById('pwchk').innerHTML='비밀번호가 일치합니다.'
        document.getElementById('pwchk').style.color='blue';
		overpw= true;
	}	
}


</script>
</html>
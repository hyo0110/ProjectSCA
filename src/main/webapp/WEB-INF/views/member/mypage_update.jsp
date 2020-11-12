<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

.container {
	display : inline-block;
}
.snb_wrap {
	float : left;
}
.snb_items {
	/* border: 1px solid #3d3d3d; */
	width : 250px;
}
.snb_item {
	width : 250px;
	height: 40px;
	/* border-bottom : 1px solid #3d3d3d; */
	text-align : center;
	border\-radius: 0px 25px 25px 0px; 
	/* border: 1px solid lightgray; */
}
.snb_item a {
	width : 140px;
	height: 40px;
	/* color : #3d3d3d; */
	line-height : 40px;
	vertical-align : middle;
}
.snb_item:last-child {
	border-bottom : 0;
}
/* 여기까지 좌측 네비바 */
.detail_wrap {
	float:left;
	width : 850px;
	height: 500px;
	position: absolute;
    left: 50%;
    top: 38%;
    transform: translate(-50%,-50%);
}
.detail {
width : 100%;
height : 100%;
/* border : 1px solid #3d3d3d; */
/* background-color : #ededed; */
}
input{
border: 0;
border-bottom:1px solid lightgray;
}
input:focus{
        border-bottom:1px solid #4C4C4C;
        outline: none;
    }
button{
			/* background-color:#0064FF;
            color:white; */
            padding:10px 80px;
            /* color:#fff; */
            font-size:17px;
            /* border: none; */
            cursor: pointer; 
            border: 1px solid #004c80;             
            color: #004c80; 
            background-color: white;          
}    
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
			<div style="margin-top:50px;">
				<div class="snb_wrap">
					<ul class="snb_items">
						<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_login">회원정보</a></li>
						<li class="snb_item"><a href="mypage_scrap">스크랩</a></li>
						<li class="snb_item"><a href="mypage_written?page=1">글목록</a></li>
					</ul>
				</div>
			</div>	
			<div class="detail_wrap" style="border-radius:25px; border: 1px solid lightgray;">
				<div class="detail">
				<h3 style="text-align: center; margin-top: 40px; margin-bottom: 20px;">회원정보 수정</h3>
				<form action="updateMember" method="GET" onsubmit="return pwchk()">
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">아이디</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> 
							<input type ="text" name="user_id" style=" border-bottom: none;" value="${member.id}" readonly/>
						</div>
					</div>
					<%-- <p>아이디: <input type ="text" name="user_id" value="${member.id}" readonly></p> --%>
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">비밀번호</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> 
							<input type ="password" name="user_pw"/>
						</div>
					</div>
					<!-- <p>비밀번호 :<input type ="password" name="user_pw"></p> -->
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">비밀번호 확인</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> 
							<input type ="password" name="user_pw2" onchange="pwchk()"/><span id="pwchk"></span>
						</div>
					</div>
					<!-- <p>비밀번호확인 : <input type ="password" name="user_pw2" onchange="pwchk()"/><span id="pwchk"></span></p> -->
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">이름</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> 
							<input type ="text" name="user_name" value="${member.name}">
						</div>
					</div>
					<%-- <p>이름 :<input type ="text" name="user_name" value="${member.name}"></p> --%>
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">이메일</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> 
							<input type ="email" name="user_email" value="${member.email}">
						</div>
					</div>
					<%-- <p>이메일 :<input type ="email" name="user_email" value="${member.email}"></p> --%>
					<div style="text-align: center; margin-top: 18px;">
						<button type= "submit" style="margin-right: 30px; border-radius: 10px;">확인</button>
						<button type="button" onclick="location.href='mypage_detail'"style="border-radius: 10px;">취소</button>
					</div>
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
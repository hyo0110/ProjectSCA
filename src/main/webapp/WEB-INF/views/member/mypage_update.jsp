<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="resources/css/my_page.css">
<style>
	input{
		border: 0;
		border-bottom:1px solid lightgray;
	}
	input:focus{
	        border-bottom:1px solid #4C4C4C;
	        outline: none;
	    }
	button{
	     padding:10px 80px;
	     font-size:17px;
	     cursor: pointer; 
	     border: 1px solid #004c80;             
	     color: #004c80; 
	     background-color: white;          
	} 
	button:hover{
		background-color: #009fe3; 
		color: white;
	}   
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	
			<div class="containerbox">
				<div class="snb_wrap">
					<ul class="snb_items">
						<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_login">회원정보</a></li>
						<li class="snb_item"><a href="mypage_scrap">스크랩</a></li>
						<li class="snb_item"><a href="mypage_written?page=1">글목록</a></li>
					</ul>
				</div>
	
			<div class="detail_wrap">
				<div class="detail">
				<h3 style="text-align: center; margin-top: 40px; margin-bottom: 20px;">회원정보 수정</h3>
				<form action="updateMember" method="GET" onsubmit="return updatechk()">
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
					<div style="text-align: center; margin: 18px 0;">
						<button type= "submit" style="margin-right: 30px; border-radius: 10px;">확인</button>
						<button type="button" onclick="location.href='mypage_detail'"style="border-radius: 10px;">취소</button>
					</div>
					</form>
				</div>
			</div>
		</div>	
		<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
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

function updatechk(){

    if(($("input[name='user_pw']").val()!="") && ($("input[name='user_pw2']").val()!="") && ($("input[name='user_pw']").val()==$("input[name='user_pw2']").val())){
       if($("input[name='user_name']").val()!=""){
          if($("input[name='user_email']").val()!=""){
             return true;
             }
          }
       }         
 alert("누락된 곳이 있거나 틀린곳이 없는지 확인해주세요.");
 return false;
 }
					
	
	

</script>
</html>
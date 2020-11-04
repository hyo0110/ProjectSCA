<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style></style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<form action="join" method="post" onsubmit="return joinchk()">
		<p>ID:<input type="text" name="user_id" id="user_id"/><span id="idchk"></span></p>
		<p>PW:<input type="password" name="user_pw" /></p>
		<p>PW:<input type="password" name="user_pw2" onchange="pwchk()"/><span id="pwchk"></span></p>
		<p>NAME:<input type="text" name="user_name"/></p>
		<p>EMAIL:<input type="email" name="user_email"/></p>
		<input type="submit" value="가입"/>		
		<input type="button" onclick="location.href='index'" value ="취소"/>
	</form>
</body>
<script>

	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		}

	var overid = false;
	
	//아이디 중복확인-------------------------------------------------------------------------------------------------------------------
	$('#user_id').focusout(function() {
		var id = $("input[name='user_id']").val(); 
		console.log(id);
		$.ajax({
				url:'dbchk',
				type:'GET',
				dataType:'JSON',
				data:{"id":id},
				success:function(data){
					//console.log(data.dbchk); // 여기까진 이제 됨 
					if(data.dbchk>0){
						document.getElementById('idchk').innerHTML='아이디가 존재합니다. 다른 아이디를 입력해주세요.'
		                document.getElementById('idchk').style.color='red';
					}else{
						document.getElementById('idchk').innerHTML='사용가능한 아이디 입니다.'
						document.getElementById('idchk').style.color='blue';
						overid = true;
					}
				},
				error:function(){
					
				}
			});
		});
	
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
	
	/* null값, 아이디 중복일경우, 비밀번호 다를경우 가입하기 안되게 하고싶다 진짜*/
	
	function joinchk(){

		if($("input[name='user_id']")!=""){
			//console.log("아이디확인");
			if(($("input[name='user_pw']").val()!="") && ($("input[name='user_pw2']").val()!="") && ($("input[name='user_pw']").val()==$("input[name='user_pw2']").val())){
				//console.log("비번확인");
				if($("input[name='user_name']").val()!=""){
					//console.log("이름확인");
					if($("input[name='user_email']").val()!=""){
						//console.log("이메일확인");
						//console.log("회원가입됨");
						return true;
						}
					}
				}
			}
		console.log("안돼");
		alert("누락값이 없는지 확인해주세요.");
		return false;
		}
	
		
	/*
	if(idchk==true && pwchk==true){
		if($("input[name='user_id']")!=""){
			console.log("아이디확인"); //여기까지 된다
		}else if(($("input[name='user_pw']").val()!="") && ($("input[name='user_pw2']").val()!="") && ($("input[name='user_pw']").val()==$("input[name='user_pw2']").val())){	
			console.log("비번확인");
		}else if($("input[name='user_name']").val()!=""){	
			console.log("이름확인");
		}else if($("input[name='user_email']").val()!=""){
			console.log("이메일확인");
		}else{
			console.log("회원가입됨");
			return true;
		}
		console.log("안돼");
		alert("누락값이 없는지 확인해주세요.");
		return false;
	*/
	

</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SCA Service</title>
		<style>
		</style>
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
	<!-- enctype="multipart/form-data" <-파일을 전송할땐 꼭 적어야 함 -->
		<form id = "fileUpload" action="upload" method="post" enctype="multipart/form-data">
			<input type="file" name="file" onchange="fileView(this)"/>
			<!-- onchange은 선택된 걸 변경했을 때 발생하는 이벤트입니다. 보기 중에 한개가 선택되었을 때 바로 이벤트가 발생 ! 즉 value값을 넘겨줍니다. -->
		</form>
	</body>
	<script>
		var filePath = "${path}"; //업로드 후 반환되는 업로드 경로
		console.log(filePath);
	
		//만약 업로드 한 파일이 있다면????
		if(filePath != ''){ 
			var content = "<img src='/${path}' width='250'/>";
			content +="<input id='${path}' type='button' value='삭제' onclick='del(this)'><br/>"; //해당 사진 삭제 버튼
			var elem = window.opener.document.getElementById('editable'); //writeForm 의 id=editable을 부른다.
			elem.innerHTML +=content; //그리고 그 안에 content 를 쓴다. 그리고 누적합을 해야지만 그밑에 추가가 됨 , 아니면 계속 새로 써지고 기존꺼는 지워짐
			self.close(); //현재 창을 닫는다.
		}
		
		function fileView(elem){
			var check = elem.value;
			//console.log(elem.value.split("\\"));
			//console.log(elem.value.split("\\")[2]); //IMG_0012.JPG
			var exp = check.substring(check.lastIndexOf('.')+1,check.length);
			console.log(exp);
			if(exp=='JPG'||exp=='PNG'||exp=='GIF'||exp=='jpg'||exp=='png'||exp=='gif'){
				$("#fileUpload").submit();
			}else{
				alert("jpg, png, gif 파일만 업로드 가능합니다.")
			}

		}
		
	
	</script>
</html>
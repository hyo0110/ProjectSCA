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
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
		/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
		/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/
		</style>
		<script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
	</head>
	<body>
		<form id = "fileUpload" action="upload" method="post" enctype="multipart/form-data">
			<input type="file" name="file" onchange="fileView(this)" style="text-align: center; border: 1px solid #dee2e6; font-family: 'Noto Sans KR', sans-serif;" class="btn btn-default"/>
		</form>
	</body>
	<script>
		var filePath = "${path}"; 
		console.log(filePath);

		if(filePath != ''){ 
			var content = "<img src='/${path}' width='250'/>";
			content +="&nbsp;&nbsp;<input id='${path}' type='button' value='삭제' onclick='del(this)' style='text-align: center;border: 1px solid #dee2e6; font-family: 'Noto Sans KR', sans-serif; font-size:18px;' class='btn btn-default btn-sm'><br/>"; //해당 사진 삭제 버튼
			var elem = window.opener.document.getElementById('editable'); 
			elem.innerHTML +=content; 
			self.close(); 
		}
		
		function fileView(elem){
			var check = elem.value;
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
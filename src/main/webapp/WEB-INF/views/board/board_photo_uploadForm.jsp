<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
		<link rel="stylesheet" href="resources/css/nav.css">
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
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body style="overflow-x: hidden;">

		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
		<div class="containerbox">
			<div class="snb_wrap">
				<ul class="snb_items">
					<li class="snb_item" style="background-color: #e8f0fe;"><a href="mypage_detail">회원정보</a></li>
					<li class="snb_item"><a href="mypage_scrap">스크랩</a></li>
					<li class="snb_item"><a href="mypage_written?page=1">글목록</a></li>
				</ul>
			</div>
			<div class="detail_wrap" style="border-radius:25px; border: 1px solid lightgray;">
				<div class="detail">
					<h3 style="text-align: center; margin-top: 40px; margin-bottom: 20px;">회원정보</h3>
					<p style="font-size:15px; text-align: center; margin-bottom: 20px;">회원정보는 개인정보처리방침에 따라 안전하게 보호되며,</br> 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</p>
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">아이디</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> ${member.id}</div>
					</div>
					<div style="width: 100%; height: 65px; border-bottom: 1px solid lightgray;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">이름</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> ${member.name}</div>
					</div>
					<div style="width: 100%; height: 65px; margin-bottom: 20px;">
						<div style="float: left; width: 20%; height:40%; margin-top: 20px; margin-left: 20px;">이메일</div>
						<div style="float: right; width: 70%; height:40%; margin-top: 20px;"> ${member.email}</div>
					</div>
					<div style="text-align: center; margin-top: 60px;">
						<button type="button" onclick="realdelete()" style="margin-right: 30px; border-radius: 10px;">탈퇴</button> <!-- 탈퇴여부 -->
						<button type="button" onclick="location.href='mypage_update'"style="border-radius: 10px;">수정</button>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>
function realdelete() {
	var realdelete = confirm("정말로 탈퇴하시겠습니까?");
	if(realdelete==true){
		location.href='deleteMember';
	}else{
		false;
	}
}

</script>
</html>
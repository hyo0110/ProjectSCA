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
</head>	
<body style="overflow-x: hidden;">
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	<div class="containerbox">
		<div class="mem-top-txt">
			<ul>
				<li>저희 SCA는 회원님의 개인정보를 신중히 취급하며,</br> 회원님의 동의없이 기재하신 회원정보를 공개하지
					않습니다.</li>
				<li>회원님의 개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 입력 해주세요.</li>
			</ul>
		</div>

		<div class="re_login_wrap">
			<form action="mypage_login" method="POST">
				<div class="login_title">
					<h3>비밀번호 재확인</h3>
				</div>
				<div class="login_input">
					<!-- 2행 2열 -->
					
					<table>
						<tr>
							<td>
								<label for="user_id">아이디</label>
							</td>
							<td>
								<input type="text"id="user_id" name="id" value="${loginid}" disabled />
							</td>
						</tr>
						<tr>
							<td><label for="user_pw">패스워드</label>
							</td>
							<td>
							<input type="password"id="user_pw" name="pw" />
						</td>
						</tr>
					</table>
			
				</div>
				<div class="login_btn">
					<button type="submit" id="loginbtn">로그인</button>
				</div>
			</form>
		</div>
	</div>	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>

</script>
</html>
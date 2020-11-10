<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-재로그인</title>
<style>
li {
	list-style: none;
	padding: 0;
	margin: 0;
	text-align: center;
}

.mem-top-txt {
	position: relative;
	width: 910px;
	top: 30px;
	left: 50%;
	margin-left: -455px;
	border-style: solid;
	border-width: 1px;
	border-color: #333 #dee3eb #dee3eb;
	background-color: #f8f8f8;
	padding: 20px 40px;
}

.containerbox {

	position: relative;
	width: 1920px;
	height: 900px;
}

.re_login_wrap {
	margin-top: 50px;
	margin-left: -455px;
	outline: 1px solid blue;
	height: 335px;
	position: relative;
	width: 910px;
	top: 30px;
	left: 50%;
	text-align: center;
	padding: 20px 72px;
}

h3 {
	text-align: center;
	margin: 0;
}

body {
	overflow: hidden;
	width: 100%;
	height: 100%;
}

.login_title {
	width: -webkit-fill-available;
	height: 80px;

	padding: 20px;
}

.login_input {
	width: -webkit-fill-available;
	height: 144px;

	padding: 20px;
}

.login_btn {
	width: -webkit-fill-available;
	height: 61px;

	padding: 20px;
}

label{
	width: 300px;
}
</style>

<script src="https://code.jquery.com/jquery-3.5.1.min.js">
	
</script>

</head>
<body style="overflow-x: hidden; overflow-y: hidden;">

	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>

	<div class="containerbox">
		<div class="mem-top-txt">
			<ul>
				<li>저희 000은 회원님의 개인정보를 신중히 취급하며, 회원님의 동의없이 기재하신 회원정보를 공개하지
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
					<input type="submit" value="로그인" />
				</div>
			</form>
		</div>
	</div>


</body>
</html>
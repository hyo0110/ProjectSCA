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
	border-color: lightgray;
	background-color: #f8f8f8;
	padding: 20px 40px;
}

.containerbox {
	font-family: 'Open Sans', sans-serif;
	position: relative;
	width: 1920px;
	height: 900px;
}

.re_login_wrap {
	margin-top: 50px;
	margin-left: -455px;
	outline: 1px solid lightgray;
	height: 335px;
	position: relative;
	width: 910px;
	top: 30px;
	left: 50%;
	text-align: center;
	padding: 20px 72px;
}

h3 {
	font-family: 'Open Sans', sans-serif;
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

label{
	width: 300px;
}

#footer	{
		position:absolute;
		bottom:0;
		text-align:center!important;
		width: -webkit-fill-available;
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
				<li>저희 SCA는 회원님의 개인정보를 신중히 취급하며, 회원님의 동의없이 기재하신 회원정보를 </br>공개하지
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
					<button type="submit" style="width: 120px; height: 40px; border: none; border-radius: 10px; color: white; background-color: #009fe3;">로그인</button>
				</div>
			</form>
		</div>
	</div>
	<!--Footer Links-->
   	<footer id="footer" class="page-footer text-center text-md-left pt-4">
    <div class="container-fluid">
      <div class="row">
        <!--First column-->
        <div class="col-md-3">
          <h5 class="text-uppercase font-weight-bold mb-4">Our Company</h5>
          <p>Our mission is to organize the commercial district information and make it universially accessible and useful </p>
        </div>
        <!--/.First column-->

        <hr class="w-100 clearfix d-md-none">

        <!--Second column-->
        <div class="col-md-2 mx-auto">
          <h5 class="text-uppercase font-weight-bold mb-4">Location</h5>
          <ul class="list-unstyled">
            <li>115, Gasan digital 2-ro, Geumcheon-gu, Seoul, Republic of Korea</li>
          </ul>
        </div>
        <!--/.Second column-->

        <hr class="w-100 clearfix d-md-none">

        <!--Third column-->
        <div class="col-md-2 mx-auto">
          <h5 class="text-uppercase font-weight-bold mb-4">About Us</h5>
          <ul class="list-unstyled">
            <li>Contacts</li>
            <li>Terms</li>
            <li>Condition</li>
            <li>Privacy Policy</li>
          </ul>
        </div>
        <!--/.Third column-->

        <hr class="w-100 clearfix d-md-none">

        <!--Fourth column-->
        <div class="col-md-2 mx-auto">
          <h5 class="text-uppercase font-weight-bold mb-4">FOLLOW US</h5>
          <ul class="list-unstyled">
            <li>Facebook</li>
            <li>Twitter</li>
            <li>Instargram</li>
            <li>RSS</li>
          </ul>
        </div>
        <!--/.Fourth column-->

      </div>
    </div>
    <!--/.Footer Links-->

    <hr>
    
    <!--Copyright-->
    <div class="footer-copyright py-3 text-center">
      <div class="container-fluid">
        © 2020 Copyright: <a href="http://localhost:8080/project">Goodeesite.com</a>
      </div>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->
	

</body>
</html>
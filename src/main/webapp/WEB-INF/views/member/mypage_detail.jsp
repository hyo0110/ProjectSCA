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
		font-family: 'Noto Sans KR', sans-serif;
		display : inline-block;
	}
	.snb_wrap {
		float : left;
	}
	.snb_items {
		width : 250px;
	}
	.snb_item {
		width : 250px;
		height: 40px;
		text-align : center;
		border\-radius: 0px 25px 25px 0px; 
	}
	.snb_item a {
		width : 140px;
		height: 40px;
		line-height : 40px;
		vertical-align : middle;
	}
	.snb_item:last-child {
		border-bottom : 0;
	}
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
	}
	button{
    	padding:13px 80px;
        font-size:17px;
        cursor: pointer;
        background-color: #009fe3;             
        color: white; 
        border: none;      
	}
	
	#footer{
		position:relative;
		top:530px;
		text-align:left!important;
	}

</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>

		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
		<div style="margin-top:50px; font-family: 'Noto Sans KR', sans-serif;">
			<div>
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
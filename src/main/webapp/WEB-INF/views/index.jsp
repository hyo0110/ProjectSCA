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

/*  	body {
	overflow: hidden;
	width: 100%;
	} 	 */
	.main_top{
	    width: 100%;
	    height: 300px;
	}
	.main_box{
		width: 1200px;
		height: 300px;
		/* outline: 1px solid black; */
		margin: 0 auto;
		margin-top: 200px;
		margin-bottom: 50px;
	}	
	.img1{
		margin-right: 85px;
	}
	.img2{
		margin-right: 85px;
	}	
	.img1:hover,.img2:hover,.img3:hover{
		opacity: 80%;
		cursor: pointer;
	}	
	.bar_scrap{
	position: fixed;
	width: 150px;
	height: 100px;
	top: 558px;
	right: 130px;
	outline: 1px solid red;
	}
	
	/* 확인하기위해 임시로 position:absolute  원래는 position:fixed */
	.bar_search{
	    position: absolute; 
	    width: 150px;
	    height: 200px;
	    top: 690px;
	    right: 130px;
	    outline: 1px solid blue;
	    background-color: white;
	}
	
	#scrap_cnt{
		margin: 10%;
	}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js">
	
</script>
</head>
<body style="overflow-x: hidden;">
<div class="main">
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
<%-- 	<h3>${sessionScope.loginid }</h3> --%>
	<div>
		<div class="main_top">
			<img src="resources/img/main.gif" style="width: 100%; position: absolute;">
			<p style="position: relative; top: 40%;  font-family: 'Noto Sans KR', sans-serif; font-size: 60px; font-weight: 700; left: 38%; color: #fff;">예비창업자를 도와</br>더 나은 경제를 만드는</br>서울상권분석입니다.</p>
			<!--진짜 세상 구리다 누가 간지나게 해줄사람 없나요  -->
		</div>
		<div class="main_box">
		    <img src="resources/img/service_explain.PNG" width="340px;" class="img1" onclick="location.href='service_explain'">
		    <img src="resources/img/what.PNG" width="340px;" class="img2" onclick="location.href='what'">
		    <img src="resources/img/where.PNG" width="340px;" class="img3" onclick="location.href='where'">
		</div>
		<div class="bar_menu">
		    <div class="bar_scrap">스크랩한 글 갯수
		    	<div id="scrap_cnt">	</div>
		    </div>
		    <div class="bar_search">최근 검색한 조건
		    	<div id="recent_search">  최근 검색한 조건이 없습니다. 	</div>
		    </div>
		</div>
	</div>
	
	<footer id="footer" class="page-footer text-center text-md-left pt-4" style="text-align:center!important;">
	<!--Footer Links-->
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
</div>



</body>

<script>

var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

var scrap_cnt = "${scrap_cnt}";
var loginid = "${sessionScope.loginid}";
	$(document).ready(function(){ // 문서가 로딩되면, 해당 아이디 스크랩 개수 가져오기
		$.ajax({
				url: "scrap_cnt",
				type:'get',
				data: {"loginid": loginid},
				dataType :'json',
				success:function(data){				
					console.log(data);
					$("#scrap_cnt").html("<h4>"+data.scrap_cnt+"/5 </h4>");
				},
				error: function(e){
					console.log(e);
				}
			});
		});

var recent_search = "${sessionScope.recent_search}";
	if(recent_search!=null){
		$("#recent_search").html("<h4>"+recent_search+"</h4>");
	}

</script>
</html>
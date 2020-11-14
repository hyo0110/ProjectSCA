<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
 <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
   	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<!-- iframe source  -->
	<!-- <script>
		function f_parent_call(){
			parent.f_move();
		}
	</script> -->
	<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/
	
	.btn{
		color: #0033CC;
	}
	.btn:hover{
			background-color: #009fe3;
			color:white;
		}
		
	.btn:active{
			background-color: #009fe3;
	}
	/* nav{
	border-bottom: 1px solid lightgray;
	} */
	</style>
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg" style="height: 80px; background-color: #FDFDFD;">
        <a class="navbar-brand" href="./"><img src="resources/img/logo.PNG"></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

          <ul class="navbar-nav mr-auto">

            <!-- <li class="nav-item active">
              <a class="nav-link" href="main">검색<span class="sr-only">(current)</span></a>
            </li> -->
			<li class="nav-item dropdown" style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; margin-right: 20px; margin-left: 30px;">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  검색
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="what">무엇을?</a>
                  <a class="dropdown-item" href="where">어디서?</a>
                </div>
            </li>

            <li class="nav-item dropdown" style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; margin-left: 20px; margin-right: 20px; ">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  마이페이지
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="mypage_login">회원정보</a>
                  <a class="dropdown-item" href="mypage_scrap">스크랩</a>
                  <a class="dropdown-item" href="mypage_written?page=1">내가 쓴 글</a>
                </div>
            </li>

            <li class="nav-item" style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; margin-left: 20px; margin-right: 20px; ">
              <a class="nav-link" href="typelist?type=0">자유게시판</a>
            </li>

            <li class="nav-item" style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; margin-left: 20px; ">
                <a class="nav-link" href="typelist?type=1">고객센터</a>
             </li>

          </ul>
          
         <c:choose>
            <c:when test="${sessionScope.loginid eq  null}">
            <button class="btn btn-default" onclick="location.href='index'" style="border: 1px solid #004c80; font-family: 'Noto Sans KR', sans-serif;">로그인</button>
            &nbsp;&nbsp;&nbsp;
            <button class="btn btn-default" onclick="location.href='joinForm'" style="border: 1px solid #004c80; font-family: 'Noto Sans KR', sans-serif;">회원가입</button>              
            </c:when>
            <c:otherwise>
            	${sessionScope.loginid}님 &nbsp;
               <button class="btn btn-default" onclick="location.href='logout'" style="border: 1px solid #004c80; font-family: 'Noto Sans KR', sans-serif;">로그아웃</button>
            </c:otherwise>
       </c:choose>
          
        </div>
    </nav>
    </body>
</html>
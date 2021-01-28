<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg">
        <a class="navbar-brand" href="./"><img src="resources/img/sca_logo.png"></a>
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
             <c:if test="${sessionScope.loginid eq 'admin'}">
              <li class="nav-item" style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; margin-left: 20px; ">
                <a class="nav-link" href="admin?type=0">자유게시판 관리</a>
             </li>
             
              <li class="nav-item" style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; margin-left: 20px; ">
                <a class="nav-link" href="admin?type=1">문의글 관리</a>
             </li>
             
              <li class="nav-item" style="font-family: 'Noto Sans KR', sans-serif; font-size: 18px; margin-left: 20px; ">
                <a class="nav-link" href="admin_member">회원 관리</a>
             </li>
		</c:if>
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
				<c:if test="${sessionScope.IdKinds eq  'K'}">
					&nbsp;&nbsp;&nbsp;
					<button class="btn btn-default" onclick="location.href='kaologout'" style="border: 1px solid #004c80; font-family: 'Noto Sans KR', sans-serif;">카카오 로그아웃</button>
					&nbsp;&nbsp;&nbsp;
					<form method="POST" action="disconnect">
	               		<button class="btn btn-default" type="submit" style="border: 1px solid #004c80; font-family: 'Noto Sans KR', sans-serif;">연결끊기</button>
	               </form>
				</c:if>
				<c:if test="${sessionScope.IdKinds eq  'N'}">
					&nbsp;&nbsp;&nbsp;
					<form method="POST" action="disconnect">
               			<button class="btn btn-default" type="submit" style="border: 1px solid #004c80; font-family: 'Noto Sans KR', sans-serif;">연결끊기</button>
               		</form>
				</c:if>
               
            </c:otherwise>
       </c:choose>
          
        </div>
    </nav>
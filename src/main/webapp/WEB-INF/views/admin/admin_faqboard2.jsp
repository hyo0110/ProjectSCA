<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<td>환영합니다. <spring:eval expression="@config['manager.id']" /> 님
</td>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/

.nav{

}
</style>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"> </script>

<!-- Custom fonts for this template -->
	<link href="resources/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
	<link href="resources/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body id="page-top">
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>	
 	<div id="wrapper">
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
			<div class="sidebar-brand-icon rotate-n-15">
          		<i class="fas fa-laugh-wink"></i>
			</div>
        <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
		</a>

      <!-- Divider -->
		<hr class="sidebar-divider my-0">
		
      <!-- Divider -->
      <hr class="sidebar-divider">

  	<!-- Nav Item - Tables -->
		<li class="nav-item active">
        	<a class="nav-link" href="admin_member">
          	<i class="fas fa-fw fa-table"></i>
          	<span>회원관리</span></a>
		</li>
	<!-- Nav Item - Tables -->
		<li class="nav-item active">
        	<a class="nav-link" href="admin">
          	<i class="fas fa-fw fa-table"></i>
          	<span>게시글관리</span></a>
      	</li>  
		</ul><!-- accordionSidebar ui박스 -->
     <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column"><!-- 게시판 div 박스입니다. -->
	<!-- Main Content -->
	<div id="content">
	<div class="card shadow mb-4">
		<div class="card-body">
		  <div class="table-responsive" style="white-space:nowrap; overflow:hidden;">
			<table class="table table-bordered" id="dataTable" width="100%;" cellspacing="0;">
			<tr>
				<th style="width:10%;">글번호</th>
				<th style="width:40%;">제목</th>
				<th style="width:10%;">작성자</th>
				<th style="width:10%;">작성일</th>
				<th style="width:10%;">조회수</th>
				<th style="width:10%;">삭제</th>
			</tr>
			<c:forEach items="${adminlist}" var="market_board">
				<tr>
					<td>${market_board.board_idx}</td>
					<td><a href="detail?idx=${market_board.board_idx}&type=${type}&pri=${market_board.private_bbs}&adminpage=${currPage}">
								${market_board.subject} [${market_board.com_total}]</a>
					</td>				
					<td>${market_board.id}</td>
					<td>${market_board.reg_date}</td>
					<td>${market_board.bHit}</td>
					<td><input type="button" onclick="ajaxCall(${market_board.board_idx})" value="삭제" id="Del" />
					</td>
				</tr>
			</c:forEach>
			</tr>
			</table>
			</div><!-- table-responsive 박스 -->
		</div>
	</div>
	   	<ul class="pagination" style="position: absolute; text-align:center; float:none; left:500px;">
      		<li class="page-item"><a class="page-link" href="./admin_faqboard?page=1"><span>처음</span></a></li>
			<li class="page-item"><a class="page-link" href="./admin_faqboard?page=${currPage-1}">Previous</a></li>
			<li class="page-item"><a class="page-link" href="./admin_faqboard?page=1">1</a></li>
			<li class="page-item"><a class="page-link" href="./admin_faqboard?page=2">2</a></li>
			<li class="page-item"><a class="page-link" href="./admin_faqboard?page=3">3</a></li>
			<li class="page-item"><a class="page-link" href="./admin_faqboard?page=4">4</a></li>
			<li class="page-item"><a class="page-link" href="./admin_faqboard?page=5">5</a></li>
			<li class="page-item"><a class="page-link" href="./admin_faqboard?page=6">6</a></li>
			<li class="page-item"><a class="page-link" href="./admin_faqboard?Page=${currPage+1}">Next</a></li>
		</ul>
        <footer id="footer" class="page-footer text-center text-md-left pt-4">

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
      </div><!-- content -->
      </div><!-- content-wrapper 박스 입니다. -->   
</div><!-- wrapper div입니다. -->
	<a class="scroll-to-top rounded" href="#page-top">
    	<i class="fas fa-angle-up"></i>
  	</a>
</body>
<script>
//삭제 버튼
	function ajaxCall(board_idx){
		
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
				url:"admindel",
				type:'GET',
				data:{'board_idx':board_idx},
				dataType:'JSON',
				success:function(d){	
					//디비랑 페이지가 삭제되지만 페이지 새로고침이 안된다.
					console.log("성공했니?");
					location.reload();//페이지 새로고침	
				},
				error:function(e){
					console.log(e);
				}
			});
		}else{
			("취소")
		}
	}
	
	
	var endPage = ${endPage};
	var end = ${end}; //오른쪽
	var start =${start}; //왼쪽
	var currPage = ${currPage}; //현재 페이지
	var listCount = ${listCount};

<!-- Bootstrap core JavaScript-->
  <script src="resources/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
  <script src="resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
  <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
  <script src="resources/js/demo/datatables-demo.js"></script>

	
</script>


</html>
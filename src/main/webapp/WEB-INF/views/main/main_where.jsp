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

	
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}

	#summary{
		margin: 15px;
	}
	
				#footer	{
		position:absolute;
		top:900px;
		text-align:center!important;
		width: -webkit-fill-available;
}
</style>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script> 
</head>
<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	<div id="summary">
		<ul>
			<li>이 검색은 최근 6개월(2020년 상반기) 기준으로 검색됩니다.</li>
			<li>적합한 결과가 2개 이상인 경우, 1개만 검색 결과로 나옵니다. (가나다 순)</li>
		</ul>
	</div>
	<div>
	  <form method="get" action="whereresult" onsubmit="return countcheck()">
	      <div id="age">
		      <h4>Age(최대 3개 선택 가능합니다)</h4>      
		      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_10" value="10">10대</label>
		      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_20" value="20">20대</label>
		      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_30" value="30">30대</label>
		      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_40" value="40">40대</label>
		      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_50" value="50">50대</label>
		      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_60" value="60">60대 이상</label>
		      <label><input class="age_total" onclick="CountChecked(this)" type="checkbox" name="age_total" value="total">전체</label>
	      		<input class="age" type="hidden" name="age_cnt" value=""/>
	      </div>
	      
	      <div id="day">
	       <h4>Day(최대 1개 선택 가능합니다)</h4>
	      <label><input class="day" onclick="CountChecked_2(this)" type="checkbox" name="day_1" value="mon_thu">월~목</label>
	      <label><input class="day" onclick="CountChecked_2(this)" type="checkbox" name="day_2" value="fri_sun">금~일</label>
	      <label><input class="day" onclick="CountChecked_2(this)" type="checkbox" name="day_total" value="day_total">전체</label>
	       </div>
	       
	       <div id="time">
	      <h4>Time(최대 3개 선택 가능합니다)</h4>
	      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_1" value="1">새벽(00~06)</label>
	      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_2" value="2">오전(06~11)</label>
	      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_3" value="3">점심(11~14)</label>
	      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_4" value="4">오후(14~17)</label>
	      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_5" value="5">저녁(17~21)</label>
	      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_6" value="6">밤(21~24)</label>
	      <label><input class="time_total" onclick="CountChecked_1(this)" type="checkbox" name="time_total" value="전체">전체</label>
	      <input class="time" type="hidden" name="time_cnt" value=""/>
	      </div>
	      
	      <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
	    </form>
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
	var maxChecked_age = 3;   //선택가능한 체크박스 갯수
	var totalChecked_age= 0; // 설정 끝
	
	var maxChecked_time = 3;   //선택가능한 체크박스 갯수
	var totalChecked_time= 0; // 설정 끝
	
	var maxChecked_day= 1;   //선택가능한 체크박스 갯수
	var totalChecked_day= 0; // 설정 끝
	
	 var age_total_chk = $("#age .age_total").is(":checked");
	 var time_total_chk = $("#time .time_total").is(":checked");
	

	function CountChecked(field) {

		    if (field.checked) // input check 박스가 체크되면 
		    	totalChecked_age += 1; // totalChecked 증가
		    else // 체크가 아니면
	    	totalChecked_age -= 1; // totalChecked 감소
	
			    if (totalChecked_age > maxChecked_age) { // totalchecked 수가 maxchecked수보다 크다면
			      //  alert ("age 항목은 최대 3개 까지만 가능합니다."); // 팝업창 띄움
			    field.checked = false;
			    totalChecked_age -= 1;
			    $(".age").prop('checked',false);
			    totalChecked_age = 0;
			    }		
	}
	
	function CountChecked_1(field) {
		
	    if (field.checked) // input check 박스가 체크되면 
	    	totalChecked_time += 1; // totalChecked 증가
	    else // 체크가 아니면
	    	totalChecked_time -= 1; // totalChecked 감소
	
	    if (totalChecked_time > maxChecked_time) { // totalchecked 수가 maxchecked수보다 크다면
	       // alert ("time 항목은 최대 3개 까지만 가능합니다."); // 팝업창 띄움
	    field.checked = false;
	    totalChecked_time -= 1;
	    $(".time").prop('checked',false);
	    totalChecked_time = 0;
	    
	    }
	}
	function CountChecked_2(field) {
		
	    if (field.checked) // input check 박스가 체크되면 
	    	totalChecked_day += 1; // totalChecked 증가
	    else // 체크가 아니면
	    	totalChecked_day -= 1; // totalChecked 감소
	
	    if (totalChecked_day > maxChecked_day) { // totalchecked 수가 maxchecked수보다 크다면
	        alert ("day 항목은 최대 1개 까지만 가능합니다."); // 팝업창 띄움
	    field.checked = false;
	    totalChecked_day -= 1;
	    $(".day").prop('checked',false);
	    totalChecked_day = 0;
	    
	    }
	}	
	// 3개 카테고리 다 선택해야 넘어가는 것 체크
/* 	$("#age .age").on("click", function(){
		var count_age = $("#age input:checked[type='checkbox']").length;
		console.log(count_age);
	});
	
	$("#time .time").on("click", function(){
		var count_time = $("#time input:checked[type='checkbox']").length;
		console.log(count_time);
	}); */	
	
	function countcheck(){
		var count_age = $("#age input:checked[type='checkbox']").length;
		var count_time = $("#time input:checked[type='checkbox']").length;
		var count_day = $("#day input:checked[type='checkbox']").length;		
		/* console.log(count_time);
		console.log(count_age);
		console.log(count_day); */		
		if(count_age!=0 && count_time!=0 && count_day!=0){
			$("#age input[type='hidden']").val(count_age);
			$("#time input[type='hidden']").val(count_time);
			return true;
		}else{
			alert("모든 항목을 체크해주세요");
			return false;
		}
	}

	// 전체선택시 다른 것 무효화
    $("#age").click(function(){
        var age_total_chk = $("#age .age_total").is(":checked");//.attr('checked');
        if(age_total_chk){
        	$("#age .age_total input").prop('checked', true);
        	//$("#age .age input").prop('checked', false);
        	$(".age").prop('checked',false);
        	}
    });

    $("#time").click(function(){
        var time_total_chk = $("#time .time_total").is(":checked");//.attr('checked');
        if(time_total_chk){
        	$("#time .time_total input").prop('checked', true);
        	//$("#age .age input").prop('checked', false);
        	$(".time").prop('checked',false);
        	}
    });

	
</script>
</html>
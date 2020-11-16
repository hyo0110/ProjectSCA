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

</style>
	<link rel="stylesheet" href="resources/css/main.css">
	<link rel="stylesheet" href="resources/css/main.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script> 
</head>
<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	
    	<div class="bar_menu">
		    <div class="bar_scrap"><span>스크랩 게시물</span>
		    	<div id="scrap_cnt"></div>
		    </div>
		    <div class="bar_search"><span>최근 검색한 조건</span>
		    	<div id="recent_search"> 
			</div>
		    </div>
		</div>
		
		
	<div class="where_container">
		<div id="summary">
			<ul>
				<li>* 이 검색은 최근 6개월(2020년 상반기) 기준으로 검색됩니다.</li>
				<li>* 적합한 결과가 2개 이상인 경우, 1개만 검색 결과로 나옵니다. (가나다 순)</li>
			</ul>
		</div>
		<div class="form_wrap">
		  <form method="get" action="whereresult" onsubmit="return countcheck()">
		      <div id="age">
			      <h4>연령별(최대 3개)</h4>      
			      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_10" value="10대">10대</label>
			      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_20" value="20대">20대</label>
			      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_30" value="30대">30대</label>
			      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_40" value="40대">40대</label>
			      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_50" value="50대">50대</label>
			      <label><input class="age" onclick="CountChecked(this)" type="checkbox" name="age_60" value="60대">60대 이상</label>
			      <label><input class="age_total" onclick="CountChecked(this)" type="checkbox" name="age_total" value="연령전체">전체</label>
		      	  <input class="age" type="hidden" name="age_cnt" value=""/>
		      </div>
		      
		      <div id="day">
			      <h4>요일별(최대 1개)</h4>
			      <label><input class="day" onclick="CountChecked_2(this)" type="checkbox" name="day_1" value="월~목">월~목</label>
			      <label><input class="day" onclick="CountChecked_2(this)" type="checkbox" name="day_2" value="금~일">금~일</label>
			      <label><input class="day" onclick="CountChecked_2(this)" type="checkbox" name="day_total" value="요일전체">전체</label>
		     </div>
		       
		      <div id="time">
			      <h4>시간별(최대 3개)</h4>
			      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_1" value="새벽">새벽(00~06)</label>
			      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_2" value="오전">오전(06~11)</label>
			      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_3" value="점심">점심(11~14)</label>
			      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_4" value="오후">오후(14~17)</label>
			      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_5" value="저녁">저녁(17~21)</label>
			      <label><input class="time" onclick="CountChecked_1(this)" type="checkbox" name="time_6" value="밤">밤(21~24)</label>
			      <label><input class="time_total" onclick="CountChecked_1(this)" type="checkbox" name="time_total" value="시간전체">전체</label>
			      <input class="time" type="hidden" name="time_cnt" value=""/>
		      </div>
		      <p><input type="submit" class="btn_where" value="검색"> <input type="reset" class="btn_where" value="Reset"></p>
		    </form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
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

    // ----------------------- 현재 스크랩한 개수 가져오기 ---------------------------
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
					$("#scrap_cnt").html("<h4><a href='mypage_scrap'>"+data.scrap_cnt+"/5</a></h4>");
				},
				error: function(e){
					console.log(e);
				}
			});
		});

   // ----------------------- 최근 검색한 것 리스트로 뽑아 누르면 이동하게 해주기 ---------------------------
	var recent_search = "${sessionScope.recent_search}";
	var research_content = "";
	//console.log(recent_search);
	
	if(recent_search!=''){	// 잘 받아오낭		
		var list = recent_search.split(", ");
		console.log(list);	
		var first = list[0].split("[")[1];
		var last = list[list.length-1].split("]")[0];
		var name = "";
		var value = "";
		var zero = "";
		
		if(list.length==1){ //--------검색한 게 한 개 이상 있을 때------------------
			zero = first.split("]")[0];
			console.log(zero);
			if(zero.indexOf("/*")!=-1){ // 조건 선택한거면				
				name = zero.split("/*")[0];
				console.log(name);	
				value = zero.split("/*")[1];
				research_content += '<a href="whereresult?'+value+'">* '+ name +'</a><br>';					
			}else{ // 지역선택한거면
				name = zero;
				value = zero;
				research_content += '<a href="whatresult?region='+value+'">* '+ name +'</a><br>';
			}
		}else{// 2~5일때 
			for(var i = 0; i<list.length; i++){
				if(i==0){ // 처음거
					if(first.indexOf("/*")!=-1){ // 조건 선택한거면
						
						name = first.split("/*")[0];
						console.log(name);	
					value = first.split("/*")[1];
						research_content += '<a href="whereresult?'+value+'">* '+ name +'</a><br>';					
					}else{ // 지역선택한거면
						name = first;
						value = first;
						research_content += '<a href="whatresult?region='+value+'">* '+ name +'</a><br>';
					}				
				}else if(i==list.length-1){ // 마지막거
					if(last.indexOf("/*")!=-1){ // 조건 선택한거면
						name = last.split("/*")[0];
						console.log(name);	
						value = last.split("/*")[1];
						research_content += '<a href="whereresult?'+value+'">* '+ name +'</a><br>';					
					}else{ // 지역선택한거면
						name = last;
						value = last;
						research_content += '<a href="whatresult?region='+value+'">* '+ name +'</a><br>';
					}				
				}else{//중간것들
					if(list[i].indexOf("/*")!=-1){ // 조건 선택한거면\
						name = list[i].split("/*")[0];
						console.log(name);	
						value = list[i].split("/*")[1];
						research_content += '<a href="whereresult?'+value+'">* '+ name +'</a><br>';
						}else{ // 지역선택한거면
						name = list[i];
						value = list[i];
						research_content += '<a href="whatresult?region='+value+'">* '+ name +'</a><br>';
					}				
				}
			}
		}
		
		$("#recent_search").html(research_content);
		
	}else{//---------검색한 게 없을 때------------------
		$("#recent_search").html("<h6>최근 검색한 조건이 없습니다.</h6>");
	}
	//--------------------------------------------------------------------------
	
</script>
</html>
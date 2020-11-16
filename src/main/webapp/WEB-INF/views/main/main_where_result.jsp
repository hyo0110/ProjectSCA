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
<link rel="stylesheet" href="resources/css/nav.css">
<link rel="stylesheet" href="resources/css/main.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/
	#condition{
		border: 1px solid black;
	    margin-top: 3%;
	    padding: 1%;
	    width: 50%;
	    margin-left: 10%;
	    font-family: 'Noto Sans KR', sans-serif;
	}
	#script_box{
		display: none;
	}
	#region{
		border: 1px solid black;
	    margin-top: 8%;
	    float: left;
	    margin-left: 20%;
	    width: 20%;
	    height: 300px;
	    text-align: center;
	    display: inline-block;
	}
	#sector{
		border: 1px solid black;
	    margin-top: 8%;
	    float: left;
	    margin-left: 3%;
	    width: 20%;
	    height: 300px;
	    text-align: center;
	    display: inline-block;
	}
	#scrap{
		border: 1px solid black;
	    display: inline-block;
	   	right: 5%;
	   	top: 13%;
	    margin-right: 3%;
	    z-index: 10;
	    position: fixed;
	}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<c:import url="../navi.jsp"></c:import>
	
   		<div class="bar_menu">
		    <div class="bar_scrap"><span>스크랩 게시물</span>
		    	<div id="scrap_cnt"></div>
		    </div>
		    <div class="bar_search"><span>최근 검색한 조건</span>
		    	<div id="recent_search"> 
			</div>
		    </div>
		</div>
	
		<div id="scrap">
			<button onclick='show()'> 결과 스크랩하기</button>
			<div id="script_box">
				스크랩 제목
				<input type="text" value="" id="sub">
				<button onclick='save()'>저장</button>
			</div>
		</div>
	
		<div id="condition" style="margin-top:80px;">
		선택하신 조건 (
			<c:if test="${param.age_10 ne null}">${param.age_10} </c:if>
			<c:if test="${param.age_20 ne null}">${param.age_20} </c:if>
			<c:if test="${param.age_30 ne null}">${param.age_30} </c:if>
			<c:if test="${param.age_40 ne null}">${param.age_40} </c:if>
			<c:if test="${param.age_50 ne null}">${param.age_50} </c:if>
			<c:if test="${param.age_60 ne null}">${param.age_60}이상 </c:if>
			<c:if test="${param.age_total ne null}">${param.age_total} </c:if>
			
			<c:if test="${param.day_1 ne null}">${param.day_1} </c:if>
			<c:if test="${param.day_2 ne null}">${param.day_2} </c:if>
			<c:if test="${param.day_total ne null}">${param.day_total} </c:if>
			
			<c:if test="${param.time_1 ne null}">${param.time_1}시간 </c:if>
			<c:if test="${param.time_2 ne null}">${param.time_2}시간 </c:if>
			<c:if test="${param.time_3 ne null}">${param.time_3}시간 </c:if>
			<c:if test="${param.time_4 ne null}">${param.time_4}시간 </c:if>
			<c:if test="${param.time_5 ne null}">${param.time_5}시간 </c:if>
			<c:if test="${param.time_6 ne null}">${param.time_6}시간 </c:if>
			<c:if test="${param.time_total ne null}">${param.time_total} </c:if>
			)으로 검색한 결과 
		</div>
		

		
		<div id="region">
			선택한 조건에 제일 부합하는 지역구는 <br/>
			<strong><a href="whatresult?region=${msg}" style="font-size: 18px;">${msg}</a></strong>
			입니다.
		</div>
		<div id="sector">
			${msg}에서 <br>
			가장 영업 인허가가 많이 된 외식업 분류는<br>
			<strong> ${Sectors} </strong> 입니다.
		</div>
		
	<c:if test="${fileName ne null and fileName ne ''}">
		<iframe src="/photo/${fileName}" width="70%" height="500px" style="border:none"></iframe>
	</c:if>

</body>
<script>
	function save(){
		var loginId = "${sessionScope.loginid }";
		var subject = $("#sub").val();
		var url = null;
		var param = "${param}";
		$.ajax({
			url : "scriptsave",
			type : 'get',
			data : {
			"subject" : subject,
			"param":param,
			"loginId":loginId,
			},
			dataType : 'json',
			success : function(data) {
			console.log(data);
					alert(data.msg);
					location.reload();
			},
			error : function(e) {
				console.log(e);
			}
	
		});
	}
	
	var toggle_target = document.getElementById('script_box');
	 function show(){
		 if(toggle_target.style.display == "none"){
			 toggle_target.style.display ="block";
		 }else{
			 toggle_target.style.display = "none";
		 }
	};
	
	
	
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
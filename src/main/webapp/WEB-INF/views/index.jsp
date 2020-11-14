<%@page import="java.util.HashMap"%>
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
		background-color: white;
	}
	.bar_search{
	    position: absolute;
	    background-color: white;
	    width: 150px;
	    height: 200px;
	    top: 690px;
	    right: 130px;
	    outline: 1px solid blue;
	}
	
	#scrap_cnt{
		margin: 10%;
	}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js">
	
</script>
</head>
<body style="overflow-x: hidden;">
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
<%-- 	<h3>${sessionScope.loginid }</h3> --%>
<div class="main">
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
		    	<div id="recent_search"> 
				</div>

 		    </div>
		</div>
	</div>
	</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>




</body>

<script>

	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
	}
	
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
				research_content += '<a href="whereresult?'+value+'">'+ name +'</a><br>';					
			}else{ // 지역선택한거면
				name = zero;
				value = zero;
				research_content += '<a href="whatresult?region='+value+'">'+ name +'</a><br>';
			}
		}else{// 2~5일때 
			for(var i = 0; i<list.length; i++){
				if(i==0){ // 처음거
					if(first.indexOf("/*")!=-1){ // 조건 선택한거면
						
						name = first.split("/*")[0];
						console.log(name);	
					value = first.split("/*")[1];
						research_content += '<a href="whereresult?'+value+'">'+ name +'</a><br>';					
					}else{ // 지역선택한거면
						name = first;
						value = first;
						research_content += '<a href="whatresult?region='+value+'">'+ name +'</a><br>';
					}				
				}else if(i==list.length-1){ // 마지막거
					if(last.indexOf("/*")!=-1){ // 조건 선택한거면
						name = last.split("/*")[0];
						console.log(name);	
						value = last.split("/*")[1];
						research_content += '<a href="whereresult?'+value+'">'+ name +'</a><br>';					
					}else{ // 지역선택한거면
						name = last;
						value = last;
						research_content += '<a href="whatresult?region='+value+'">'+ name +'</a><br>';
					}				
				}else{//중간것들
					if(list[i].indexOf("/*")!=-1){ // 조건 선택한거면\
						name = list[i].split("/*")[0];
						console.log(name);	
						value = list[i].split("/*")[1];
						research_content += '<a href="whereresult?'+value+'">'+ name +'</a><br>';
						}else{ // 지역선택한거면
						name = list[i];
						value = list[i];
						research_content += '<a href="whatresult?region='+value+'">'+ name +'</a><br>';
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
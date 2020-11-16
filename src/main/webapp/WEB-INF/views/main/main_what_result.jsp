<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				
			#result_section{
				margin: 3%;
			}
			
			#news_section{
				border : 1px solid darkblue;
				width: 400px;
				top: 110%;
				right: 4%;
				position: absolute;
				padding: 15px 5px;
				background-color: white;
			}
			
			.news_item{
				display: block;
				text-overflow: ellipsis;
				overflow: hidden;
				white-space: nowrap;
			}
	
			#standard{
				float:left;
			}
		
			#info_section{			
				float:left;
				margin: 20px;
			}
	
	
	</style>
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<c:import url="../navi.jsp"></c:import>
	
		<div id ="news_section">
			<ul id ="news_list"> </ul>
		</div>
		
    	<div class="bar_menu">
		    <div class="bar_scrap"><span>스크랩 게시물</span>
		    	<div id="scrap_cnt"></div>
		    </div>
		    <div class="bar_search"><span>최근 검색한 조건</span>
		    	<div id="recent_search"> 
			</div>
		    </div>
		</div>
		
		
		<div id="result_section" style="margin-top:80px;">
			<h3>${data.region}는... </h3>
					  ${data.best_day} , ${data.best_time}에 ${data.best_age} 유동인구가 가장 많습니다.
					이 곳의 음식점/카페 수는 ${data.mk_total }개 입니다. <br>
					
			<iframe id ="favorite" style="display:block; width:80vw; height: 400px" src="" frameborder="0"></iframe>			

		<div id="seemore"> <!-- 더보기버튼 -->
		    <input type="button" id="seemore_btn" value="더 많은 정보 보기" onclick="seemore()" />
		   	<div id="hide_section" style="display: none;"> 				
				  <div id="standard">
				  <label for="more_info"> 반기 선택 </label>
					  <select id="more_info" name="more_info" >
					    <option value=""> --- 선택하세요 --- </option>
					    <optgroup label="2020">
					      <option value="202001"> 2020 상반기</option>
					    </optgroup>
					    <optgroup label="2019">
					      <option value="201902"> 2019 하반기</option>
					      <option value="201901"> 2019 상반기</option>
					    </optgroup>
					    <optgroup label="2018">
					      <option value="201802"> 2018 하반기</option>
					      <option value="201801"> 2018 상반기</option>
					    </optgroup>
					    <optgroup label="2017">
					      <option value="201702"> 2017 하반기</option>
					    </optgroup>    
					  </select>
					  </div>
					<div id="more_info_section">
						<div id="info_section" >
						<!-- 해당구의 상권상태 부분 -->
							<div id="status"> </div>
						<!-- 영업종류 현황 부분 -->
							<iframe id ="openbiz" style="display:block; width:70vw; height: 70vh" src="" 	frameborder="0"></iframe>
						<!-- 나이별 유동인구 -->
							<iframe id ="ppl_age" style="display:block; width:60vw; height: 60vh" src="" 	frameborder="0"></iframe>
						<!-- 요일별 유동인구 -->
							<iframe id ="ppl_day" style="display:block; width:60vw; height: 60vh" src="" 	frameborder="0"></iframe>
						<!-- 시간별 유동인구 -->
							<iframe id ="ppl_time" style="display:block; width:60vw; height: 60vh" src="" 	frameborder="0"></iframe>
						
						
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
		
</body>

<script>

	var region = "${region}";
	
	$(document).ready(function(){ // 문서가 로딩되면, 바로 뉴스리스트와 망고 플레이트 주소
		//워드 클라우드 불러오기
		var favorite = "${data.mk_fav}";	
		var cloud_src = "resources/wordcloud/"+favorite;
		$("#favorite").attr('src',cloud_src);
		
		$.ajax({
				url: "newslist",
				type:'get',
				data:{"region":region	}, 
				dataType :'json',
				success:function(data){
					//div ="news_sectoin" 에다 가져온 애들을 넣어야함. console.log(data); console.log(data.title_1); console.log(data.link_1);
					$("#news_list").append("<li><a href='"+data.link_1+"' class = 'news_item'>"+data.title_1+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_2+"' class = 'news_item'>"+data.title_2+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_3+"' class = 'news_item'>"+data.title_3+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_4+"' class = 'news_item'>"+data.title_4+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_5+"' class = 'news_item'>"+data.title_5+"</a></li>");					 
					},
				error: function(e){
					console.log(e);
				}
			});
		});
	
	
	function seemore(){
		if($("#hide_section").attr('style','display="none"')){
			$("#hide_section").attr('style','display="block"');
			$("#seemore_btn").attr('type','hidden');
		}else{
			$("#hide_section").attr('style','display="none"'); 
			$("#seemore_btn").val('더보기');
			}
	}
	
	// 반기별 정보(상태, 유동인구, 업종분포표) 불러오기	
	// 콤보박스에서 선택을 한다 -> ajax로 선택한 값을 보낸다 -> 보낸 값을 받아서 div에 표시한다	
	var reg_date ="";
	var openbiz = "";	
	var openbiz_src = "";
	var age_html_src = "";
	var day_html_src = "";
	var time_html_src = "";

	$("select[name='more_info']").change(function(){
		reg_date = $("select[name='more_info']").val();
		console.log(reg_date);
		console.log('헿');
		$.ajax({
			url: "openbiz",
			type:'get',
			data:{
				"region": region,
				"reg_date": reg_date
			}, 
			dataType :'json',
			success: function(data){
				//console.log(data.status.data_code);
				//상권상태
				$("#status").html("<h3><strong><em>"+data.status.region+data.status.mk_status+"</em></strong></h3>"+
						"<br> 총 유동인구 수는 "+data.status.total_ppl_cnt+"명 입니다");
				//업종분포표
				openbiz = data.status.data_code;
				openbiz_src = "https://banana2990.github.io/onbusiness/"+openbiz+".html";
				console.log(openbiz_src);
				$("#openbiz").attr('src',openbiz_src);
				
				age_html_src = data.age_html;
				$("#ppl_age").attr('src',age_html_src);
				day_html_src = data.day_html;
				$("#ppl_day").attr('src',day_html_src);
				time_html_src = data.time_html;
				$("#ppl_time").attr('src',time_html_src);
				
				
				
				console.log("확인요");				
			},
			error: function(e){
				console.log("에러요");
			}
		});
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
					$("#scrap_cnt").html("<h4><a href='mypage_scrap'> ＊"+data.scrap_cnt+"/5</a></h4>");
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
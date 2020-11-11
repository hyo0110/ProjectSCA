<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>무엇을 결과 화면</title>
	<style>
			
			#result_section{
				margin: 3%;
			}
			
			#news_section{
				border : 1px solid darkblue;
				width: 400px;
				top: 15%;
				right: 4%;
				position: absolute;
				padding: 15px 5px;
			}
			
			.news_item{
				display: block;
				text-overflow: ellipsis;
				overflow: hidden;
				white-space: nowrap;
			}
	
	</style>
	<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<c:import url="../navi.jsp"></c:import>
	
		<div id ="news_section">
			<ul id ="news_list"> </ul>
		</div>
		
		<div id="result_section">
			<h3>${data.region}는... </h3>
					  ${data.best_day} , ${data.best_time}에 ${data.best_age} 유동인구가 가장 많습니다.
					이 곳의 음식점/카페 수는 ${data.mk_total }개 입니다. <br>
					
			<iframe id ="favorite" width="560" height="315" src="" 
			frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
			</iframe>			
		<!-- 더보기 버튼 만들어야함 -->
		
			<div id="more_info_section">
				  <label for="more_info">
					    반기 선택
				  </label>
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

					<div id="info_section" >
						<div id="status">
						</div>
					<!-- 영업종류 현황 부분 -->
						<iframe id ="openbiz" width="560" height="315" src="" 
						frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
						</iframe>
					</div>
					
			</div>
		</div>
		
		
</body>

<script>

	var region = "${region}";
	
	$(document).ready(function(){
		$.ajax({
				url: "newslist",
				type:'get',
				data:{
					"region":region
				}, 
				dataType :'json',
				success:function(data){
					//div ="news_sectoin" 에다 가져온 애들을 넣어야함.
					//console.log(data);
					//console.log(data.title_1);
					//console.log(data.link_1);
					
					$("#news_list").append("<li><a href='"+data.link_1+"' class = 'news_item'>"+data.title_1+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_2+"' class = 'news_item'>"+data.title_2+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_3+"' class = 'news_item'>"+data.title_3+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_4+"' class = 'news_item'>"+data.title_4+"</a></li>");
					$("#news_list").append("<li><a href='"+data.link_5+"' class = 'news_item'>"+data.title_5+"</a></li>");
					 
					},
				error: function(e){
					console.log(e)
				}
		});
		//워드 클라우드 불러오기
		var favorite = "${data.mk_fav}";	
		var cloud_src = "resources/wordcloud/"+favorite;
		$("#favorite").attr('src',cloud_src);
		
		});
	
	
	// 반기별 정보(상태, 유동인구, 업종분포표) 불러오기	
	// 콤보박스에서 선택을 한다 -> ajax로 선택한 값을 보낸다 -> 보낸 값을 받아서 div에 표시한다
	
	var reg_date ="";
	var openbiz = "";	
	var openbiz_src = "";

	$('select[name="more_info"]').change(function(){
		reg_date = $('select[name="more_info"]').val();
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
				$("#status").html("<h3>"+data.status.region+data.status.mk_status+"</h3>");
				//업종분포표
				openbiz = data.status.data_code;
				openbiz_src = "https://banana2990.github.io/onbusiness/"+openbiz+".html";
				console.log(openbiz_src);
				$("#openbiz").attr('src',openbiz_src);	
				console.log("확인요");				
			},
			error: function(e){
				console.log("에러요");
			}
		});
	});


</script>
</html>
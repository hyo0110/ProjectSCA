<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
		/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
		/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/

		@import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');
		
			.top_sub{
				 font-family: 'Open Sans', sans-serif; 
				 font-size: 40px; 
				 font-weight: bold; 
				 color: #2c81d0; 
				 text-align: center;
				 width: 900px;
				 height: 400px;
				 margin: 0 auto;
			}
			
			.ex{
				font-size: 15px;
				color: darkgray;
				font-weight: normal;
			}
		
		.container-fluid{
			width: 1000px;
		}
	
		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
	<div>
		<div class="top_sub" style="margin-top: 50px;">
			<img src="resources/img/seoulcity.PNG">
			<p>"SCA가 창업자들을 위해 다양한 상권분석을</br> 도와드립니다."</p>
			<p class="ex">우리 SCA는 서울이 보유하고있는 빅데이터를 수집,분석하여 창업자를 위해 다양한 정보를 제공합니다.</p>		
		</div>
		<div style="width: 900px; height: 500px; border-bottom: 1px solid lightgray; margin: 0 auto; margin-bottom: 40px; margin-top: 50px; text-align: center;">
			<p style="font-size: 20px; font-weight: 600; color: #2c81d0">어디서?</p>
			<p style="font-size: 13px; color: #4C4C4C; font-weight: 600;">'어디서?'는 이미 어떤 가게를 열지 정하신 예비 창업자가 참고하기 좋은 분석 자료 입니다.</br>
				무슨 데이터를 분석 가공하여 무슨 결과를 내서 이런 데이터를 보여줍니다. </p> 
			설명 및 예시 이미지
		</div>
		<div style="width: 900px; height: 500px; margin: 0 auto; margin-bottom: 40px; margin-top: 50px; text-align: center;">
			<p style="font-size: 20px; font-weight: 600; color: #2c81d0">무엇을?</p>
			<p style="font-size: 13px; color: #4C4C4C; font-weight: 600;">'무엇을?'는 이미 창업할 장소를 정하신 예비 창업자가 참고하기 좋은 분석 자료 입니다.</br>
				무슨 데이터를 분석 가공하여 무슨 결과를 내서 이런 데이터를 보여줍니다. </p>
		</div>
	</div>	
		
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/nav.css">
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
			<p>"SCA가 창업자들을 위해 <br> 서울 식음료 상권분석을 도와드립니다."</p>
			<p class="ex">저희 SCA는 서울내 외식업 관련 데이터를 수집 및 분석하여 예비 창업자를 위한 여러 정보를 제공합니다.</p>		
		</div>
		<div style="width: 900px; height: 500px; border-bottom: 1px solid lightgray; margin: 0 auto; margin-bottom: 40px; margin-top: 50px; text-align: center;">
			<p style="font-size: 20px; font-weight: 600; color: #2c81d0">어디서?</p>
			<p style="font-size: 13px; color: #4C4C4C; font-weight: 600;">
			'어디서?'는 이미 어떤 가게를 열지 정하신 예비 창업자가 참고하기 좋은 분석 자료 입니다.<br/>
			서울시가 제공한 유동인구, 집객시설정보, 상권변화지표, 식음료 부분 인허가 정보 데이터를 분석 가공하여<br/> 
			해당 지역의 상권 상태와 수요예상 계층을 보여주는 자료입니다. </p> 
			<div><img src = ""></div>
		</div>
		<div style="width: 900px; height: 500px; margin: 0 auto; margin-bottom: 40px; margin-top: 50px; text-align: center;">
			<p style="font-size: 20px; font-weight: 600; color: #2c81d0">무엇을?</p>
			<p style="font-size: 13px; color: #4C4C4C; font-weight: 600;">
			'무엇을?'는 이미 창업할 장소를 정하신 예비 창업자가 참고하기 좋은 분석 자료 입니다.<br/>
			나이대, 요일, 시간대를 선택하면 해당 시간대에 각 구별 유동인구를 분석하여 <br/>
			가게를 열기에 가장 적합한 지역구를 나타내줍니다. </p>
			<div> <img src = ""> </div>
		</div>
	</div>	
		
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>
</script>
</html>
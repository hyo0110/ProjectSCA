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
	   	top: 10%;
	    margin-right: 3%;
	    z-index: 10;
	    position: fixed;
	}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<c:import url="../navi.jsp"></c:import>
		<div id=condition>
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
		</div>
		
		<div id="scrap">
			<button onclick=show()>스크랩하기</button>
			<div id="script_box">
				스크랩 제목
				<input type="text" value="" id="sub">
				<button onclick=save()>저장</button>
			</div>
		</div>
		
		<div id="region">
			<strong><a href="whatresult?region=${msg}" style="font-size: 18px;">${msg}</a></strong>
		</div>
		<div id="sector">
			${Sectors}
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
	
	 function show(){
		$("#script_box").css("display","block");
	}

</script>
</html>
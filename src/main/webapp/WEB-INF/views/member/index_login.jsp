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

.col{
         width: 500px;
         height: 800px;
         position: absolute;
         left: 50%;
         top: 50%;
         transform: translate(-50%,-50%);
         text-align: center;
         font-family: 'Noto Sans KR', sans-serif;
   	}
   
    p{
        margin-top: 50px;
        margin-bottom: 70px;
        font-size: 70px;
        font-weight: bold;
    } 
    
    input{
        margin-top: 30px;
        width: 270px;
        height: 40px;
        border:0px;
        border-bottom:1px solid lightgray;
        margin-bottom:15px;
        padding: 8px 5px;
        font-size: 18px;
    }
    
    .btnbox{
        text-align: center;
    }
    
    .btn{
            border:1px solid #009fe3;
            color: #009fe3;
            padding:13px 120px;
            font-size:17px;
            border-radius:20px;
            background-color:white;
            cursor: pointer;
            width: 310px;
    		height : 48px;
            
            }
            
    button:hover {
          opacity: 0.8;
          background-color:#009fe3;
          color: white; 
        }        
            
    #loginbtn       {
        margin-top: 70px;
        margin-bottom: 30px;
    } 
    
    #confView{
    	margin-top : 30px;
    }
   .img {
  	 	width: 310px;
    	height : 48px;
    	border : 1px solid #009fe3;
    	border-radius: 10px;
   }

</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.kakaoId eq  null}">
	        <div class="col">
	            <p class="display-4 text-dark font-weight-bold">Welcome</p>
	
	            <form action="login" method="POST" class="form">
	                <div>
	                    <div>
	                        <div><input type="text" name="id" placeholder="ID"/></div>
	                    </div>
	                    <div>
	                        <div><input type="password" name="pw" placeholder="Password"/></div>
	                    </div>
	                    <div class="btnbox">
	                            <button type="submit" value="Login" class="btn" id="loginbtn">Login</button>
	                    </div>
	                </div>
	            </form> 
	            <button type="button" id="signUp" value="Sign up" onclick="location.href='joinForm'" class="btn">Sign in</button>
	            <button type="button" id="confView" class="btn" onclick="confView(this)">Social</button>
	        </div>
        </c:when>
        <c:otherwise>
	        <div class="col">
		            <p class="display-4 text-dark font-weight-bold">Disconnection</p>
	        		<form action="MemberConnect" method="POST" class="form">
		                <div>
		                    <div>
		                        <div><input type="text" name="id" placeholder="ID"/></div>
		                    </div>
		                    <div>
		                        <div><input type="password" name="pw" placeholder="Password"/></div>
		                    </div>
		                    <div class="btnbox">
		                            <button type="submit" value="Login" class="btn" id="loginbtn">Login</button>
		                    </div>
		                </div>
		            </form> 
		            <button type="button" id="signUp" value="Sign up" onclick="location.href='joinForm'" class="btn">Sign in</button>
		        </div>
        </c:otherwise>
	</c:choose>
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
    }
	
	
	/*
	 * accessCode : sns 인가 코드 접근
	 * IdKInds : SNS 구분 key(ex : K(카카오), N(네이버), G(구글))
	 * val : 각 버튼의 해당하는 값
	 */
     function accessCode(val){
    	var IdKinds = val;
    	 $.ajax({
    		url : "AcsCode",
    		type :"get",
    		data :{
    			"IdKinds": IdKinds,
    		},
    		dataType:'json',
    		success:function(data){
    			location.href=data.reqURL;
    		},
    		error:function(e){
    			alert('접근할 수 없습니다.');
    		}
    	});
    }
	
	/*
	 *	confView : 소셜 로그인 버튼 생성 함수
	 *	btn         : Social 버튼
	 * .col         : div 
	 */
	function confView(btn){
		$(".col").append('<a href=\"javascript:accessCode(\'K\');\"><img class="img" src="resources/img/kakao_login_medium_narrow.png" style="margin-top:30px;"></a>');
		$(".col").append('<a href=\"javascript:accessCode(\'N\');\"><img class="img" src="resources/img/네이버 아이디로 로그인_완성형_Green.PNG" style="margin-top:30px;"></a>');
		$("#confView").remove();
    }
	

</script>
</html>
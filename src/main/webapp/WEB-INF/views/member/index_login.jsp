<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<style>
.col{
                width: 500px;
                height: 700px;
                position: absolute;
                left: 50%;
                top: 50%;
                transform: translate(-50%,-50%);
                text-align: center;
            }
    h1{
        margin-top: 50px;
        margin-bottom: 70px;
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
            background-color:#0064FF;
            color:white;
            padding:13px 150px;
            color:#fff;
            font-size:17px;
            border-radius:25px;
            border: none;
            cursor: pointer;
            }
            
    button:hover {
          opacity: 0.8;
        }        
            
    #loginbtn       {
        margin-top: 70px;
        margin-bottom: 30px;
    } 

</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	
        <div class="col">
            <h1 class="display-4 text-dark font-weight-bold">Welcome 만약 로고가잇다면 로고를 넣는것이 좋을지도</h1>

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
                            <button type="button" value="Sign in" onclick="location.href='joinForm'" class="btn">Sign in</button>
                    </div>
                </div>
            </form> 
        </div>

</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
		}
	
</script>
</html>
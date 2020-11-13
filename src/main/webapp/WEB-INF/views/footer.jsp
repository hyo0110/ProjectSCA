<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		
 #footerBox{ /*footer에는 relative를 주면 안됨*/
    margin-top: 80px;
   width: 100%; height: 200px;
   background-color:white;
   bottom: 0;
}


#footerBox>#infoBox{
   position: relative; /*부모*/
   width: 1600px; height: 200px;
   margin:0 auto;
}

#infoBox address{
   position: absolute;
   color: #555;
   font: 0.9rem/180% 'NanumGothic';
   width: 50%; height: 50px
    top:50%; left:50%;
    transform:translate(-50%, -50%);
    bottom:0px;
    text-align: center;
}

		</style>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<footer id="footerBox"> <!--#########width:100% footer시작-->
	<hr style="margin: 0 0;">
   <section id="infoBox"> <!--@@width:1100px infoBox시작 -->


      <address>
         08505 서울시 금천구 가산디지털2로 115, 509호,811호(가산동, 대륭테크노타운3차) 대표 공효진 <br> 이메일 mastereum@sca.net FAX.02-6740-4949<br>고객상담센터 1577-4410 COPYRIGHT ⓒ 2020 SCA. ALL RIGHT RESERVED.
      </address>

   </section><!--@@@@@@@@@@@@@@infoBox끝 -->
</footer><!--###################################footer끝 -->
</body>
<script>
</script>
</html>
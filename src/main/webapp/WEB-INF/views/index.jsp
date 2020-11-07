<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MRS</title>
<style>
	.lnb_items {
	width : 560px;
	height : 40px;
	display: inline-block;
	border : 1px solid #3d3d3d;
	}
	.lnb_item {
		width : 24.8%;
		height : 40px;
		border-right : 1px solid #3d3d3d;
		float : left;
		text-align:center;
	}
	.lnb_item:last-child { /* lnb 중에 마지막 요소 */
		border-right: 0;
	}
	.lnb_item a {
		width : 100%;
		height : 40px;
		color : #3d3d3d;
		text-align:center;
		line-height : 40px;
		vertical-align : middle;
	}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
	<c:import url="navi.jsp"></c:import>
	

<h3>${sessionScope.loginid }</h3>


</body>

<script>
/* 이렇게 주면 로그인/ 로그아웃 할때마다 뜸
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}
*/

</script>
</html>
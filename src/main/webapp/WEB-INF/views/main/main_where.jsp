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
	#summary{
		margin: 15px;
	}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>
<c:import url="../navi.jsp"></c:import>
<div id="summary">
	<ul>
		<li>이 검색은 최근 6개월(2020년 상반기) 기준으로 검색됩니다.</li>
		<li>적합한 결과가 2개 이상인 경우, 1개만 검색 결과로 나옵니다. (가나다 순)</li>
	</ul>
</div>
<div>
  <form method="get" action="whereresult">
      <p>age</p>
      <label><input type="checkbox" name="age_10" value="10">10대</label>
      <label><input type="checkbox" name="age_20" value="20">20대</label>
      <label><input type="checkbox" name="age_30" value="30">30대</label>
      <label><input type="checkbox" name="age_40" value="40">40대</label>
      <label><input type="checkbox" name="age_50" value="50">50대</label>
      <label><input type="checkbox" name="age_60" value="60">60대 이상</label>
      <label><input type="checkbox" name="age_total" value="total">전체</label>
      <!-- <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p> -->
      
       <br/><br/><p>day</p>
      <label><input type="radio" name="day" value="mon_thu">월~목</label>
      <label><input type="radio" name="day" value="fri_sun">금~일</label>
      
      <p>time</p>
      <label><input type="checkbox" name="time_1" value="1">새벽(00~06)</label>
      <label><input type="checkbox" name="time_2" value="2">오전(06~11)</label>
      <label><input type="checkbox" name="time_3" value="3">점심(11~14)</label>
      <label><input type="checkbox" name="time_4" value="4">오후(14~17)</label>
      <label><input type="checkbox" name="time_5" value="5">저녁(17~21)</label>
      <label><input type="checkbox" name="time_6" value="6">밤(21~24)</label>
      <label><input type="checkbox" name="time_total" value="전체">전체</label>
      <p><input type="submit" value="Submit"> <input type="reset" value="Reset"></p>
    </form>
</div>



</body>
<script>

</script>
</html>
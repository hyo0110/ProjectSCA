<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SCA Service</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
/* font-family: 'Do Hyeon', sans-serif; 쓸 때 이것만 넣어주세요 제목 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
/* font-family: 'Noto Sans KR', sans-serif;  쓸 때 이것만 넣어주세요 이건 글 폰트*/

#footerBox{ /*footer에는 relative를 주면 안됨*/
    margin-top: 80px;
   width: 100%; height: 200px;
   background-color:white;
   bottom: 0;
}


#footerBox>#infoBox{
   position: relative; /*부모*/
   width: 1600px; 
   height: 200px;
   margin:0 auto;
}

#infoBox address{
   position: absolute;
   color: #555;
   font: 0.9rem/180% 'NanumGothic';
   width: 50%; 
   height: 50px;
    top:50%; 
    left:50%;
    transform:translate(-50%, -50%);
    bottom:0px;
    text-align: center;
}

</style>
	 
</head>
<body style="overflow-x: hidden;">
		<jsp:include page="/WEB-INF/views/navi.jsp"></jsp:include>
		<h1 style="position: relative; margin-top: 1%; left:20px; font-family: 'Noto Sans KR', sans-serif;">관리자페이지</h1>
		
			<div class="col-md-6" style="position: relative; max-width: 95%; left: 2%; margin-top: 1%; font-size: 15px; margin-bottom: -16px; ">
				  <table class="table table-hover table-bordered">
					<thead style=" font-family: 'Noto Sans KR', sans-serif; font-size: 25px;">
						<tr>
							<th style="width: 20%; text-align: center;">아이디</th>
							<th style="width: 15%; text-align: center;">이름</th>
							<th style="width: 30%; text-align: center;">이메일</th>
							<th style="width: 10%; text-align: center;">회원탈퇴</th>
						</tr>
					</thead>
					<tbody id="boardList" style="font-family: 'Noto Sans KR', sans-serif; font-size: 17px;">
						<!--  리스트 출력 -->
					</tbody>
				</table>
			</div>
			<div style="width: 1780px;left: 52px;background-color:#F6F6F6;height: 25px;position: relative;padding-right: 5px;padding-left: 5px; margin-bottom: 1%;"></div>
			
			<div class="container"   style="position: absolute; left: 38%;">
				<nav arial-label="Page navigation" style="text-align: center">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>



</body>

<footer id="footerBox"> <!--#########width:100% footer시작-->
	<hr style="margin: 0 0;">
   <section id="infoBox"> <!--@@width:1100px infoBox시작 -->


      <address>
         08505 서울시 금천구 가산디지털2로 115, 509호,811호(가산동, 대륭테크노타운3차) 대표 공효진 <br> 이메일 mastereum@sca.net FAX.02-6740-4949<br>고객상담센터 1577-4410 COPYRIGHT ⓒ 2020 SCA. ALL RIGHT RESERVED.
      </address>

   </section><!--@@@@@@@@@@@@@@infoBox끝 -->
</footer><!--###################################footer끝 -->

<script>

	listCall(1);
	
	function listCall(page) {
		var ppn = 10;
		$.ajax({
			url : "membercall",
			type : 'get',
			data : {
				"ppn" : ppn,
				"page" : page,
			},
			dataType : 'json',
			success : function(data) {
				listPrint(data.list);
				console.log(data.range);
				//플러그인 사용
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작페이지
					totalPages:data.range, //만들 수 있는 총 페이지 수
					visiblePages: 5, //보여줄 페이지 수 
					onPageClick:function(event,page){ //event : 해당 이벤트 객체 / page : 내가 몇 페이지 클릭 했는지
						listCall(page);
					}
				});
			},
			error : function(e) {
				console.log(e);
			}

		});
	}

	function listPrint(list) {
		//console.log(list); //5개만 배열로 찍힘
		var content="";
		var id ="";
		list.forEach(function(item) {
			id = item.id;
			content += "<tr>";
			content += "<td style='text-align: center; '>" + item.id + "</td>";
			content += "<td style='text-align: center;'>" + item.name + "</td>";
			content += "<td style='text-align: center;'>" + item.email + "</td>";
			content += "<td><input type='button' onclick='ajaxCall(this)' value='탈퇴' data-string='"+item.id+"' class='selectid'/></td>";
			
			content += "</tr>";
		});
		$("#boardList").empty();
		$("#boardList").append(content);
		content = ""; 
		
	};

	var msg = "${msg}";
	if (msg != "") {
		alert(msg);
	};
	
	//삭제 버튼
	function ajaxCall(id) {
		var selectid = $(id).attr("data-string");
		//console.log(selectid);
		if(confirm('삭제하시겠습니까?')){			
			$.ajax({
				url:"adminmemberdel",
				type:'GET',
				data:{'id':selectid},
				dataType:'JSON',
				success:function(d){	
					//디비랑 페이지가 삭제되지만 페이지 새로고침이 안된다.
					console.log("성공했니?");
					location.reload();//페이지 새로고침	
				},
				error:function(e){
					console.log(e);
				}
			});
			
		}else{
			("취소");
		};		
	};
	
		

	
</script>
</html>
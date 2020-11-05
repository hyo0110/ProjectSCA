<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
      <style>
         table,th,td{
         border: 1px solid black;
         padding: 10px;
         border-collapse: collapse;
         margin: 5px;
         text-align: center;
         }
      
         th{
         border-bottom: 1px solid 5px;
         }
         
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
      <script src = "https://code.jquery.com/jquery-3.5.1.min.js"></script>
   </head>
   <body>
     <div class="doc_wrap">
		<div class="lnb_wrap">
		<ul class="lnb_items">
			<li class="lnb_item"><a href="main">검색</a></li>
			<li class="lnb_item"><a href="mypage_login">마이페이지</a></li>
			<li class="lnb_item"><a href="typelist?type=0">게시판</a></li>
			<li class="lnb_item"><a href="typelist?type=1">고객센터</a></li>
		</ul>
		</div>
	</div>
	
        <c:choose>
            <c:when test="${sessionScope.loginid eq  null}">
               <button onclick="location.href='index'">로그인</button>
            </c:when>
            <c:otherwise>
               <button onclick="location.href='logout'">로그아웃</button>
            </c:otherwise>
       </c:choose>
       
      <p>${count}개의 글이 있습니다. </p>
      <table>
         <thead>
            <tr>
               <th>글번호</th>
               <th>제목</th>
               <th>작성자</th>
               <th>작성일</th>
               <th>조회수</th>
            </tr>   
         </thead>
         <tbody>
            <c:forEach items="${list}" var="bbs">
               <tr>
               <td>${bbs.board_idx}</td>
               <td>
                  <a href="detail?idx=${bbs.board_idx}&type=${type}&pri=${bbs.private_bbs}">${bbs.subject}</a>
               </td>
               <td>${bbs.id}</td>
               <td>${bbs.reg_date}</td>
               <td>${bbs.bHit}</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <form action="opSearch" method="GET">
         <select name="search_option">
            <option value="all" <c:if test="${search_option == 'all'}"></c:if>>제목+내용</option>
            <option value="title"<c:if test="${search_option == 'title'}"></c:if>>제목</option>
            <option value="content" <c:if test="${search_option == 'content'}"></c:if>>내용</option>
         </select>
         <input type="text" name="keyword" value="${keyword}"/>
         <input type="submit" value="검색"/>
         <input type="hidden" name="type" value="${type}"/>
      </form>
      <button onclick="location.href='writeForm?type=${type}'">글쓰기</button>
      </body>
   <script>
   
      var msg = "${msg}";
      if(msg !=""){
         alert(msg);
      }
      
   </script>
   </html>
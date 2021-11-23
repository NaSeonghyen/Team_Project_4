<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--페이지 제목-->
	<title>OT4ZO - 공지사항</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/noticelist.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
 	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>    
	<!-- 20211101 위재림 공지사항 상세 보기 수정 -->
	<section>
		<div class="board_wrap">
			<li id="notice_image"></li>
            <div class="board_title"><h2 id ="notice_title">공지사항</h2></div>
          	<div id="category_wrap"></div>         
          	<!--Q&A 게시판 부분-->
          	<div class="board_table_wrap">
            	<div class="board_table">
              		<div class="board_table_head">
		                <div class="num">번호</div>
		                <div class="tit">제목</div>
		                <div class="writer">작성자</div>
		                <div class="date">작성일</div>
		                <div class="hit">조회</div>
              		</div>
		            <c:forEach items="${ndvos}" var="ndvo">
		            	<div class="board_table_body">
                			<div class="item">
                  				<div class="num">${ndvo.nId}</div>
                  				<div class="tit">
                  					<c:forEach begin="1" end="${ndvo.nIndent}">-</c:forEach>
									<a href="Ot4zoServlet?command=notice_view&nId=${ndvo.nId}&page=${nPageDvo.currentPageNum}&pageDataCount=${nPageDvo.pageDataCount}">${ndvo.nTitle}</a>
								</div>
			                   <div class="writer">${ndvo.nAdminID}</div>
			                   <div class="date">${ndvo.nDate}</div>
			                   <div class="hit">${ndvo.nHit}</div>
                			</div>			
              			</div> <!--board_table-body-->
              		</c:forEach>
            	</div> <!--board_table-->
	            <form action="Ot4zoServlet" method="get">
			 		<input type="hidden" name="command" value="notice_search">
            		<!--검색 및 글쓰기 부분-->
              		<div class="search_write">
                		<select name="f">
			                <option ${(param.f =="nTitle")?"selected":""} value="nTitle" selected>제목</option>
			                <option ${(param.f =="nContent")?"selected":""} value="nContent">내용</option>
                		</select>              
		                <input type="text" name="keyword" value="${param.keyword}" />
		                <input type="submit" id="search_btn" value="검색"> 
					</div>               
				</form> 
			</div> <!--search-->
		</div> <!--board_table-wrap-->
		<br> <br> <br> <br> <br> <br>
        <!--페이지 표시 부분-->
        <div class="page-list">
			<ul>
				<li> <a href ="Ot4zoServlet?command=notice_list&page=${nPageDvo.firstPageNum}&pageDataCount=${nPageDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="button first">&lt;&lt;</a></li>
				<li> <a href ="Ot4zoServlet?command=notice_list&page=${nPageDvo.prevPageNum}&pageDataCount=${nPageDvo.pageDataCount}" class="button prev">&lt;</a></li>
				<c:forEach var="i" begin="${nPageDvo.startPageNum}" end="${nPageDvo.endPageNum}" step="1">
					<c:choose>
						<c:when test="${i eq nPageDvo.currentPageNum}">
							<li> <a href ="Ot4zoServlet?command=notice_list&page=${i}&pageDataCount=${nPageDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="btn num">${i} </a> </li>
						</c:when>
						<c:otherwise>
							<li> <a href ="Ot4zoServlet?command=notice_list&page=${i}&pageDataCount=${nPageDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="btn num">${i} </a> </li>    
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li> <a href ="Ot4zoServlet?command=notice_list&page=${nPageDvo.nextPageNum }&pageDataCount=${nPageDvo.pageDataCount}" class="button next">&gt;</a></li>
				<li> <a href ="Ot4zoServlet?command=notice_list&page=${nPageDvo.lastPageNum }&pageDataCount=${nPageDvo.pageDataCount}" class="button last">&gt;&gt;</a></li>
			</ul>
		</div>
	</section>
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>        
</body>
</html> 
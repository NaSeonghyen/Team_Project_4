<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	
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
	<section>
		<div class="board_wrap">
			<div class="title"><h2>OT4ZO 공지사항</h2></div>
			<div>
            	<h3 id ="sub_tit">공지사항</h3>
       		</div>
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
									<a href="Ot4zoServlet?command=notice_viewAdmin&nId=${ndvo.nId}&page=${nSearchDvo.currentPageNum }&pageDataCount=${nSearchDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}">${ndvo.nTitle}</a>
								</div>                 		
								<div class="writer">${ndvo.nAdminID}</div>
								<div class="date">${ndvo.nDate}</div>
								<div class="hit">${ndvo.nHit}</div>
							</div>			
						</div> <!--board_table-body-->
					</c:forEach>
           		</div> <!--board_table-->
            	<form action="Ot4zoServlet" method="get">
			 		<input type="hidden" name="command" value="noticeAdmin_search">
            		<!--검색 및 글쓰기 부분-->
              		<div class="search_write">
                		<select name="f">
                  			<option ${(param.f =="nTitle")?"selected":"" } value="nTitle" selected>제목</option>
                  			<option ${(param.f =="nContent")?"selected":"" } value="nContent">내용</option>
                		</select>              
		                <input type="text" name="keyword" value="${param.keyword}" />
		                <input type="submit" id="search_btn" value="검색">                
				</form> 
			</div> <!--search-->
            <div id="write">
            	<input type="button" class="insert_btn" value="공지등록"onclick="location.href='Ot4zoServlet?command=notice_write_form'">
            </div> <!--write-->
		</div> <!--board_table-wrap-->
		<br> <br> <br> <br> <br> <br>
		<!--페이지 표시 부분-->
		<div class="page-list">
			<ul>
				<li> 
					<a href ="Ot4zoServlet?command=notice_search&page=${nSearchDvo.firstPageNum }&pageDataCount=${nSearchDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="button first">&lt;&lt;</a>
				</li>
                <li> <a href ="Ot4zoServlet?command=notice_search&page=${nSearchDvo.prevPageNum }&pageDataCount=${nSearchDvo.pageDataCount}" class="button prev">&lt;</a>
                </li>
                <c:forEach var="i" begin="${nSearchDvo.startPageNum }" end="${nSearchDvo.endPageNum }" step="1">
                	<c:choose>
                    	<c:when test="${i eq nSearchDvo.currentPageNum }">
                        	<li> 
                        		<a href ="Ot4zoServlet?command=notice_search&page=${i } &pageDataCount=${nSearchDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="btn num">${i}</a> 
                        	</li>
						</c:when>
						<c:otherwise>
                        	<li> 
                        		<a href ="Ot4zoServlet?command=notice_search&page=${i } &pageDataCount=${nSearchDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="btn num">${i} </a> 
                        	</li>    
                        </c:otherwise>
					</c:choose>
				</c:forEach>
				<li> 
					<a href ="Ot4zoServlet?command=notice_search&page=${nSearchDvo.nextPageNum }&pageDataCount=${nSearchDvo.pageDataCount}" class="button next">&gt;</a>
				</li>
                <li> 
                	<a href ="Ot4zoServlet?command=notice_search&page=${nSearchDvo.lastPageNum }&pageDataCount=${nSearchDvo.pageDataCount}" class="button last">&gt;&gt;</a>
				</li>
			</ul>
		</div>
	</section>
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>      
</body>
</html> 
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
    <title>OT4ZO - 1:1 문의</title>
    <!--페이지 제목 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">

    <!-- CSS 적용 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/qnalist.css">

    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20211101 위재림 1:1 문의 상세 보기 수정 -->
    <section>
		<div class="board_wrap">
			<div class="title"><h2>OT4ZO 고객센터</h2></div>
        		<div>
            		<h3 id ="sub_tit">게시글</h3>
           		</div>
				<div id="category_wrap"></div>         
				<!--Q&A 게시판 부분-->
          		<div class="board_table_wrap">
            		<div class="board_table">
              			<div class="board_table_head">
			                <div class="num">번호</div>
			                <div class="sub">구분</div>
			                <div class="tit">제목</div>
			                <div class="writer">작성자</div>
			                <div class="date">작성일</div>
			                <div class="hit">조회</div>
              			</div>
              			<c:forEach items="${dvos}" var="dvo">
              				<div class="board_table_body">
                				<div class="item">
				                    <div class="num">${dvo.bId}</div>
				                    <div class="sub">${dvo.bSubTitle}</div>
                  					<div class="tit">
                  						<c:forEach begin="1" end="${dvo.bIndent}">-</c:forEach>
										<a href="Ot4zoServlet?command=board_view&bId=${dvo.bId}&page=${bPageDvo.currentPageNum }&pageDataCount=${bPageDvo.pageDataCount}">${dvo.bTitle}</a>
									</div>
					                <div class="writer">${dvo.MID}</div>
					                <div class="date">${dvo.bDate}</div>
					                <div class="hit">${dvo.bHit}</div>
               					</div>			
              				</div> <!--board_table-body-->
             			</c:forEach>
            		</div> <!--board_table-->
            		<form action="Ot4zoServlet" method="get">
			 			<input type="hidden" name="command" value="board_search">
            			<!--검색 및 글쓰기 부분-->
            			<div class="search_write">
		                <select name="f">
		                	<option ${(param.f =="bSubTitle")?"selected":""} value="bSubTitle" selected>구분</option>
		                	<option ${(param.f =="bTitle")?"selected":""} value="bTitle">제목</option>
		                  	<option ${(param.f =="MID")?"selected":""} value="MID">작성자(아이디)</option>
		                </select>              
                		<input type="text" name="keyword" value="${param.keyword}" />
                		<input type="submit" id="search_btn" value="검색">                
               		</form> 
              	</div> <!--search-->
				<div id="write">
					<input type="button" class="insert_btn" value="문의하기" onclick="location.href='Ot4zoServlet?command=board_write_form'">
              	</div> <!--write-->
		</div> <!--board_table-wrap-->
		<br> <br> <br> <br> <br> <br>
		<!--페이지 표시 부분-->
		<div class="page-list">
			<ul>
				<li> <a href ="Ot4zoServlet?command=board_list&page=${bPageDvo.firstPageNum }&pageDataCount=${bPageDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="button first">&lt;&lt;</a></li>
				<li> <a href ="Ot4zoServlet?command=board_list&page=${bPageDvo.prevPageNum }&pageDataCount=${bPageDvo.pageDataCount}" class="button prev">&lt;</a></li>
				<c:forEach var="i" begin="${bPageDvo.startPageNum }" end="${bPageDvo.endPageNum }" step="1">
					<c:choose>
					<c:when test="${i eq bPageDvo.currentPageNum}">
					<li> <a href ="Ot4zoServlet?command=board_list&page=${i}&pageDataCount=${bPageDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="btn num">${i}  </a> </li>
					</c:when>
					<c:otherwise>
					<li> <a href ="Ot4zoServlet?command=board_list&page=${i}&pageDataCount=${bPageDvo.pageDataCount}&f=${param.f}&keyword=${param.keyword}" class="btn num">${i} </a> </li>    
					</c:otherwise>
					</c:choose>
				</c:forEach>
				<li> <a href ="Ot4zoServlet?command=board_list&page=${bPageDvo.nextPageNum }&pageDataCount=${bPageDvo.pageDataCount}" class="button next">&gt;</a></li>
				<li> <a href ="Ot4zoServlet?command=board_list&page=${bPageDvo.lastPageNum }&pageDataCount=${bPageDvo.pageDataCount}" class="button last">&gt;&gt;</a></li>
			</ul>
		</div>
	</section>
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
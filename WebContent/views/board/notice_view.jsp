<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
 	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>  
	<!-- 20210831 위재림 HTML Q&A 1:1문의 작업 START -->
	<section>
		<div class="board_wrap">
			<li id="notice_image">
         	</li>
            <div class="board_title">
            	<h2 id ="notice_title">공지사항</h2>
            </div>
            <!--문의 내용-->
            <div class="board_view_wrap">
            	<div class="board_view">
                	<div class="title">${ndvo.nTitle}</div>
                    <div class="inform">
                        <dl>
                            <dt>번호</dt>
                            <dd>${ndvo.nId}</dd>
                        </dl>
                        <dl>
                            <dt>작성자</dt>
                            <dd>${ndvo.nAdminID}</dd>
                        </dl>
                        <dl>
                            <dt>작성일</dt>
                            <dd>${ndvo.nDate}</dd>
                        </dl>
                        <dl>
                            <dt>조회</dt>
                            <dd>${ndvo.nHit}</dd>
                        </dl>
                    </div>
					<!--문의 내용-->
                    <div class="cont">
                    	${ndvo.nContent} <br> <br> <br>
                    	<c:choose>
        					<c:when test="${!empty ndvo.nPictureurl}">
                        		<img src ="resources/upload/${ndvo.nPictureurl}">
                       		</c:when>
                          	<c:otherwise>
                          		<b>-</b>
                           	</c:otherwise>
           				</c:choose>
					</div>
				</div>
                <!--목록 버튼-->
                <div class="bt_wrap">
                	<input type="button" class="list_btn" value="목록" onclick="location.href='Ot4zoServlet?command=notice_list'"> 						
                </div>
			</div>
		</div>
	</section>
	<!-- 20210831 위재림 HTML Q&A 1:1문의 작업 END -->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>       
</body>
</html> 
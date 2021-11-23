<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/qna.css">
    
    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20210831 위재림 HTML Q&A 1:1문의 작업 START -->
	<section>
        <!--문의 내용 보기 전체-->
		<div class="board_wrap">
        	<!--문의 내용 보기 제목-->
            <div class="board_title">
                <h2>OT4ZO 고객센터</h2>  
            </div>
            <div>
       			<h3 id ="sub_tit">내 문의 상세보기</h3>
   			</div>
            <!--문의 내용-->
            <div class="board_view_wrap">
                <div class="board_view">
                    <!--문의 유형-->
                    <div class="select">
                    	<dl>
	                        <dt>문의유형:</dt>
	                        <dd>${dvo.bSubTitle}</dd>
                    	</dl>
                    </div>
                     <!--문의 제목-->
                    <div class="title">
                    	<dl>
                    		<dt>문의제목:</dt>
                        	<dd>${dvo.bTitle}</dd>
                    	</dl>
                    </div>
                     <!--문의글 정보-->
                    <div class="inform">
                        <dl>
                            <dt>번호:</dt>
                            <dd>${dvo.bId}</dd>
                        </dl>
                        <dl>
                            <dt>아이디:</dt>
                            <dd>${dvo.MID}</dd>
                        </dl>
                        <dl>
                            <dt>작성일:</dt>
                            <dd>${dvo.bDate}</dd>
                        </dl>
                        <dl>
                            <dt>조회수:</dt>
                            <dd>${dvo.bHit}</dd>
                        </dl>
                    </div>
                     <!--문의 내용-->
                    <div class="cont">
                        ${dvo.bContent} <br> <br> <br>
                    	<c:choose>
   							<c:when test="${!empty dvo.pictureurl}">
                   				<img src ="resources/upload/${dvo.pictureurl}">
                   			</c:when>
   					 	</c:choose>
                    </div>
                </div>
				<!--목록 및 수정 버튼-->
				<div class="bt_wrap">
					<input type="button" class="update_btn" value="수정" onclick="open_win('Ot4zoServlet?command=board_check_pass_form&bId=${dvo.bId}', 'update')">
					<input type="button" class="list_btn" value="목록" onclick="location.href='Ot4zoServlet?command=board_list'"> 
					<input type="button" class="del_btn" value="삭제" onclick="open_win('Ot4zoServlet?command=board_check_pass_form&bId=${dvo.bId}', 'delete')">
                </div>
			</div>
        </div>
    </section>
    <!-- 20210831 위재림 HTML Q&A 1:1문의 작업 END -->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
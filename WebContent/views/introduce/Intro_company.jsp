<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--페이지 제목-->
    <title>OT4ZO - 회사 소개</title>
    <!--페이지 제목 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">

    <!-- CSS 적용 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Intro_company.css">

    
    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
  
	<!-- 20210901 나성현 계정찾기 메인 페이지 작업 START-->
	<!-- 20210831 윤소라 회사소개작업 START -->
    <div class = company_main>
        <!-- 회사소개 메뉴1 -->
        <ul>
            <li id = "company_name"><h2>OT4<b>ZO</b> 쇼핑몰은?</h2></li>
            <!-- 회사소개 이미지 -->
            <li id ="company_image">
                <h2>회사연혁</h2>
                <h3>2021년~ 회사설립<br>
                    ... 
                </h3>
            </li>
        </ul>
        <!-- 회사소개 메뉴2 -->
        <ul>
            <li id = "company_name"><h2>OT4<b>ZO</b>를 선택해야하는 이유?</h2></li>
            <!-- OT4ZO 선택이유 메인메뉴-->
            <ul class = "company_reason">
                <!-- OT4ZO선택이유1 -->
                <ul id = "reason">
                    <li><h3>배송 시간 엄수</h3></li>
                    <li>배송시간을 <br> 엄수합니다.</li>
                </ul>
                <!-- OT4ZO 선택이유2 -->
                <ul id = "reason">
                    <li><h3>많은 적립금</h3></li>
                    <li>보다 많은 적립금을 <br> 제공해드립니다.</li>
                </ul>
                <!-- OT4ZO 선택이유2 -->
                <ul id = "reason">
                    <li><h3>다양한 상품성</h3></li>
                    <li>다양한 상품을 <br> 소개해드립니다.</li>
                </ul>
            </ul>
        </ul>
    </div> 
    <!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
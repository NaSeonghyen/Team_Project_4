<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<!--페이지 제목-->
	<title>OT4ZO - 조직도</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Organization.css">
	
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
 	<!-- 20210901 윤소라 조직도페이지작성 START -->
    <div id = "organization_main">
        <!-- 조직도 타이틀 -->
        <div id = "organization_name">
            <h2>OT4<b>ZO</b> 조직도</h2>
        </div>
        <!-- 조직도그림 -->
        <div>
            <img src = "${pageContext.request.contextPath}/resources/img/organization.png">
        </div>
    </div>
    <!-- 20210901 윤소라 조직도작성 END -->
    <!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
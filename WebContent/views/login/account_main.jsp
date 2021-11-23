<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--페이지 제목-->
	<title>OT4ZO -계정찾기 메인 </title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/account_main.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
  
      <!-- 20210901 나성현 계정찾기 메인 페이지 작업 START-->
        <section>
            <!--계정찾기 제목-->
            <div class="account_title">
                <h2>계정찾기</h2>
            </div>
            <!--계정찾기 메인 영역-->
            <ul class="account_list">
                <li>
                    <a href="account_id.jsp"><span class="account_id">아이디 찾기</span></a>   
                    <a href="account_pw.jsp"><span class="account_pw">비밀번호 찾기</span></a>
                </li>
            </ul>
        </section>
        <!-- 20210901 나성현 계정찾기 메인 페이지 작업 END-->
    <!-- Footer  -->    
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
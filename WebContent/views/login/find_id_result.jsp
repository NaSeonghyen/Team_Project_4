<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--페이지 제목-->
	<title>OT4ZO - 아이디 찾기 결과</title>
	<!--페이지 제목 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">

    <!-- CSS 적용 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/find_id_pw_result.css">
    
    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
	<!-- Header  -->
 	<%@include file="../common/header_login.jsp"%>
 	<!-- 20211101 나성현 아이디 찾기 결과 추가-->
	<form name = "id_find" method= "post">
		<div class = "container">
			<c:choose>
				<c:when test="${mb_id != null}">
	      			<div class = "found-success">
		      			<h2>  회원님의 아이디는 ${mb_id} 입니다 </h2><br>
		     		</div>
		     		<div class = "found-login">
	 		   			<input type="button" id="btnlogin" value="로그인" onClick = "location='Ot4zoServlet?command=login_form'"/>
					</div>
				</c:when>
				<c:otherwise>
	      			<div class = "found-fail">
		      			<h1>  등록된 정보가 없습니다. </h1>    
		     		</div>
		     
		     		<div class = "found-login">
	 		    		<input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
	 		     		<input type="button" id="btnjoin" value="회원가입" onClick="location='Ot4zoServlet?command=join_form'">
	       			</div>
				</c:otherwise>
			</c:choose>
		</div>
 	</form>
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
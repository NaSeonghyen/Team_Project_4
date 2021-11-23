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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
</head>
<body>
	<!-- 20211101 위재림 공지사항 비밀번호 확인 부분 추가-->
	<div align="center">
		<div class ="checkpass">
		<h1>비밀번호 확인</h1> 
		<div class ="ms-wrap">
			<span>이 글은 비밀글입니다. 비밀번호를 입력하여 주세요.</span>
		</div>
		<form action="Ot4zoServlet" name="frm" method="get">
			<input type="hidden" name="command" value="notice_check_pass">
			<input type="hidden" name="nId" value="${param.nId}">
			<table style="width: 80%" class = "table-wrap">
				<tr>
					<th>공지 비밀번호</th>
					<td><input type="password" name="npass" size="20"></td>
				</tr>
			</table>
			<br> <input type="submit" value=" 확 인 " id = "check-btn" onclick="return npassCheck()"> <br>
			<br>${message}
		</form>
		</div>
	</div>
</body>
</html>
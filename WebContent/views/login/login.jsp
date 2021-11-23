<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--페이지 제목-->
	<title>OT4ZO - 로그인</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<form action="Ot4zoServlet?command=login" method="post" name="frm">
		<!--20210830 이상훈 로그인 페이지 작업 START-->
		<!--로그인 제목-->
		<div class="login-title">
			<h2>로그인</h2>
		</div>
		<!--로그인 영역-->
		<div class="login-body">
			<!--로그인 로고-->
			<div class="member-login">
				<div class="login-box">
					<!--아이디-->
					<div class="id_pw">
						<input type="text" name="mb_id" value="${mb_id}" class="login-set"
							maxlength="20" placeholder="ID">
					</div>
					<!--비밀번호-->
					<div class="id_pw">
						<input type="password" name="mb_password" class="login-set"
							maxlength="20" placeholder="PASSWORD">
					</div>
					<!--로그인 버튼-->
					<div class="login-btn">
						<button type="submit" class="login-btn-set"
							onclick="return loginCheck()">
							<a>login</a>
						</button>
					</div>
					<!--회원가입-->
					<div class="login-util">
						아이디가 없으신가요? <a href="Ot4zoServlet?command=join_form"> <b
							class="more">회원가입</b>
						</a>
					</div>
					<!--계정찾기-->
					<div class="login-util">
						아이디나 패스워드를 잊으셨나요? <a href="views/login/account_main.jsp"> <b
							class="more">계정찾기</b>
						</a>
					</div>
					<tr>
						<td colspan="2">${message}</td>
						<!-- LoginServlet에서 setAttribute("message","")key값을  message로 주어서 갖다 쓸 수 있다. -->
					</tr>
				</div>
			</div>
		</div>
		<!-- 20210831 이상훈 로그인 페이지 작업 END-->
	</form>
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
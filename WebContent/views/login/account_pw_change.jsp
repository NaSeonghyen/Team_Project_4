<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--페이지 제목-->
    <title>OT4ZO - 비밀번호 재설정</title>
    <!--페이지 제목 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">

    <!-- CSS 적용 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/account_pw_change.css">
    
    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/find_pw.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20210901 나성현 비밀번호 변경 작업 START-->
	<form action="${pageContext.request.contextPath}/Ot4zoServlet?command=pw_change" method="post" name="pwfrm">
		<!--아이디 가져오기-->
        <input type="hidden" name="mb_id" value="${mb_id}" size="20">
        <section>
            <!--비밀번호 변경 제목-->
            <div class="account_pw_title">
                <h2>비밀번호 재설정</h2>
            </div>
            <!--비밀번호 변경 메인 영역-->
            <div class="change_pw">
                <!--비밀번호-->
                <div class="input-box">
                    <label for="mb_pw" class="label-css">새 비밀번호</label>
                    <input type="password" name="mb_pw" required class="input-css" minlength="8" maxlength="20"
                        placeholder="최소 8글자, 최대 20자이내로 입력해주세요.">
                </div>
                <!--비밀번호 확인-->
                <div class="input-box">
                    <label for="mb_pw_y" class="label-css">새 비밀번호 확인</label>
                    <input type="password" name="mb_pw_y" required class="input-css" minlength="8" maxlength="20"
                        placeholder="최소 8글자, 최대 20자이내로 입력해주세요.">
                </div>
                <div class="submit_reset">
                    <!--확인 버튼-->
                    <button type="submit" class="sub_btn" onClick="return pw_change()">
                    	<b>확인</b>
                    </button>
                    <!--취소 버튼-->
                    <button type="reset" class="res_btn">
                    	<b>취소</b>
                    </button>
                </div>
            </div>
        </section>
	</form>
	<!-- 20210901 나성현 비밀번호 변경 작업 START-->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
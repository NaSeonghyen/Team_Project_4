<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--페이지 제목-->
	<title>OT4ZO - 비밀번호찾기</title>
	<!--페이지 제목 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">

    <!-- CSS 적용 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/account_pw.css">
    
    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/find_pw.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20210901 나성현 비밀번호 찾기 작업 START-->
	<form action="${pageContext.request.contextPath}/Ot4zoServlet?command=pw_search" method="post" name="pwfrm">
		<section>
            <!--비밀번호 찾기 제목-->
            <div class="account_pw_title">
                <h2>비밀번호찾기</h2>
            </div>
            <!--비밀번호찾기 메인 영역-->
            <div class="find_pw">
                <!--이름-->
                <div class="input-box">
                    <label for="mb_name" class="label-css">이름</label>
                    <input type="text" name ="mb_name" required class="input-css"
                        placeholder="이름을 입력해주세요.">
                </div>
                <!--아이디-->
                <div class="input-box">
                    <label for ="mb_id" class="label-css">아이디</label>
                    <input type="text" name ="mb_id"  required class="input-css" minlength="3" maxlength="20"
                    placeholder ="아이디를 입력해주세요.">
                </div>
                <div class="submit_reset">
                    <!--확인 버튼-->
                    <button type="submit" class="sub_btn" onClick="return pw_search()">
                    	<b>확인</b>
                    </button>
                    <!--취소 버튼-->
                    <button type="reset" class="res_btn" onClick ="location='account_main.jsp'">
                  		<b>취소</b>
                    </button>
                </div>
            </div>
        </section>
    </form>
    <!-- 20210901 나성현 비밀번호 찾기 작업 END-->
    <!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
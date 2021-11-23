<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--페이지 제목-->
	<title>OT4ZO - 아이디찾기</title>
	<!--페이지 제목 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">

    <!-- CSS 적용 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/account_id.css">
    
    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/find_id.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<form action="${pageContext.request.contextPath}/Ot4zoServlet?command=id_search" method="post" name="frm">
	<!-- 20210901 나성현 아이디 찾기 작업 START-->
        <section>
            <!--아이디 찾기 제목-->
            <div class="account_id_title">
                <h2>아이디찾기</h2>
            </div>
            <!--아이디찾기 메인 영역-->
            <div class="find_id">
                <!--이름-->
                <div class="input-box">
                    <label for="mb_name" class="label-css">이름</label>
                    <input type="text" name ="mb_name" required class="input-css"
                        placeholder="이름을 입력해주세요.">
                </div>
                <!--휴대전화-->
                <div class="input-box">
                    <label for ="mb_hp" class="label-css">휴대전화</label>
                    <input type="hidden" name ="mb_hp" class="input-css">
                    <div class="part-wrap">
                        <div class="part-wrap-1">
                            <select class="input-css" name="mb_hp_01">
                                <option value="010">010</option>
                                <option value="010">011</option>
                                <option value="010">016</option>
                                <option value="010">017</option>
                                <option value="010">018</option>
                                <option value="010">019</option>
                            </select>
                        </div>
                        <div class="part-wrap-1">
                            <input type="text" name ="mb_hp_02" class="input-css" maxlength="4" required>
                        </div>
                        <div class="part-wrap-1">
                            <input type="text" name ="mb_hp_03" class="input-css" maxlength="4" required>
                        </div>
                    </div>
                </div>
                <div class="submit_reset">
                    <!--확인 버튼-->
                    <button type="submit" class="sub_btn" onClick="return id_search()">
                            <b>확인</b>
                    </button>
                    <!--취소 버튼-->
                    <button type="reset" class="res_btn"
                    	onClick ="location='account_main.jsp'">
                            <b>취소</b>
                    </button>
                </div>
            </div>
        </section>
        <!-- 20210901 나성현 아이디 찾기 작업 START-->
	</form>
	<!-- Footer  --> 
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
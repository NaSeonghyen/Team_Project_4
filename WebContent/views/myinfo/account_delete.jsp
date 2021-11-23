<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--페이지 제목-->
	<title>OT4ZO - 회원탈퇴</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/account_edit.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
   <!-- Header  -->
   <%@include file="../common/header_login.jsp"%>
   <!-- 20211101 신정민 회원탈퇴 추가-->
   <form action="${pageContext.request.contextPath}/Ot4zoServlet?command=member_delete" method="post" name="frm">
      <div class="edit-title">
         <h2>회원탈퇴</h2>
      </div>
      <div class="del_info">
         <div id="id">
            <label class="label-css2"> <span>아이디</span><br> <input type="text"
               name="mb_id" class="input_box2" value="${loginUser.memId}" readonly>
            </label>
         </div>

         <div id="pw">
            <label class="label-css2"> <span>비밀번호 입력</span><br> <input type="password"
               name="mb_pw" class="input_box2" placeholder="비밀번호를 입력해주세요.">
            </label>
         </div>
      </div>
      <div class="btn_line">
         <div class="btn1">
            <button type="submit" onclick="return deleteCheck()"  class="btn-2">
            <a>회원탈퇴</a>
            </button>
         </div>
         <div class="btn1">
            <button id="cancel_btn" class="btn-3">
               <a href="MyInfo_UserEdit.jsp">취소</a>
            </button>
         </div>
      </div>
   </form>
   <!-- Footer  -->
   <%@include file="../common/footer_login.jsp"%>
</body>
</html>
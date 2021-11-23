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
	<title>OT4ZO - 회원정보수정</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/account_edit.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/account_edit.js"></script>
</head>

<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<form action="${pageContext.request.contextPath}/Ot4zoServlet?command=member_edit" method="post" name="frm">
		<!-- 20210901 정주연 HTML 회원정보수정 작업 START -->
		<!-- 20211101 CSS 변경으로 인한 송석환, 신정민 회원정보 수정 작업 -->
		<div class="edit-title">
			<h2>회원정보 수정</h2>
		</div>
		<div class="edit_line">
			<div class="area-box">
				<div class="input-title">
					<span style='color: red;'>&#42;</span>기본정보
				</div>
				<div id="id">
					<label class="label-css"> <span>아이디</span><br> <input
						type="text" name="mb_id" class="input_box"
						value="${loginUser.memId}" readonly>
					</label>
				</div>
				<div id="email">
					<label class="label-css"> <span>이메일</span><br> <input
						type="email" name="mb_email" class="input_box"
						placeholder="이메일을 입력해주세요." value="${loginUser.memEmail}">
					</label>
				</div>

				<div id="pw">
					<label class="label-css"> <span style='color: red;'>&#42;</span>비밀번호 변경<br> <input
						type="password" name="mb_pw" class="input_box"
						placeholder="변경할 비밀번호를 입력해주세요.">
					</label>
				</div>

				<div id="repw">
					<label class="label-css"> <span style='color: red;'>&#42;</span>비밀번호 확인<br> <input
						type="password" name="mb_pw_y" class="input_box"
						placeholder="입력한 비밀번호를 한번 더 입력해주세요.">
					</label>
				</div>

				<div id="name">
					<label class="label-css"> <span>이름</span><br> <input
						type="text" name="mb_name" class="input_box" placeholder="이름"
						value="${loginUser.memName}">
					</label>
				</div>

				<div id="dob">
					<c:set var="memBirth" value="${loginUser.memBirth}" />
					<label class="label-css"> <span>생년월일</span></label><br>
					<div class="part-wrap">
						<div class="part-wrap-1">
							<input type="text" name="mb_birth_y" class="input_box" placeholder="년"
								value="${fn:substring(memBirth,0,4)}">
						</div>
						<div class="part-wrap-1">
							<input type="text" name="mb_birth_m" class="input_box" placeholder="월"
								value="${fn:substring(memBirth,4,6)}">
						</div>
						<div class="part-wrap-1">
							<input type="text" name="mb_birth_d" class="input_box" placeholder="일"
								value="${fn:substring(memBirth,6,8)}">
						</div>
					</div>
				</div>

				<div id="phonenb">
					<label class="label-css"> <span>휴대폰 번호</span><br> <input
						type="tel" name="mb_hp" class="input_box" placeholder="- 없이 입력하세요"
						value="${loginUser.memphone}">
					</label>
				</div>
			</div>
			<div class="area-box">
				<div class="input-title">
					<span style='color: red;'>&#42;</span>약관동의
				</div>
				<div id="alert1">
					<label class="label-css"> <span>메일수신</span><br>
					 <c:choose>
							<c:when test="${loginUser.memRecepmail eq 'Y'}">
								<input type="radio" class="input_radio" value="Y"
									name="all-check3" checked>
								<span class="radio_sel">받습니다</span>&nbsp;&nbsp;&nbsp; 
							<input type="radio" class="input_radio" value="N"
									name="all-check3">
								<span class="radio_sel">받지 않습니다</span>
							</c:when>
							<c:when test="${loginUser.memRecepmail eq 'N'}">
								<input type="radio" class="input_radio" value="Y"
									name="all-check3">
								<span class="radio_sel">받습니다</span>&nbsp;&nbsp;&nbsp; 
							<input type="radio" class="input_radio" value="N"
									name="all-check3" checked>
								<span class="radio_sel">받지 않습니다</span>
							</c:when>
						</c:choose>
					</label>
				</div>

				<div id="alert2">
					<label class="label-css"> <span>SMS수신</span><br>
					<c:choose>
							<c:when test="${loginUser.memRecepsms eq 'Y'}">
								<input type="radio" class="input_radio" value="Y"
									name="all-check4" checked>
								<span class="radio_sel">받습니다</span>&nbsp;&nbsp;&nbsp; 
							<input type="radio" class="input_radio" value="N"
									name="all-check4">
								<span class="radio_sel">받지 않습니다</span>
							</c:when>
							<c:when test="${loginUser.memRecepsms eq 'N'}">
								<input type="radio" class="input_radio" value="Y"
									name="all-check4">
								<span class="radio_sel">받습니다</span>&nbsp;&nbsp;&nbsp; 
							<input type="radio" class="input_radio" value="N"
									name="all-check4" checked>
								<span class="radio_sel">받지 않습니다</span>
							</c:when>
						</c:choose>
					</label>
				</div>
			</div>
			<!--edit_info-->
		</div>

		<!--edit_line-->

		<div class="btn_line">
			<div class="btn1">
				<button type="submit" class="btn-1"onclick="return updateCheck()"><a>회원정보
					수정</a></button>
			</div>

			<div class="btn1">
				<button id="cancel_btn" class="btn-1">
					<a href="MyInfo_UserEdit.jsp">취소</a>
				</button>
			</div>

			<div class="btn1">
				<button id="del_btn" class="btn-1">
					<a href="account_delete.jsp">회원탈퇴</a>
				</button>
			</div>
		</div>
	</form>
	<!-- btn_line-->
	<!-- 20210901 정주연 HTML 회원정보수정 작업 END -->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
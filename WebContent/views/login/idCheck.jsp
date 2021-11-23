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
	<title>아이디 중복 확인</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- JS 적용 파일 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/join.js"></script>
</head>
<body>
	<!-- 20211101 나성현 아이디 중복 체크 추가-->
	<form action="Ot4zoServlet?command=id_check_form" method="post" name="frm">
		아이디 <input type=text name="mb_id" value="${mb_id}"> 
			<input type=submit value="중복 확인"> 
		<br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.frm.userid.value = "";
			</script>
				${mb_id}는 이미 사용 중인 아이디입니다.
			
		</c:if>
		<c:if test="${result==-1}">
				${mb_id}는 사용 가능한 아이디입니다.
		<input type="button" value="사용" class="cancel" onclick="idok()">
		</c:if>
	</form>
</body>
</html>












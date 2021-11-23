<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--페이지 제목-->
	<title>OT4ZO - 마이페이지 메인</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/MyInfo_UserEdit.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20210901 윤소라 마이페이지 메인페이지 작성 START-->
	<!-- 20211101 이상훈 CSS로 인한 수정-->
	<div id="myinfo_main">
		<div id="myinfo">마이 페이지
		</div>
		<div id="myinfo_name">
			<h3 id="user_name">${loginUser.memName}님 저희 쇼핑몰을 이용해주셔서 감사합니다.</h3>
		</div>
			<br> <br> <br> 
		<div id = "mypage_menu_container">
			<div id ="mypage_menu">
				<div class ="head">마이쇼핑정보</div>
				<div class ="item">
					<a class ="cart_page" href = "${pageContext.request.contextPath}/Ot4zoServlet?command=cart_list">카트/장바구니</a>
				</div>
				<div class ="item">
					<a class ="order_page" href ="${pageContext.request.contextPath}/Ot4zoServlet?command=order_list">주문조회</a>
				</div>
				<div class ="head">나의 활동정보</div>
				<div class ="item">
					<a class ="account_edit" href = "${pageContext.request.contextPath}/views/myinfo/account_edit.jsp">회원정보수정</a>
				</div>
				<div class ="head">고객센터</div>
				<div class ="item">
					<a class ="inquiry" href ="${pageContext.request.contextPath}/Ot4zoServlet?command=board_list">1:1문의</a>
				</div>
		   </div>	
		</div>
		<div id = "mypage_content_container">
			<div id ="order_status">
				<div class = "order_status_top">
					<div class ="order_status_title">주문상태안내</div>
				</div>
				<img src ="${pageContext.request.contextPath}/resources/img/order_img.jpg">
			</div>
			
			<div class ="ordernotice">
				<p>OT4ZO는 다양한 쇼핑몰 상품을 한 자리에서 구매할 수 있는 패션 쇼핑 서비스입니다.
				       따라서 하나의 주문건이라 할 지라도 2회 이상 배송이 진행 될 수 있습니다.
		       </p> 
	        	<p>배송준비중/배송중 단계에서 주문취소는 고객센터를 통해서 가능하며
	                         이미 발송 되었을 경우 배송 완료 후 상품 회수가 진행됩니다.
                  (상품 발송 및 회수에 대한 배송료가 부과됩니다.)
               </p>
               <p>  상품의 반품이나 교환은 고객센터로 문의하여 주세요.
               </p>
               <p>배송완료 상태에서 수취 확인을 하지 않은 경우 7일 후 자동으로 구매 확정됩니다.
               </p>
			</div>
		</div>
	</div>	
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
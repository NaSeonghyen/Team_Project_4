<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--페이지 제목-->
	<title>OT4ZO - 장바구니</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Myinfo_Cart.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/Myinfo_Cart.js"></script>
</head>

<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
    <!-- 20210902 윤소라 HTML 장바구니페이지 작업 START -->
    <div class = "main_container"> 
    	<!-- 20211101 이상훈 CSS로 인한 수정-->
		<!-- 장바구니 타이틀 -->
		<div id="myinfo">장바구니</div>
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
    	<div class = "cart_main">
			<form method="post" name ="frm">
				<table>
			        <!-- 장바구니 테이블 colgroup -->
					<colgroup>
						<col style = "width : 50px;">
			          	<col style = "width : 200px;">
				        <col style = "width : 300px;">
				        <col style = "width : 100px;">
				        <col style = "width : 100px;">
				        <col style = "width : 200px;">
			        </colgroup>
			        <!-- 테이블 헤드 -->
			        <thead>
						<tr>
				            <!-- 테이블 전체선택 체크박스 -->
				            <th scope = "col">
				            	<input type = "checkbox" id = "cart_all" onclick = "checkall()">
				            </th>
				            <!-- 테이블 헤드 메뉴 -->
				            <th>이미지</th>
				            <th>상품정보</th>
				            <th>수량</th>
				            <th>판매가</th>
				            <th>선택</th>
						</tr>
			        </thead>
			        <!-- 테이블 바디 -->
			        <tbody>
						<c:forEach items="${cartList}"  var="cartVO">
							<tr>
				          		<!-- 체크박스 -->
			          			<td>
					            	<input type = "checkbox" name = "cseq" value="${cartVO.cseq}">
					          	</td>
								<!-- 상품 사진 -->
								<td class = "thum">
									<a href = "Ot4zoServlet?command=product_detail&pseq=${cartVO.pseq}&quantity=0">
							          	<c:choose>
							          		<c:when test="${empty cartVO.product_url}">
							          			<img src="${pageContext.request.contextPath}/resources/img/${cartVO.product_image}" alt="${cartVO.pname}">
							          		</c:when>
							          		<c:otherwise>
							          			<img src="${cartVO.product_url}"  alt="${cartVO.pname}"/>
							          		</c:otherwise>
							          	</c:choose>
					            	</a>
					         	</td>
					            <!-- 상품 정보 -->
					            <td class= "cart_product">
						          	<strong>
						          		<a href = "Ot4zoServlet?command=product_detail&pseq=${cartVO.pseq}&quantity=0" id="cart_leftname">${cartVO.pname}</a>
						          	</strong>
					          		<p class = "cart_option">[옵션 : ${cartVO.size}]</p>
					            </td>
					            <!--수량 -->
					            <td id = "cart_quantity">
					          		${cartVO.quantity}
					            </td>
					            <!--가격  -->
					            <td><strong><fmt:formatNumber value="${cartVO.quantity * cartVO.product_price}" pattern="#,##0" /></strong></td>
					            <!-- 선택 -->
					            <td>
				                	<div id = "cart_select1"><a href = "Ot4zoServlet?command=order&pseq=${cartVO.pseq}&cseq=${cartVO.cseq}">주문하기</a></div>
				                	<div id = "cart_select2" onclick= "go_cart_delete()">삭제</div>
					            </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 장바구니 하부 버튼전체 -->
				<div class = "cart_submain">
					<div class = "cart_button_container">
						<!-- 장바구니 하부 오른쪽버튼들 -->
						<div class = "delete_button" onclick = "go_cart_all_delete()">장바구니비우기</div> 
					</div>
				</div>
			</form>
		</div>
	</div>
    <!-- 20210902 윤소라 HTML 장바구니페이지 작업 End -->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
  </body>
</html>
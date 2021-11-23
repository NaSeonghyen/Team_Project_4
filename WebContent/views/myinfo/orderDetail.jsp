<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<!--페이지 제목-->
	<title>OT4ZO - 주문내역</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/orderlist.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>

<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20210901 위재림 주문 목록 작업 START -->
	<!-- 20211101 이상훈 CSS로 인한 수정-->
	<div class="order_main">
		<!-- 주문내역 타이틀 -->
		<div id="myinfo">주문 상세 내역
		</div>
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
		<div class = "table_main">
			<table>
				<!-- 주문내역 테이블 colgroup -->
				<colgroup>
					<col style="width: 150px;">
					<col style="width: 100px;">
					<col style="width: 200px;">
					<col style="width: 200px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
					<col style="width: 100px;">
				</colgroup>
				<!-- 테이블 헤드 -->
				<thead>
					<tr>
						<!-- 테이블 헤드 메뉴 -->
						<th>주문일자</th>
						<th>주문번호</th>
						<th>이미지</th>
						<th>상품정보</th>
						<th>수량</th>
						<th>가격</th>
						<th>주문상태</th>
					</tr>
				</thead>
				<!-- 테이블 바디 -->
				<tbody>
					<c:forEach items="${orderList}" var="orderVO">
						<tr>
							<td id="order_date"><fmt:formatDate value="${orderVO.indate}" type="date" /></td>
							<td id="order_num">${orderVO.oseq}</td>
							<!-- 상품 사진 -->
							<td class="thum">
								<a href="Ot4zoServlet?command=product_detail&pseq=${orderVO.pseq}&quantity=0">
									<c:choose>
										<c:when test="${empty orderVO.product_url}">
											<img src="${pageContext.request.contextPath}/resources/img/${orderVO.product_image}" alt="${orderVO.pname}">
										</c:when>
										<c:otherwise>
											<img src="${orderVO.product_url}" alt="${orderVO.pname}" />
										</c:otherwise>
									</c:choose>
								</a>
							</td>
							<!-- 상품 정보 -->
							<td class="order_product">
								<strong> 
									<a href="Ot4zoServlet?command=product_detail&pseq=${orderVO.pseq}&quantity=0" id="order_leftname">${orderVO.pname}</a>
								</strong>
								<c:choose>
						          	<c:when test="${empty orderVO.size}">
								        <p class = "order_option">[옵션 : 없음]</p>  			
								    </c:when>
								    <c:otherwise>
								        <p class = "order_option">[옵션 : ${orderVO.size}]</p>  			
								    </c:otherwise>
							    </c:choose>
							</td>
							<!--수량 -->
							<td id="order_quantity">${orderVO.quantity}</td>
							<!--가격  -->
							<td><fmt:formatNumber type="currency" value="${orderVO.product_price*orderVO.quantity}" /></td>
							<!-- 주문진행상태 -->
							<td>
								<c:choose>
									<c:when test='${orderVO.result=="1"}'> 완료 </c:when>
									<c:otherwise>
										<span style="color: red"> 진행중 </span>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
		<br> <br> <br>
   	<!--목록 버튼-->
	<div class="bt_wrap">
		<input type="button" class="list_btn" value="목록" onclick="location.href='Ot4zoServlet?command=order_list'">
	</div>
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
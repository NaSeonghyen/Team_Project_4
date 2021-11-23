<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--페이지 제목-->
	<title>OT4ZO - 상품구매</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/order.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/order.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 다음 우편번호 API JS -->
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
        <!-- 20210903 송석환 상품 구매 START -->
        <div class="container"> 
            <!-- 주문서 타이틀 -->
	          <div id ="title_wrap">
	          	<h2>주문서</h2>
	          </div> 
            <div class="board_wrap">
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="num">주문상품</div>
                            <div class="product">상품명</div>
                            <div class="count">수량</div>
                            <div class="price">가격</div>
                        </div>
                        <div>
                            <div class="num">
                            	<c:choose>
									<c:when test="${empty productVO.product_url}">
										<img src="${pageContext.request.contextPath}/resources/img/${productVO.product_image}" 
										 alt="${productVO.product_name}">
									</c:when>
									<c:otherwise>
										<img src="${productVO.product_url}"  alt="${productVO.product_name}"/>
									</c:otherwise>
								</c:choose>
                            </div>
                            <div class="product">${productVO.product_name}</div>
                            <input type="hidden" name="quantity" value="${quantity}">
                            <input type="hidden" name="size" value="${size}">
                            <div class="count">${quantity}</div>
                            <div class="price"><fmt:formatNumber value="${productVO.product_price * quantity}" pattern="#,##0" />원</div>
                        </div>
                    </div>
                </div>
                <form action="Ot4zoServlet?command=order_insert&pseq=${productVO.pseq}&quantity=${quantity}&size=${size}" name="frm" method="post"> 
                    <!-- 주문자정보 -->
                    <fieldset> 
                        <legend>주문자 정보</legend> 
                        <ul> 
                            <li> 
                                <label for="uname" class="title" >주문자명</label> 
                                <input type="text" id="name_text" value="${loginUser.memName}" readonly>
                            </li> 
                            <li> 
                                <label for="tel1" class="title">연락처</label>
                                <div class="part-wrap">
                                <c:set var="memPhone" value="${loginUser.memphone}"/>
                                    <div class="part-wrap-1">
                                        <input type="text" name="mb_hp_01" class="input-css" maxlength="3" value="${fn:substring(memPhone,0,3)}" readonly>
                                    </div>
                                    <div class="part-wrap-1">
                                        <input type="text" name="mb_hp_02" class="input-css" maxlength="4" value="${fn:substring(memPhone,3,7)}" readonly>
                                    </div>
                                    <div class="part-wrap-1">
                                        <input type="text" name="mb_hp_03" class="input-css" maxlength="4" value="${fn:substring(memPhone,7,11)}" readonly>
                                    </div>
                                </div> 
                            </li> 
                        </ul> 
                    </fieldset>
                    <!-- 배송지 정보 --> 
                    <fieldset> 
                        <legend>배송지 정보</legend> 
                        <ul> 
                            <li> 
                                <label for="mb_addr" class="title">주소</label> 
                                <input type="text" id="text_css" name="mb_addr" placeholder="우편번호" readonly> 
                                <input type="button" class="find_btn" onclick="mb_addr_exeDaumPostcode()" value="우편번호 찾기"><br>
                            </li>
                            <li>
                                <label class="title">&nbsp;</label>
                                <input type="text" id="text_css" name="mb_addr_1" placeholder="도로명 주소" readonly>
                            </li>
                            <li>
                                <label class="title">&nbsp;</label>
                                <input type="text" id="text_css" name="mb_addr_2" placeholder="상세주소를 입력해주세요." >  
                            </li> 
                            <li> 
                                <label for="mail2" class="title">이메일</label> 
                                <input type="text" name="str_email01" id="text_css"  value="${loginUser.memEmail}" readonly> 
                            </li> 
                            <li> 
                                <label for="comment" class="title">택배배송 요청사항</label>
                                <div class="part-wrap-2">
                                    <select class="input-css" name="delivery">
                                        <option value="0">메시지를 선택 해주세요.</option>
                                        <option value="1">부재시 경비(관리)실에 맡겨주세요.</option>
                                        <option value="2">부재시 문앞에 놓아주세요.</option>
                                        <option value="3">파손의 위험이 있는 상품이 있습니다. 배송 시 주의해주세요.</option>
                                        <option value="4">배송전에 연락주세요.</option>
                                    </select>
                                </div>
                            </li> 
                        </ul> 
                    </fieldset>
                    <fieldset>
                        <!-- 결제 금액 -->
                        <legend>결제 금액</legend> 
                        <ul> 
                            <li> 
                                <label for="product" class="title1">상품금액</label> 
                                <span class="text_num">
                                	<div class="price">
                                		<fmt:formatNumber value="${productVO.product_price * quantity}" pattern="#,##0" />원
                                	</div>
                                </span>
                            </li> 
                            <li>
                                <label for="delivery" class="title1">배송비</label>
                                <span class="text_num">0<span class="text_unit">원</span>
                                </span>
                            </li> 
                            <li>
                                <label for="pay" class="title"><b>총 결제금액</b></label>
                                <span class="text_num">
                                	<fmt:formatNumber value="${productVO.product_price * quantity}" pattern="#,##0" />원
                                </span>
                            </li> 
                        </ul> 
                        <div class="join-btn">
                            <button type="submit" class="btn-1" onclick="return orderCheck()"><b class="more">결제하기</b></button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <!-- 20210901 송석환 상품구매 END -->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>

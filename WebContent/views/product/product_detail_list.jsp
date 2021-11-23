<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--페이지 제목-->
	<title>OT4ZO - 상품 상세페이지</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!--CSS 적용 파일-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product_detail.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/product_detail.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20210903 이상훈 제품구매 상세 페이지 작업 START-->
	<!-- 20211105 나성현 서블릿 연동 부분 추가-->
    <div class="item-view-container">
		<form method="post" name="frm">
			<!-- 상단  -->
			<div class="item-top">
				<!-- 이미지 part -->
				<c:choose>
					<c:when test="${empty productVO.product_url}">
						<img src="${pageContext.request.contextPath}/resources/img/${productVO.product_image}" alt="${productVO.product_name}">
					</c:when>
					<c:otherwise>
						<img src="${productVO.product_url}"  alt="${productVO.product_name}"/>
					</c:otherwise>
				</c:choose>
				<!-- 제품 정보 part -->
            	<div class="item-top-info">
            		<!-- 제품 정보 text -->
            		<div class="item-top-info-row">
						<!-- 상품 태그 설명 -->
	                    <div class="item-tag">
	                        <div>${productVO.product_content}</div>
	                    </div>
            			<!-- 상품명 -->
                    	<div class="item-title">${productVO.product_name}</div>
	                    <!-- 상품가격 -->
	                    <div class="item-price">
                            <div class="value">
                                <div class ="price_css"><fmt:formatNumber value="${productVO.product_price}" pattern="#,##0" />원 
                                </div>
	                    	</div>
                        </div>
                        <div class ="row">
	                       	<div id ="d_key">배송비</div> 
	                       	<div id ="d_value">무료배송</div>
                        </div>	
					</div>
					<!-- 제품 옵션 선택-->
                    <div class="item-top-info-option">
	                    <c:choose>
		                    <c:when test="${productVO.product_kind eq 'ACC'}">
		                    	<div class="option">
		                        	<!-- 옵션 레이블 -->
		                        	<div class="option-label">수량</div>    
		                        	<!-- 옵션 선택박스 -->
		                            <div class="option-selector">
		                                <select class="option-selector-css" id= "quantity" name = "quantity" onchange="chageQuantitySelect()">
	                                        <option value="0">선택</option>
	                                        <option value="1">1</option>
	                                        <option value="2">2</option>
	                                        <option value="3">3</option>
		                                </select>
		                            </div>
	                        	</div>
		                    </c:when>
		                    <c:otherwise>
		                    	<input type="hidden" id="sizeElement" value="sizeElement">
		                    	<input type="hidden" id="quantityElement" value="quantityElement">
		                    	<div class="option">
		                        	<!-- 옵션 레이블 -->
		                        	<div class="option-label">수량</div>    
		                        	<!-- 옵션 선택박스 -->
		                            <div class="option-selector">
		                                <select class="option-selector-css" id= "quantity" name = "quantity" onchange="chageQuantitySelect()">
	                                        <option value="0">선택</option>
	                                        <option value="1">1</option>
	                                        <option value="2">2</option>
	                                        <option value="3">3</option>
		                                </select>
		                            </div>                     
		                        </div>
	                    		<div class="option">
		                        	<!-- 옵션 레이블 -->
		                        	<div class="option-label2">SIZE
		                        	</div>
		                        	<!-- 옵션 선택박스 -->
		                        	<div>
			                        	<div class="option-selector">
			                                <select class="option-selector-css" name = "size">
			                                    <option value="선택">선택</option>
			                                    <option value="S">S</option>
			                                    <option value="M">M</option>
			                                    <option value="L">L</option>
			                                    <option value="XL">XL</option>
			                                </select>
			                            </div>
	                            	</div>  
                        		</div>
		                    </c:otherwise>
	                    </c:choose>
                    </div>
                    <div class ="label_wrap"> 
                    	<!-- 총 금액 레이블-->
                    	<div class="total_label">총 상품금액
                    	</div>
                    	<!-- 총 금액 값 -->
                   		<div class="total_value" id="total_value">
                   			<fmt:formatNumber value="${productVO.product_price * quantity}" pattern="#,##0" />원
                   		</div>
                    </div>   
                    <div class="clear"></div>
                    <!--구매하기,장바구니-->
                    <div class="product_button">
	                    <c:choose>
							<c:when test="${empty loginUser.memId}">
                        		<input type="button" class="btn-cart" value = "장바구니"  onclick="location='${pageContext.request.contextPath}/Ot4zoServlet?command=login_form'">
								<input type="button" class="btn-buy" value = "구매하기" onclick="location='${pageContext.request.contextPath}/Ot4zoServlet?command=login_form'">
							</c:when>
							<c:otherwise>
                        		<input type="button" class="btn-cart" value = "장바구니"  onclick="go_cart()">
								<input type="button" class="btn-buy" value = "구매하기" onClick="go_purchase()">
							</c:otherwise>
						</c:choose>
                    </div>
				</div>
			</div>
			<div class="item-down">
				<!--제품 상세 정보 -->
				<table class="item-info-tab">
					<tbody>
						<tr>
	                        <td class="detail-tab">
	                            <a href ="#detail-tab">상세정보</a>
	                        </td>
	                        
	                        <td class="review">
	                            <a href ="#review">제품리뷰</a>
	                        </td>
                    	</tr>
                	</tbody>
				</table>
				<div class="content-cotainer"> 
					<table class="item-notice">
						<tbody>
							<tr>
								<td>
									· 모니터 사양에 따라 색상이 다르게 보일 수 있습니다.
                                    <br>
                                    · 모든 의류의 첫 세탁은 드라이클리닝을 추천하며, 세탁 후 착용 부탁 드립니다.
                                    <br>
                                    · 데님 및 컬러 제품은 이염방지를 위해 단독 세탁을 권장합니다.
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<div class="img-info">
						<!--제품 설명/ 제품 이미지 -->
						<c:choose>
							<c:when test="${empty productVO.product_detail_url}">
								<img src="${pageContext.request.contextPath}/resources/img/${productVO.product_detail_image}" alt="${productVO.product_name}">
							</c:when>
							<c:otherwise>
								<img src="${productVO.product_detail_url}"  alt="${productVO.product_name}"/>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 리뷰 -->
					<div class="item-review">
					    <div class="item-review-title">
					        <h2 style="margin-bottom: 5%;">리뷰</h2>
					        <dl>
					            <dt><b>OT4ZO</b></dt>
					            <textarea placeholder="내용 입력"></textarea>
					            <button type="submit" class="item-review-btn">등록</button>
					        </dl>   
					    </div>
					    <hr>
					    <div class="people-review-write">
					        <dl>
					            <dt><b>한소희</b></dt>
					            <dt class="review_content">
					                굳굳 추천해요~
					            </dt>
					            <dt class="review_date">
					                2021-09-02 18:02:04
					            </dt>
					        </dl>
					        <dl>
					            <dt><b>김태리</b></dt>
					            <dt class="review_content">
					                배송이 빨라요!
					            </dt>
					            <dt class="review_date">
					                2021-09-01 11:23:04
					            </dt>
					        </dl>
					        <dl>
					            <dt><b>전여빈</b></dt>
					            <dt class="review_content">
					                저하고는 안맞네요..
					            </dt>
					            <dt class="review_date">
					                2021-08-31 20:03:24
					            </dt>
					        </dl>
					        <dl>
					            <dt><b>백예린</b></dt>
					            <dt class="review_content">
					                좋아요!
					            </dt>
					            <dt class="review_date">
					                2021-08-30 09:42:14
					            </dt>
					        </dl>
					    </div>
					</div>
				</div>
			</div>
		</form>
	</div>
    <!-- 20210903 이상훈 제품구매 상세 페이지 작업 END-->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
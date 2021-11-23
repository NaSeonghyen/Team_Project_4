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
    <title>OT4ZO - 상품 조회</title>        
    <!--페이지 제목 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">

    <!-- CSS 적용 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/product_list.css">

    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/product_list.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20210901 이상훈 상품 조회 메인 페이지 작업 START-->
	<!-- 20211105 나성현 서블릿 연동 부분 추가-->
    <div class="container">
        <!-- NEW -->
        <div class="shop-info">
     		<h1>${kind}</h1> 
        </div>
        <div class="product-list-box">
            <!-- 카테고리 -->
            <div class="product-category">
                <ul class="product-category-wrap">
                	<c:if test="${kind eq 'NEW' || kind eq 'BEST' }">
                		<li>
	                   		<a href ="Ot4zoServlet?command=product&sort=1&product_kind=NEW">
	                        	<b class ="more-1" id ="tab-1">NEW</b>
	                        </a>
	                    </li>
	                    <li>
	                        <a href ="Ot4zoServlet?command=product&sort=1&product_kind=BEST">
	                        	<b class ="more-1" id ="tab-2">BEST</b>
	                        </a>
	                    </li>
                	</c:if>
	                <c:if test="${kind eq '가디건/자켓' || kind eq '코트' || kind eq 'ACC'}">
	                	<li>
	                   		<a href ="Ot4zoServlet?command=product&sort=1&product_kind=가디건/자켓">
	                        	<b class ="more-1" id ="tab-3">가디건/자켓</b>
	                        </a>
	                    </li>
	                    <li>
	                        <a href ="Ot4zoServlet?command=product&sort=1&product_kind=코트">
	                        	<b class ="more-1" id ="tab-4">코트</b>
	                        </a>
	                    </li>
	                    <li>
	                   		<a href ="Ot4zoServlet?command=product&sort=1&product_kind=ACC">
	                        	<b class ="more-1" id ="tab-5">ACC</b>
	                        </a>
	                    </li>
	                </c:if>
	                <c:if test="${kind eq '니트/스웨터' || kind eq '셔츠/블라우스' }">
	                	<li>
	                        <a href ="Ot4zoServlet?command=product&sort=1&product_kind=니트/스웨터">
	                        	<b class ="more-1" id ="tab-6">니트/스웨터</b>
	                        </a>
	                    </li>
	                    <li>
	                   		<a href ="Ot4zoServlet?command=product&sort=1&product_kind=셔츠/블라우스">
	                        	<b class ="more-1" id ="tab-7">셔츠/블라우스</b>
	                        </a>
	                    </li>
	                </c:if>
	                <c:if test="${kind eq '팬츠' || kind eq '슬랙스' || kind eq '레깅스' || kind eq '스커트' }">
	                	<li>
	                        <a href ="Ot4zoServlet?command=product&sort=1&product_kind=팬츠">
	                        	<b class ="more-1" id ="tab-8">팬츠</b>
	                        </a>
	                    </li>
	                    <li>
	                   		<a href ="Ot4zoServlet?command=product&sort=1&product_kind=슬랙스">
	                        	<b class ="more-1" id ="tab-9">슬랙스</b>
	                        </a>
	                    </li>
	                    <li>
	                        <a href ="Ot4zoServlet?command=product&sort=1&product_kind=레깅스">
	                        	<b class ="more-1" id ="tab-10">레깅스</b>
	                        </a>
	                    </li>
	                    <li>
	                   		<a href ="Ot4zoServlet?command=product&sort=1&product_kind=스커트">
	                        	<b class ="more-1" id ="tab-11">스커트</b>
	                        </a>
	                    </li>
	                </c:if>
                    <li>
                        <a> ${kind_cnt} items</a>
                    </li>
                    <li>
                        <select id="select_sort" onchange="productsort()">
                            <option value="1${kind}" selected>상품정렬</option>
                            <option value="2${kind}">이름</option>
                            <option value="3${kind}">최근</option>
                            <option value="4${kind}">높은가격</option>
                            <option value="5${kind}">낮은가격</option>
                        </select>
                    </li>
                </ul>      
            </div>           
        </div>
        <!--상품 이미지-->
        <div class="product-main-info">
        	<c:forEach items="${newProductList}"  var="productVO">
               	<div class="product-list">
					<a href= "Ot4zoServlet?command=product_detail&pseq=${productVO.pseq}&quantity=0">
			          	<c:choose>
			          		<c:when test="${empty productVO.product_url}">
			          			<img src="${pageContext.request.contextPath}/resources/img/${productVO.product_image}" alt="${productVO.product_name}">
			          		</c:when>
			          		<c:otherwise>
			          			<img src="${productVO.product_url}"  alt="${productVO.product_name}"/>
			          		</c:otherwise>
			          	</c:choose>
		          	</a>
		            <p class="prd-name">${productVO.product_name}</p>    
		            <p class=prd-price>가격 : <fmt:formatNumber value="${productVO.product_price}" pattern="#,##0" />원 </p>
		    	</div>
			</c:forEach>
			<div class="clear"></div>
        </div>
    </div>
    <!-- 20210902 이상훈 상품 조회 메인 페이지 작업 END-->
	<!-- Footer  -->       
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
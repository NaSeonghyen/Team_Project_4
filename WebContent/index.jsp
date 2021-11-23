<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--페이지 제목-->
	<title>OT4ZO - 메인 화면</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"><!--이미지 슬라이더 -->
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="views/common/header.jsp"%>
	<!-- 20210827 이상훈,정주연 jsp 컨테이너 작업 START -->
	<!-- 20211105 나성현 back-end 영역 연결로 인한 수정, 이상훈 FAQ 이미지 변경 -->
	<section>
	    <div class="container">
	        <!--이미지 슬라이더-->
	        <div class="slider">
	            <div class="slider-img">
	                <a href="Ot4zoServlet?command=product&sort=1&product_kind=NEW">
	                    <img src="${pageContext.request.contextPath}/resources/img/image_slide01.png" alt="">
	                </a>
	            </div>
	            <div class="slider-img">
	                <a href="Ot4zoServlet?command=product&sort=1&product_kind=BEST">
	                    <img src="${pageContext.request.contextPath}/resources/img/image_slide02.png" alt="">
	                </a>
	            </div>
	        </div>
	        <!--NEW 영역-->
	        <div class="inner">
	            <div class="item_title">
	                <a class="title">NEW</a>
	                <a class="more" href="Ot4zoServlet?command=product&sort=1&product_kind=NEW">more ▶</a>
	            </div>
	        </div>
	        <div class="inner">
	            <div class="prod_info">
	            	<ul>
		            	<c:forEach items="${newProductList}"  var="productVO">
			            	<li>
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
					            <p class="info">${productVO.product_name}</p>    
					            <p class="price">가격 : <fmt:formatNumber value="${productVO.product_price}" pattern="#,##0" />원 </p>
					        </li>
				      	</c:forEach>   
    				</ul>
	            </div>
	        </div>
	        <!--BEST 영역-->
	        <div class="inner">
	            <div class="item_title">
	                <a class="title">BEST</a>
	                <a class="more" href="Ot4zoServlet?command=product&sort=1&product_kind=BEST">more ▶</a>
	            </div>
	        </div>
	        <div class="inner">
	            <div class="prod_info">
	                <ul>
	                	<c:forEach items="${bestProductList}"  var="productVO">
			            	<li>
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
					            <p class="info">${productVO.product_name}</p>    
					            <p class="price">가격 : <fmt:formatNumber value="${productVO.product_price}" pattern="#,##0" />원 </p>
					        </li>
				      	</c:forEach>
	                </ul>
	            </div>
	            <!--공지사항-->
	            <div id = notice_content>
	                <article id="notice">
	                	<c:choose>
	                		<c:when test="${loginUser.memId=='ADMIN'}">
	                			<p class="title">공지사항
		                        <a class="more" href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_listAdmin"><img class="more" src="${pageContext.request.contextPath}/resources/img/more.gif" alt="더보기" /></a></p>
		                    	<div class="content">
			                        <ul>
			                        	<c:forEach items="${newNotice}"  var="noitceVO">
				                            <li>
				                                <div class="subject">
				                                    <a href="Ot4zoServlet?command=notice_viewAdmin&nId=${noitceVO.nId}&page=1&pageDataCount=5">${noitceVO.nTitle}</a>
				                                </div>
				                                <div class="date"><fmt:formatDate value="${noitceVO.nDate}" pattern="yyyy-MM-dd"/></div>
				                            </li>
			                            </c:forEach>
			                        </ul>
		                    	</div>
	                		</c:when>
	                		<c:otherwise>
	                			<p class="title">공지사항
		                        <a class="more" href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_list"><img class="more" src="${pageContext.request.contextPath}/resources/img/more.gif" alt="더보기" /></a></p>
		                    	<div class="content">
			                        <ul>
			                        	<c:forEach items="${newNotice}"  var="noitceVO">
				                            <li>
				                                <div class="subject">
				                                    <a href="Ot4zoServlet?command=notice_view&nId=${noitceVO.nId}&page=1&pageDataCount=5">${noitceVO.nTitle}</a>
				                                </div>
				                                <div class="date"><fmt:formatDate value="${noitceVO.nDate}" pattern="yyyy-MM-dd"/></div>
				                            </li>
			                            </c:forEach>
			                        </ul>
		                    	</div>
	                		</c:otherwise>
	                    </c:choose>
	                </article>
	                <!--FAQ-->
	                <article id="faq">
	                    <div class="content">
	                        <div class="title">
	                        	<a href="views/board/faq.jsp">
	                        		<img src="resources/img/faq_img.png" alt="faq">
	                        	</a>
	                        </div>
	                    </div>
	                </article>
	            </div>
	        </div>
	    </div>
	</section>
	<!-- 20210827 이상훈,정주연 HTML 컨테이너 작업 END -->
	<!-- Footer  -->
	<%@include file="views/common/footer.jsp"%>
</body>
</html>
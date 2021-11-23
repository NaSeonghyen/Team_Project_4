<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OT4ZO - 사이트맵</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/Sitemap.css">
	
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
	<!-- Footer  -->
	<%@include file="../common/header_login.jsp"%>
 	<!-- 20210831 윤소라 사이트맵작업 START -->
 	<!-- 20211101 나성현 서블릿 연동 부분 추가 -->
    <div class = main_map>
        <!-- 사이트맵 이름 -->
        <div id = "map_name"><h2>사이트맵</h2></div>
        <!-- 브랜드소개 메뉴-->
        <ul id = "sub_map">
            <!-- 브랜드소개 서브메뉴 -->
            <li id = "sub_map_title">브랜드소개</li>
            <li id = "map_list"><a href = "Intro_company.jsp">회사소개</a></li>
            <li id = "map_list"><a href = "Organization.jsp">조직도</a></li>
            <li id = "map_list"><a href = "Sitemap.jsp">사이트맵</a></li>
        </ul>
        <!-- 추천코디 메뉴-->
        <ul id = "sub_map">
        <!-- 추천코디 서브메뉴 -->
            <li id = "sub_map_title">Trending</li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=NEW">NEW</a></li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=BEST">BEST</a></li>
        </ul>
        <!-- 아우터 메뉴 -->
        <ul id = "sub_map">
            <!-- 아우터 서브메뉴 -->                    
            <li id = "sub_map_title">아우터/ACC</li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=가디건/자켓">가디건/자켓</a></li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=코트">코트</a></li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=ACC">ACC</a></li>
        </ul>
        <!-- 상의 메뉴 -->
        <ul id = "sub_map">
            <!-- 상의 서브메뉴 -->
            <li id = "sub_map_title">상의</li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=니트/스웨터">니트/스웨터</a></li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=셔츠/블라우스">셔츠/블라우스</a></li>
        </ul>
        <!-- 하의 메뉴 -->
        <ul id = "sub_map">
            <!-- 하의 서브메뉴 -->
            <li id = "sub_map_title">하의</li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=팬츠">팬츠</a></li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=슬랙스">슬랙스</a></li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=레깅스">레깅스</a></li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=스커트">스커트</a></li>
        </ul>
        <!-- 고객센터 메뉴 -->
        <ul id = "sub_map">
            <!-- 새소식 서브메뉴 -->
            <li id = "sub_map_title">고객센터</li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/Ot4zoServlet?command=board_list">1:1문의</a></li>
            <li id = "map_list"><a href = "${pageContext.request.contextPath}/views/board/faq.jsp">FAQ</a></li>
        </ul>
        <!-- 새소식 메뉴 -->
        <ul id = "sub_map">
            <!-- 새소식 서브메뉴 -->
            <li id = "sub_map_title">새소식</li>
           	<c:choose>
				<c:when test="${loginUser.memId=='ADMIN'}">	
					<!--새소식-->
					<li id = "map_list"><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_listAdmin">공지사항</a></li>
				</c:when>
				<c:otherwise>
					<!--새소식-->
					<li id = "map_list"><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_list">공지사항</a></li>
				</c:otherwise>
			</c:choose>
        </ul>
    </div>
    <!-- 20210831 윤소라 사이트맵작업 END -->
    <!-- Footer  -->
    <%@include file="../common/footer_login.jsp"%>
</body>
</html>
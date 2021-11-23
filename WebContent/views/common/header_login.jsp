<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!-- 20210827 나성현,위재림 jsp 헤더 작업 START -->
	<!-- 20211101 신정민 CSS 변화로 인한 JSP 태그 변경 -->
	<header id="header">
		<div class="inner">
			<div id="header_top">
				<!--로고 이미지-->
				<div class="logo">
					<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=index">
						<img src="${pageContext.request.contextPath}/resources/img/logo.png">
					</a>
				</div>
				<!--상단 메뉴-->
				<ul class="top_menu">
					<c:choose>
						<c:when test="${empty loginUser.memId}">
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=login_form">로그인</a>
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=join_form">회원가입</a>
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=login_form">마이페이지</a>
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=login_form">장바구니</a>
						</c:when>
						<c:when test="${loginUser.memId=='ADMIN'}">
							<a>${loginUser.memName}님 </a>
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=logout">로그아웃</a>
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_listAdmin">공지사항</a>
						</c:when>
						<c:otherwise>
							<a>${loginUser.memName}님 </a>
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=logout">로그아웃</a>
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=mypage_form">마이페이지</a>
							<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=cart_list">장바구니</a>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<!--탭 메뉴-->
			<nav id="main_menu">
				<ul class="tab_bar">
					<!--브랜드 소개-->
					<li class="dept01">
						<a href="${pageContext.request.contextPath}/views/introduce/Intro_company.jsp">브랜드 소개</a>
						<ul class="dept02">
							<li><a href="${pageContext.request.contextPath}/views/introduce/Intro_company.jsp">회사 소개</a></li>
							<li><a href="${pageContext.request.contextPath}/views/introduce/Organization.jsp">조직도</a></li>
							<li><a href="${pageContext.request.contextPath}/views/introduce/Sitemap.jsp">사이트맵</a></li>
						</ul>
					</li>
					<!--Trending-->
					<li class="dept01">
						<a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=NEW">Trending</a>
						<ul class="dept02">
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=NEW">NEW</a></li>
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=BEST">BEST</a></li>
						</ul>
					</li>
					<!--아우터/ACC-->
					<li class="dept01"><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=0&product_kind=가디건/자켓">아우터/ACC</a>
						<ul class="dept02">
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=가디건/자켓">가디건/자켓</a></li>
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=코트">코트</a></li>
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=ACC">ACC</a></li>
						</ul>
					</li>
					<!--상의-->
					<li class="dept01"><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=니트/스웨터">상의</a>
						<ul class="dept02">
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=니트/스웨터">니트/스웨터</a></li>
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=셔츠/블라우스">셔츠/블라우스</a></li>
						</ul>
					</li>
					<!--하의-->
					<li class="dept01"><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=팬츠">하의</a>
						<ul class="dept02">
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=팬츠">팬츠</a></li>
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=슬랙스">슬랙스</a></li>
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=레깅스">레깅스</a></li>
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=product&sort=1&product_kind=스커트">스커트</a></li>
						</ul>
					</li>
					<!--고객센터-->
					<li class="dept01"><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=board_list">고객센터</a>
						<ul class="dept02">
							<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=board_list">1:1문의</a></li>
							<li><a href="${pageContext.request.contextPath}/views/board/faq.jsp">FAQ</a></li>
						</ul>
					</li>
					<c:choose>
						<c:when test="${loginUser.memId=='ADMIN'}">	
							<!--새소식-->
							<li class="dept01"><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_listAdmin">새소식</a>
								<ul class="dept02">
									<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_listAdmin">공지사항</a></li>
								</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li class="dept01"><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_list">새소식</a>
								<ul class="dept02">
									<li><a href="${pageContext.request.contextPath}/Ot4zoServlet?command=notice_list">공지사항</a></li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</header>
	<!-- 20210827 나성현,위재림 HTML 헤더 작업 END -->
</body>
</html>
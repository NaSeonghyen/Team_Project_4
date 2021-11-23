<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!-- 20210827 송석환,윤소라 HTML 푸터 작업 START -->
	<!-- 20211101 신정민 CSS 변화로 인한 JSP 태그 변경 -->
	<footer>
	    <!-- main 과 footer 의 경계선 -->
	    <div id= "border"></div>
	
	    <!-- 로고 -->
	    <div class = "footer-main">
	        <!-- 로고 이미지  -->
	        <ul>
	            <li id = "logo">
		            <a href = "#">
		            	<img src = "${pageContext.request.contextPath}/resources/img/logo.png">
		            </a>
	            </li>
	        </ul>
	        <!--고객센터-->
	        <ul>
	            <h4>CUSTOMER CENTER</h4>
	            <li><p id = "center1">1599-7875</p></li>
	            <li>
		            <p class = "center_time">평일 오전 10:00 ~ 오후 5:00 <br>
					토/ 일/ 공휴일 휴무
		            </p>
	            </li>
	        </ul>
	        <!--회사소개 -->       
	        <ul>
	            <h4>COMPANY</h4>
	            <p>
		            <li>(주) OT4ZO Company</li>
		            <li>대표 : OTSAZO</li>
		            <li>사업자 등록번호 : 123-45-67890</li>
	            </p>
	        </ul> 
	        <!--은행 입금 정보-->        
	        <ul>
	            <h4>BANK INFO</h4>
	            <p>
		            <li>국민 123456-12-123456</li>
		            <li>신한 123-123-123456</li>
		            <li>농협 123-1234-1234-12</li>
		            <li>예금주 : OT4ZO</li>
	            </p>
	        </ul>
	        <!--교환 / 환불 정보-->        
	        <ul>
	            <h4>RETURN/EXCHANGE</h4>
	            <li><p>경기도 수원시 ○●○ ●○●</p></li>
	            <li>
		            <p>자세한 사항은 교환 및 반품 절차는<br>
					문의란 및 공지사항을 참고해주세요</p>
				</li>
	        </ul>
	    </div>
	    <!-- footer 와 저작권정보 경계선 -->
	    <div id= "border"></div>
	    <!-- 저작권 정보 -->
	    <div class = "copyright">COPYRIGHT ⓒ O4TZO ALL RIGHTS RESERVED. DESIGNED By OT4ZO</div>
	</footer>
	<!-- 20210827 송석환,윤소라 HTML 푸터 작업 END -->
</body>
</html>
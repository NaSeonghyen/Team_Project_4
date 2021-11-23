<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--페이지 제목-->
    <title>OT4ZO - 1:1 문의</title>
    <!--페이지 제목 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">

    <!-- CSS 적용 파일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/qna.css">
    
    <!-- JS 적용 파일 -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20210831 위재림 HTML Q&A 1:1문의 글쓰기 작업 START  -->
	<section>
		<div class="board_wrap">
			<!--Q&A 1:1문의 제목-->
            <div class="board_title">
                <h2>OT4ZO 고객센터</h2>
            </div>
            <div>
                <h3 id ="sub_tit">문의하기</h3>
            </div>
            <div>
	            <ul class ="a-right">
		            <li class ="list-item">
		            	<span class = "icon">*</span>은 필수 입력사항입니다.
		            </li>
	            </ul>
            </div>
            <form action="Ot4zoServlet" method="post" name="frm" enctype="multipart/form-data">
            	<input type="hidden" name="command" value="board_write">
                <div class="board_write_wrap">       
                	<div class="board_write">
	                    <!--문의유형-->
	                    <div class="select">
	                        <dl>
	                            <dt><span class = "icon">*</span>문의유형</dt>
	                            <select name="bSubTitle" id = "selectcss">                                    
	                                <option value ="fail">선택하세요</option>
	                                <option>전체문의</option>
	                                <option>상품문의</option>
	                                <option>배송문의</option>
	                                <option>교환/반품문의</option>
	                                <option>입금/기타문의</option>
	                            </select>
	                        </dl>
						</div>
						<!--문의 제목-->
						<div class="title">
	                        <dl>
	                        	<dt><span class = "icon">*</span>문의제목</dt>
	                            <dd><input type="text" name="bTitle" id="textbox"   placeholder="문의제목을 입력해주세요."></dd>
	                        </dl>
                        </div>
                        <!--작성자-->
                        <div class="info_user">
                            <dl>
                                <dt><span class = "icon">*</span>아이디</dt>
                                <dd class ="abc"><input type="text" name="MID" id="textbox" value ="${loginUser.memId}" readonly></dd>
                            </dl>
                        </div>
                        <!--비밀번호-->
                        <div class="info_userpw">
                            <dl>
                                <dt><span class = "icon">*</span>비밀번호</dt>
                                <dd><input type="password" name="bPassword" id="textbox"   placeholder="비밀번호를 입력해주세요." required ></dd>
                            </dl>
                        </div>
                        <!--문의내용-->
                        <div class="cont">
                        	<dl>
	                            <dt><span class = "icon">*</span>문의내용</dt>           
	                           	<dd> <textarea placeholder="문의내용을 입력해주세요." name="bContent"></textarea></dd>
                        	</dl>
                        </div>
                        <!--첨부파일-->
                        <div class = "form-group">
                        	<div class ="form-label">파일첨부</div>
                           	<div class="filebox">
							    <input class="upload-name" value="첨부파일" >
							    <label for="Pictureurl">파일찾기</label> 
							    <input type="file" id="Pictureurl" name ="Pictureurl" accept="image/*" onclick="abc()">
						   	</div>
						</div> 
						   
                        <!--문의 등록 및 버튼-->
                        <div class="bt_wrap">
                            <input type="button" value="취소" id = "list-btn"onclick="location.href='Ot4zoServlet?command=board_list'">
                        	<input type="submit" value="문의하기" id = "inquiry-btn" onclick="return boardCheck()">
                        </div>
					</div>
				</div>
			</form>
		</div>
    </section>
    <!-- 20210831 위재림 HTML Q&A 1:1문의 글쓰기 작업 END -->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
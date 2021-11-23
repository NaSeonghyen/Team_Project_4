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
	<title>OT4ZO - 공지사항</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/notice.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<!-- 20211031 위재림 공지사항 글쓰기 작업 START  -->
	<form action="Ot4zoServlet" method="post" name="frm" enctype="multipart/form-data">
		<input type="hidden" name="command" value="notice_write">
			<section>
            	<div class="board_wrap">
                	<li id="notice_image"></li>
                    <div>
                        <h3 id ="sub_tit">공지사항 등록하기</h3>
                    </div>
                    <div>
	                    <ul class ="a-right">
		                    <li class ="list-item">
		                    	<span class = "icon">*</span>은 필수 입력사항입니다.
		                    </li>
	                    </ul>
                    </div>
                    <div class="board_write_wrap">       
                    	<div class="board_write">
                        	<!--문의 제목-->
                            <div class="title">
                                <dl>
                                    <dt><span class = "icon">*</span>공지제목</dt>
                                    <dd><input type="text" name="nTitle" id="textbox"   placeholder="문의제목을 입력해주세요."></dd>
                                </dl>
                            </div>
                            <!--작성자-->
                            <div class="info_user">
                                <dl>
                                    <dt><span class = "icon">*</span>아이디</dt>
                                    <dd class ="abc"><input type="text" name="nAdminId" id="textbox"  value ="${loginUser.memId}" readonly ></dd>
                                </dl>
                            </div>
                            <!--비밀번호-->
                            <div class="info_userpw">
                                <dl>
                                    <dt><span class = "icon">*</span>비밀번호</dt>
                                    <dd><input type="password" name="nPass" id="textbox"   placeholder="비밀번호를 입력해주세요." required ></dd>
                                </dl>
                            </div>
                            <!--공지내용-->
                            <div class="cont">
                                <dl>
                                	<dt><span class = "icon">*</span>공지내용</dt>           
                               		<dd><textarea placeholder="공지할내용을 입력해주세요." name="nContent"></textarea></dd>
                            	</dl>
                            </div>
                            <!--첨부파일-->
                           	<div class = "form-group">
                           		<div class ="form-label">파일첨부</div>
                           		<div class="filebox">
								    <input class="upload-name" value="첨부파일" >
								    <label for="Pictureurl">파일찾기</label> 
								    <input type="file" id="Pictureurl" name ="nPictureurl" accept="image/*" onclick="abc()">
							   	</div>	   
							</div> 
							<!--문의 등록 및 버튼-->
							<div class="bt_wrap">
                            	<input type="button" value="취소" id = "list-btn" onclick="location.href='Ot4zoServlet?command=notice_listAdmin'">
                        		<input type="submit" value="등록하기" id = "inquiry-btn" onclick="return NoticeCheck()">
                        	</div>
						</div>
					</div>
				</div>
		</section>
	</form>
	<!-- 20211101 위재림 공지사항 추가 작업 END -->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
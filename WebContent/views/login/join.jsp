<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!--페이지 제목-->
	<title>OT4ZO - 회원가입</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 다음 우편번호 API JS -->
</head>
<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
	<form action="Ot4zoServlet?command=join" method="post" name="frm">
		<!--20210830 이상훈 회원가입 페이지 작업 START-->
		<!-- 20211020 송석환 서블릿 연동 추가 작업-->
		<!--회원가입 제목 -->
		<div class="join-title">
			<h2>회원가입</h2>
		</div>
		<!--기본정보 부분 -->
		<div class="join-box">
			<div class="area-box">
				<div class="input-title">기본정보</div>
				<!--아이디-->
				<div class="input-box">
					<label for="mb_id" class="label-css"><span
						style='color: red;'>&#42;</span>아이디</label> <input type="text"
						name="mb_id" required class="input-css" id="mb_id" maxlength="20"
						placeholder="아이디를 입력해주세요."> <input type="hidden"
						name="reid" size="20"> <input type="button" id="mb_id_btn"
						value="중복 확인" onclick="idCheck()">
				</div>
				<!--비밀번호-->
				<div class="input-box">
					<label for="mb_pw" class="label-css"><span
						style='color: red;'>&#42;</span>비밀번호</label> <input type="password"
						name="mb_pw" required class="input-css" minlength="8"
						maxlength="20" placeholder="최소 8글자, 최대 20자이내로 입력해주세요.">
				</div>
				<!--비밀번호 확인-->
				<div class="input-box">
					<label for="mb_pw_y" class="label-css"><span
						style='color: red;'>&#42;</span>비밀번호 확인</label> <input type="password"
						name="mb_pw_y" required class="input-css" minlength="8"
						maxlength="20" placeholder="최소 8글자, 최대 20자이내로 입력해주세요.">
				</div>
				<!--이름-->
				<div class="input-box">
					<label for="mb_name" class="label-css"><span
						style='color: red;'>&#42;</span>이름</label> <input type="text"
						name="mb_name" required class="input-css"
						placeholder="이름을 입력해주세요.">
				</div>
				<!--휴대전화-->
				<div class="input-box">
					<label for="mb_hp" class="label-css"><span
						style='color: red;'>&#42;</span>휴대전화</label> <input type="hidden"
						name="mb_hp" class="input-css">

					<div class="part-wrap">
						<div class="part-wrap-1">
							<select class="input-css" name="mb_hp_01">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
						</div>
						<div class="part-wrap-1">
							<input type="text" name="mb_hp_02" class="input-css"
								maxlength="4">
						</div>
						<div class="part-wrap-1">
							<input type="text" name="mb_hp_03" class="input-css"
								maxlength="4">
						</div>
					</div>
				</div>
				<!--이메일-->
				<div class="input-box">
					<input type="hidden" name="email"> <label for=mb_email
						class="label-css"><span style='color: red;'>&#42;</span>이메일</label>
					<div class="part-wrap">
						<div class="part-wrap-2">
							<input type="text" name="mb_email" class="input-css"
								placeholder="이메일" maxlength="12">
						</div>
						<div>@</div>
						<div class="part-wrap-2">
							<select class="input-css" name="mb_email2">
								<option value="">선택</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="korea.com">korea.com</option>
								<option value="nate.com">nate.com</option>
								<option value="yahoo.com">yahoo.com</option>
							</select>
						</div>
					</div>
				</div>
				<!--생년월일-->
				<div class="input-box">
					<label for="mb_birth" class="label-class"><span
						style='color: red;'>&#42;</span>생년월일</label> <input type="hidden"
						name="mb_birth" class="input-class">

					<div class="part-wrap">
						<div class="part-wrap-1">
							<input type="text" name="mb_birth_y" class="input-css"
								placeholder="년" maxlength="4">
						</div>

						<div class="part-wrap-1">
							<select class="input-css" name="mb_birth_m">
								<option value="">월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
							</select>
						</div>

						<div class="part-wrap-1">
							<select class="input-css" name="mb_birth_d">
								<option value="">일</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
							</select>
						</div>
					</div>
				</div>
				<!--주소-->
				<div class="input-box">
					<label for="mb_addr" class="label-css"><span
						style='color: red;'>&#42;</span>주소</label>
				</div>
				<div>
					<input type="text" name="mb_addr" class="input-css2" readonly
						style="width: 160px; height: 44px;"> <input type="button"
						onclick="mb_addr_exeDaumPostcode()" value="우편번호 찾기" class="find_btn"
						style="width: 100px; height: 44px;"> <input type="text"
						name="mb_addr_1" class="input-css2" readonly>
				</div>
				<!--상세주소-->
				<input type="text" name="mb_addr_2" class="input-css2"
					placeholder="상세주소를 입력해주세요.">
			</div>

			<!--약관동의 부분-->
			<div class="area-box">
				<div class="input-title">
					<span style='color: red;'>&#42;</span>약관동의
				</div>
				<!--전체동의-->
				<div class="check-box">
					<input type="checkbox" class="check-input" name="all-check"
						value="selectall" onclick="selectAll(this)"> <label
						for="all-check" class="check-label"><b>전체동의</b></label>
				</div>
				<!--이용약관 동의-->
				<div class="check-box">
					<input type="checkbox" class="check-input" name="all-check"
						id="check_1" value="check-1"> <label for="check-1"
						class="check-label"><b>[필수] 이용약관 동의</b></label>
				</div>
				<!--개인정보 수집 및 이용 동의-->
				<div class="check-box">
					<input type="checkbox" class="check-input" name="all-check"
						id="check_2" value="check-2"> <label for="check-2"
						class="check-label"><b>[필수] 개인정보 수집 및 이용 동의</b></label>
				</div>
				<!--SMS 수신 동의-->
				<div class="check-box">
					<input type="checkbox" class="check-input" name="all-check"
						id="check_3" value="check-3"> <label for="check-3"
						class="check-label"><b>[선택] SMS 수신 동의</b></label>
				</div>
				<!--이메일 수신 동의-->
				<div class="check-box">
					<input type="checkbox" class="check-input" name="all-check"
						id="check_4" value="check-4"> <label for="check-4"
						class="check-label"><b>[선택] 이메일 수신 동의</b></label>
				</div>
				<!--회원가입 버튼-->
				<div class="join-btn">
					<button type="submit" class="btn-1" onclick="return joinCheck()">
						<a>join</a>
					</button>
				</div>
			</div>
		</div>
		<!-- 20210831이상훈 회원가입 페이지 작업 END-->
	</form>
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>
</body>
</html>
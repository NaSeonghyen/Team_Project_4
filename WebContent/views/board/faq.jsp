<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--페이지 제목-->
	<title>OT4ZO - FAQ</title>
	<!--페이지 제목 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo_icon.png">
	
	<!-- CSS 적용 파일 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/faq.css">
	
	<!-- JS 적용 파일 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>

<body>
	<!-- Header  -->
	<%@include file="../common/header_login.jsp"%>
    <!--20210831 정주연 HTML Q&A FAQ 목록 작업 START -->
    <!--20211101 이상훈 Q&A CSS로 인한 JSP 수정 -->
	<div id="content">
		<div id="faq_title">
			<h2>OT4ZO 고객센터</h2>
		</div>
		<div>
			<h3 id ="faq_subtitle">자주찾는 도움말</h3>
		</div>	
		<div id="category_wrap"></div>
  
 		<!--FAQ 메뉴 부분-->
		<div class="accrodion">
			<input type="checkbox" id="anw01">
			<label for="anw01"> 
				<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                    	 주소지를 잘못 입력해서 다른 곳으로 배송이 되었어요.<em></em>
            </label>
			<div>
				<div id = "faq_icon"><img src ="../../resources/img/icon-nodata.svg">
					<div id = "faq_text">
						<p>1:1 문의게시판 또는 실시간 상담으로 문의 부탁드립니다. 빠르게 도움드릴 수 있도록하겠습니다.
							<br>
							<br>
                      	</p>
                    </div>
                </div>
            </div>

            <input type="checkbox" id="anw02">
            <label for="anw02"> 
            	<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                           제품 반품 했는데 언제 환불되나요?<em></em>
            </label>
            <div>
          		<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
                	<div id ="faq_text">
		                <p>반품 환불의 경우 고객님이 반품하신 제품이 당사 물류센터로 정상 입고되어 상품 검수 후
		                <br>이상이 없는 경우 즉시 환불처리해 드리며 이는 약 3~7일정도 소요됩니다.*카드 취소의 경우
		                <br>카드취소 접수 이후, 영업일 기준 카트사 확인까지 3~5일 이후 확인 가능합니다.</p>
               		</div>                                            
              	</div>                                          
			</div>

            <input type="checkbox" id="anw03">
            <label for="anw03"> 
                <img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                     주문 시 적립금 적용은 어떻게 하나요?<em></em>
            </label>
            <div>
	           	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
               		<div id ="faq_text">
	               	 	<p>주문하기 페이지 내 할인 및 최종 결제 금액 영역의 적립금 입력란에서 적용 가능합니다.
	                    <br>고객님께서 보유하고 계신 적립금은 마이페이지에서 확인할 수 있으며, 구매금액 합계가 3만원 이상일 경우,
	                    <br>1회 결제시 최대 1만원까지 사용 가능합니다.</p>
	            	</div> 
	            </div>   
            </div>
			<input type="checkbox" id="anw04">
			<label for="anw04">
				<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                            휴먼희원으로 전환 되었는데 어떻게 다시 로그인 하나요?<em></em>
            </label>
           	<div>
            	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
                	<div id ="faq_text">
                   		<p>일반적인 로그인 방식처럼, 웹사이트에서 ID와 패스워드를 입력하시면 바로 휴면 상태가끝나게 됩니다.
                   		<br>
                   		<br>
                    	</p>
                   	</div>
                </div>
			</div>

			<input type="checkbox" id="anw05">
            	<label for="anw05"> 
                	<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                         탈퇴 이전의 기록을 복원할 수 있나요?<em></em>
			</label>
          	<div>
 				<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
                  	<div id ="faq_text">
	               		<p>탈퇴 시 회원님의 이전 기록은 개인정보보호 방침에 따라 저희가 파기하도록 되어 있습니다.
	                    <br>따라서 복원하기가 어려운 점 양해 부탁드립니다.
	                    </p>
					</div>                                        
				</div>                                          
			</div>
            <input type="checkbox" id="anw06">
            <label for="anw06"> 
            	<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                         교환/반품 시 배송비 부담은 어떻게 되나요?<em></em>
            </label>
            <div>
            	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
                	<div id ="faq_text">
                    	<p>제품 하자일 경우 고객님의 배송비 부담이 없으나,
                                                                         고객님의 단순 변심일 경우에는 왕복 택배비 6천원이 부과됩니다.
                        <br>
                        <br> 
                        </p>
                    </div>                                                 
                </div>                                          
			</div>
            <input type="checkbox" id="anw07">
            <label for="anw07"> 
            	<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                         주문 시 쿠폰 적용은 어떻게 하나요?<em></em>
            </label>
            <div>
            	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
                	<div id ="faq_text">
                    	<p>주문하기 페이지 내 할인 및 최종 결제 금액 영역의 쿠폰 적용란에서 적용합니다.
                        <br> 고객님께서 보유하고 계신 쿠폰은 마이페이지에서 확인할 수 있습니다.</p>
                     </div>                                           
                </div>                                             
            </div>

            <input type="checkbox" id="anw08">
            <label for="anw08"> 
            	<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                         택배사가 어디인가요?<em></em>
            </label>
			<div>
            	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
              		<div id ="faq_text">
                  		<p>cj 대한통운 택배를 이용하고 있습니다.
	                  		<br>
	                   		<br>
                 		</p>
                  	</div>
              	</div>
			</div>
            <input type="checkbox" id="anw09">
            <label for="anw09"> 
            	<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                        고객센터 운영시간이 어떻게 되나요?<em></em>
            </label>
            <div>
            	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
                	<div id ="faq_text">
                   		<p>고객센터는 주말,공휴일을 제외하고 평일 오전 10시~17까지 운영되며 점심시간은 12시30분 ~ 1시30분 입니다.
                          <br>고객센터 운영시간에 1:1 문의 게시판 또는 실시간 상담으로 문의주시면 최대한 빠르게 처리해 드리겠습니다.
                        </p>
                    </div>                                         
                </div>                                          
			</div>

            <input type="checkbox" id="anw10">
            <label for="anw10">
            	<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
               	  취소,반품,교환 정책이 어떻게 되나요?<em></em>
            </label>
            <div>
            	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
               		<div id ="faq_text">
               		   <p>교환 및 환불 사유에 따라 상이한 정책을 적용하고 있습니다. 아래내용을 확인하시어 구매에 불편함이 없으시기를 바랍니다.<br>※제품에 명백한 하자가 있는 경우
                   	   <br>-배송 완료 후 30일 이내에 가능합니다.
                   	   <br>-제품 하자를 확일할 수 있는 사진이 필요합니다. 1:1 문의게시판을 통해 접수해 주시면 됩니다.
                  	   <br>-제품 회수 후 환불이 진행됩니다.
                       <br>-발생되는 배송비를 전액 OT4ZO가 부담합니다.
             		   </p>
                    </div>
               </div>
            </div>
            <input type="checkbox" id="anw11">
            <label for="anw11">
            	<img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                     어떤 결제 방식을 제공하고 있나요?<em></em>
            </label>
            <div>
            	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
                	<div id ="faq_text">
	                 	<p>현재 신용카드, 간편결제, 무통장입금 방식을 지원하고 있습니다.
	                 	<br>
	                 	<br>
	                 	</p>
                	</div>
                </div>	
            </div>
            <input type="checkbox" id="anw12">
            <label for="anw12"> 
                <img src ="../../resources/img/faq_q_icon.png">&nbsp;&nbsp;
                                                     배송까지 얼마나 걸리나요?<em></em>
            </label>
            <div>
            	<div id ="faq_icon"><img src ="../../resources/img/icon-nodata.svg">
                	<div id ="faq_text">
                		<p>오후 6시 이전 주문건에 대해서는 당일 출고를 하고 있습니다. 그 이후는 익일에출고가 됩니다.<br>
                	   	     출고 후 택배사 영업일 기준으로 보통 1~2일 소요되나,
                	   	     산간/도서 지방이나 공휴일/명절 등 특수한 경우 이보다 조금 더 지체될 수 있습니다.
                    	</p>                                    
					</div>
        		</div>
			</div>	
			<br> <br> <br> <br> <br>
			<c:choose>
				<c:when test="${empty loginUser.memId}">		
					<div>
						<ul class ="a-right">
							<li class ="list-item">
								<a href ="${pageContext.request.contextPath}/Ot4zoServlet?command=login_form">                  	
					       			<h3>1:1 문의<span id ="w_br"></span>바로가기</h3>
					       		</a>
							</li>
						</ul>
					</div>
    			</c:when>
				<c:otherwise>
					<div>
						<ul class ="a-right">
							<li class ="list-item">                   	
								<a href ="${pageContext.request.contextPath}/Ot4zoServlet?command=board_list">                  	
					       			<h3>1:1 문의<span id ="w_br"></span>바로가기</h3>
					       		</a>
							</li>
			 			</ul>
					</div>
    			</c:otherwise>
			</c:choose>

			<!--페이지 표시 부분-->
          	<div class="page-list"></div>
		</div> <!-- content -->
	</div> <!-- wrapper  -->
	<!--20210831 정주연 HTML Q&A FAQ 목록 작업 END -->
	<!-- Footer  -->
	<%@include file="../common/footer_login.jsp"%>            
</body>
</html>
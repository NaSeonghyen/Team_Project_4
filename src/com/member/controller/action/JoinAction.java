package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ot4zo.dao.MemberDAO;
import com.ot4zo.vo.MemberVO;
//20211011 나성현 회원가입 동작 구현
public class JoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "views/login/login.jsp"; 
		// 세션 생성
	    HttpSession session = request.getSession();
	    
	    // 이메일 및 SMS 수신 동의 데이터 처리
		String receps[] = request.getParameterValues("all-check");
		String recepmail = "N";
		String recepsms = "N";
		for(String recep : receps) {
			if (recep.equals("check-3")) {
				recepsms = "Y";
			} else if (recep.equals("check-4")){
				recepmail = "Y";
			}
		}
	  		
		//사용자 입력된 값을  VO 객체에 저장
		MemberVO mvo = new MemberVO();
		mvo.setMemId(request.getParameter("mb_id"));
		mvo.setMemPw(request.getParameter("mb_pw"));
		mvo.setMemName(request.getParameter("mb_name"));
		mvo.setMemEmail(request.getParameter("mb_email") + "@" + request.getParameter("mb_email2"));
		mvo.setMemBirth(request.getParameter("mb_birth_y")+request.getParameter("mb_birth_m")+request.getParameter("mb_birth_d"));
		mvo.setMemphone(request.getParameter("mb_hp_01") + request.getParameter("mb_hp_02") + request.getParameter("mb_hp_03"));
		mvo.setMemAddr(request.getParameter("mb_addr_1"));
		mvo.setMemAddr2(request.getParameter("mb_addr_2"));
		mvo.setMemRecepmail(recepmail);
		mvo.setMemRecepsms(recepsms);
	      
	    session.setAttribute("id", request.getParameter("mb_id"));    
	    // DB커넥션 풀 생성
	    MemberDAO memberDAO = MemberDAO.getInstance();
	    
	    // DAO 메소드로부터 Insert한 DB 데이터 값 가져오기
	  	int result = memberDAO.insertMember(mvo);
	
	    // 회원가입이 성공한 경우
		if(result == 1) { //ID와 Message
			session.setAttribute("mb_id", mvo.getMemId());
			request.setAttribute("message", "회원가입에 성공하였습니다.");
		// 회원가입이 실패한 경우
		}else {
			request.setAttribute("message", "회원가입에 실패하였습니다.");
		}
	    
	    // 로그인 화면 이동
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	    	
	}
}

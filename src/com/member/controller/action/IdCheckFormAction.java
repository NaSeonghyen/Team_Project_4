package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ot4zo.dao.MemberDAO;
//20211011 나성현 아이디 중복체크 폼 이동 구현
public class IdCheckFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "views/login/idCheck.jsp";  
    
	    //로그인 창에서 아이디 값 가져오기
	    String userid = request.getParameter("mb_id").trim();
    
	    MemberDAO memberDAO=MemberDAO.getInstance();
	    // 아이디 중복체크 결과값 저장
		int result = memberDAO.confirmID(userid);
	    
		//아이디 중복체크 화면 이동시 아이디와 중복체크 결과 값 넘겨주기
		request.setAttribute("mb_id", userid);
		request.setAttribute("result", result);
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
    
	}
}

package com.member.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//20211011 나성현 로그아웃 동작 구현
public class LogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    String url="Ot4zoServlet?command=index";
	    
	    //세션 객체 생성
	    HttpSession session=request.getSession(false);
	    
	    if(session!=null){
	    	//로그인 세션 삭제
	    	session.invalidate();
	    }   
	    request.getRequestDispatcher(url).forward(request, response);  
	}
}
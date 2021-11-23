package com.member.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ot4zo.dao.MemberDAO;
import com.ot4zo.vo.MemberVO;
//20211011 나성현 로그인 동작 구현
public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="views/login/login.jsp";
	    HttpSession session=request.getSession();
	  
	    String userid = request.getParameter("mb_id");
		String pwd = request.getParameter("mb_password");
		
	    MemberDAO memberDAO=MemberDAO.getInstance();
	    MemberVO memberVO=memberDAO.getMember(userid);
	    
	    //회원정보가 있는 경우
	    if(memberVO!=null){
	    	int result = memberDAO.userCheck(userid,pwd);
	    	// 로그인 정보가 맞는 경우
			if( result == 1) {
				session.removeAttribute("mb_id");
				session.setAttribute("loginUser", memberVO);
				url = "Ot4zoServlet?command=index";
			// 비밀번호가 틀린 경우
			} else {
				request.setAttribute("message", "비밀번호가 맞지 않습니다.");
			} 
		// 회원 정보가 없는 경우
	    } else {
			request.setAttribute("message", "존재하지 않는 회원입니다.");
		}
	    request.getRequestDispatcher(url).forward(request, response);  
	}
}

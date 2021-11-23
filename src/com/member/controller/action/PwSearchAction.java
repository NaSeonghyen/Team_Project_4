package com.member.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ot4zo.dao.MemberDAO;
//20211011 나성현 패스워드찾기 동작 구현
public class PwSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//클라이언트에게 응답할 페이지 정보 셋팅
		response.setContentType("text/html; charset=utf-8");	
		//자바스크립트 사용을 위한 out 객체 생성
		PrintWriter out = response.getWriter();
		
		String url = "Ot4zoServlet?command=pw_change_form";  

		// 비밀번호 찾기에서 입력된 값 가져오기
		String name = request.getParameter("mb_name");	
		String mb_id = request.getParameter("mb_id");
		MemberDAO dao = MemberDAO.getInstance();

		// 비밀번호 찾기 결과 값 저장
		int result = dao.findPW(name, mb_id);
		
		// 비밀번호 찾기가 성공한 경우
		if(result == 1) { 
			request.setAttribute("mb_id", mb_id);
			RequestDispatcher ds = request.getRequestDispatcher(url);
			ds.forward(request, response);
		// 비밀번호 찾기가 실패한 경우
		}else {
			out.println("<script>alert('이름과 아이디 정보를 확인해주세요.'); history.go(-1);</script>");
		}
	}
}
package com.member.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ot4zo.dao.MemberDAO;
import com.ot4zo.vo.MemberVO;
//20211011 나성현 비밀번호 재설정 동작 구현
public class PwChangeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {    
		//클라이언트에게 응답할 페이지 정보 셋팅
		response.setContentType("text/html; charset=utf-8");	
		//자바스크립트 사용을 위한 out 객체 생성
		PrintWriter out = response.getWriter();
		
		//폼에서 입력한 비밀번호 정보 가져오기
		String pwd = request.getParameter("mb_pw");
		//비밀번호 찾기에서 입력했던 아이디 정보 가져오기
		String mb_id = request.getParameter("mb_id");
		
		//비밀번호 정보를 저장할 객체 생성
		MemberVO mvo = new MemberVO();
		mvo.setMemPw(pwd);
		mvo.setMemId(mb_id);
		
		// 비밀번호 찾기 결과 값 저장
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.pwChange(mb_id, pwd);
		
		if( result == 1) {
			out.println("<script>alert('비밀번호를 변경하였습니다.'); location.href='Ot4zoServlet?command=index';</script>");
		} else {
			out.println("<script>alert('세션이 종료되었습니다\n다시 시도해주십시오'); "
					+ "location.href='Ot4zoServlet?command=index';</script>");
		}
	}
}
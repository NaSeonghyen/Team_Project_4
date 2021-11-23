package com.mypage.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.MemberDAO;
//20211105 신정민 회원정보 삭제 동작 구현
public class MemberDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		// 클라이언트에게 응답할 페이지 정보 셋팅
		response.setContentType("text/html; charset=utf-8");
      
		// 자바스크립트 사용을 위한 out 객체 생성
		PrintWriter out = response.getWriter();
      
		// 회원탈퇴에서 입력된 값 가져오기
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		MemberDAO dao = MemberDAO.getInstance();
      
        // 회원탈퇴 결과 값 저장
        int result = dao.deleteMember(mb_id, mb_pw);
      
        // 회원탈퇴 성공한 경우
        if (result == 1) {
        	request.setAttribute("mb_id", mb_id);
            out.println("<script>alert('회원탈퇴 완료되었습니다.');location.href='Ot4zoServlet?command=logout';</script>");            
        // 회원탈퇴 실패한 경우
        } else {
        	out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>");
        }
	}
}
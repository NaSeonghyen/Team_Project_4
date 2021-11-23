package com.mypage.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Action;
import com.ot4zo.dao.MemberDAO;
import com.ot4zo.vo.MemberVO;
//20211105 신정민 회원정보 수정 동작 구현
public class MemberEditAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url ="Ot4zoServlet?command=logout";
		HttpSession session = request.getSession();

		//사용자 입력된 값을  VO 객체에 저장
		MemberVO mvo = new MemberVO();
		mvo.setMemId(request.getParameter("mb_id"));
		mvo.setMemEmail(request.getParameter("mb_email"));
		mvo.setMemPw(request.getParameter("mb_pw"));
		mvo.setMemName(request.getParameter("mb_name"));
		mvo.setMemBirth(request.getParameter("mb_birth_y")+request.getParameter("mb_birth_m")+request.getParameter("mb_birth_d"));
		mvo.setMemphone(request.getParameter("mb_hp"));
		mvo.setMemRecepmail(request.getParameter("all-check3"));
		mvo.setMemRecepsms(request.getParameter("all-check4"));

		session.setAttribute("mb_id", request.getParameter("mb_id"));   
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		// DAO 메소드로부터 update한 DB 데이터 값 가져오기
		int result = memberDAO.updateMember(mvo);

		// 회원수정 성공한 경우
		if (result == 1) { // ID와 Message
			request.setAttribute("message", "회원수정에 성공하였습니다.");
			// 회원수정 실패한 경우
		} else {
			request.setAttribute("message", "회원수정에 실패하였습니다.");
		}
		
		// 메인 화면 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}

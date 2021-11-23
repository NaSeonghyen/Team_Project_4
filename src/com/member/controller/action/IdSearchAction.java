package com.member.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ot4zo.dao.MemberDAO;
//20211011 나성현 아이디찾기 동작 구현
public class IdSearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "views/login/find_id_result.jsp";  
		
		// 아이디 찾기에서 입력된 값 가져오기
		String name = request.getParameter("mb_name");	
		String phone_1 = request.getParameter("mb_hp_01");
		String phone_2 = request.getParameter("mb_hp_02");
		String phone_3 = request.getParameter("mb_hp_03");
		String phone = phone_1 + phone_2 + phone_3;
		MemberDAO dao = MemberDAO.getInstance();
		
		// 아이디 찾기 결과 값 저장
		String userid = dao.findId(name, phone);
		//아이디 찾기 화면 이동 시 결과 값 넘겨주기
		request.setAttribute("mb_id", userid);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
  }
}
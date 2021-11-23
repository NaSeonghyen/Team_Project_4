package com.notice.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.NoticeDAO;
import com.ot4zo.vo.NoticeVO;
//20211029 위재림 공지사항 게시글 비밀번호 확인 동작 구현
public class NoticeCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		String nId = request.getParameter("nId");
		String npass = request.getParameter("npass");
		
		NoticeDAO ndao = NoticeDAO.getInstance();
		System.out.println(nId);
		System.out.println("pass"+npass);
		NoticeVO bvo = ndao.selectOneBoardByNum(nId);
	
		if (bvo.getnPass().equals(npass)) { // 성공
			url = "views/board/checkSuccess.jsp";
		} else {// 실패
			url = "views/board/noticeCheckPass.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}
		System.out.println(url);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}

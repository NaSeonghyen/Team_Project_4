package com.board.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.BoardDAO;
import com.ot4zo.vo.BoardVO;
// 20211014 위재림 게시판 수정 삭제 시 비밀번호 확인 동작 구현
public class BoardCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		String bId = request.getParameter("bId");
		String pass = request.getParameter("pass");
		BoardDAO bdao = BoardDAO.getInstance();
		System.out.println(bId);
		BoardVO bvo = bdao.selectOneBoardByNum(bId);
	
		if (bvo.getBpassword().equals(pass)) { // 성공
			url = "views/board/checkSuccess.jsp";
		} else {// 실패
			url = "views/board/boardCheckPass.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		}
		System.out.println(url);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}

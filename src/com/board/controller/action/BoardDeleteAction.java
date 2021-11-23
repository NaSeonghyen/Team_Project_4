package com.board.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.BoardDAO;
//20211015 위재림 1:1 문의 게시글 삭제 구현
public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bId=request.getParameter("bId");
		BoardDAO bdao=BoardDAO.getInstance();
		bdao.delete(bId);
		new BoardListPageAction().execute(request, response);

	}

}

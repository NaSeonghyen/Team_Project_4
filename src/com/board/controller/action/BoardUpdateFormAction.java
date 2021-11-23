package com.board.controller.action;

import com.member.controller.action.Action;
import com.ot4zo.dao.BoardDAO;
import com.ot4zo.vo.BoardVO;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//20211014 위재림 1:1 문의 게시글 수정 화면 이동 동작 구현
public class BoardUpdateFormAction implements Action {
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String url = "views/board/qna_update.jsp";
    String bId = request.getParameter("bId");
    BoardDAO bDao = BoardDAO.getInstance();
    BoardVO bVo = bDao.selectOneBoardByNum(bId);
    request.setAttribute("board", bVo);
    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
    dispatcher.forward((ServletRequest)request, (ServletResponse)response);
  }
}

package com.board.controller.action;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.member.controller.action.Action;
import com.oreilly.servlet.MultipartRequest;
import com.ot4zo.dao.BoardDAO;
import com.ot4zo.vo.BoardVO; 
//20211014 위재림 1:1 문의 게시글 수정 동작 구현
public class BoardUpdateAction implements Action {
	private MultipartRequest multi;
	public BoardUpdateAction(MultipartRequest multi) {	
		this.multi = multi;
	}
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId =Integer.parseInt(multi.getParameter("bId"));
		String MID = multi.getParameter("MID");
		String bPass = multi.getParameter("bPassword");
		String bSubTitle = multi.getParameter("bSubTitle");
		String bTitle = multi.getParameter("bTitle");
		String bContent = multi.getParameter("bContent");
		String Pictureurl =multi.getFilesystemName("Pictureurl");
		
		System.out.println("abc:"+Pictureurl);  
		System.out.println("abc:"+MID);
		  
		BoardVO bVo = new BoardVO();
		
		bVo.setbId(bId);
		bVo.setMID(MID);
		bVo.setBpassword(bPass);
		bVo.setbSubTitle(bSubTitle);
		bVo.setbTitle(bTitle);
		bVo.setbContent(bContent);
		bVo.setPictureurl(Pictureurl);
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.updateBoard(bVo);
		(new BoardListPageAction()).execute(request, response);
  }
}

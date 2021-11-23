package com.board.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.member.controller.action.Action;
import com.oreilly.servlet.MultipartRequest;
import com.ot4zo.dao.BoardDAO;
import com.ot4zo.vo.BoardVO;
//20211014 위재림 1:1 문의 등록 동작 구현
public class BoardWriteAction implements Action {

	private MultipartRequest multi;
	
	public BoardWriteAction(MultipartRequest multi) {	
		this.multi = multi;
	}
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String MID = multi.getParameter("MID");
		String bPass = multi.getParameter("bPassword");
		String bSubTitle = multi.getParameter("bSubTitle");
		String bTitle = multi.getParameter("bTitle");
		String bContent = multi.getParameter("bContent");
		String Pictureurl =multi.getFilesystemName("Pictureurl");
		
		System.out.println("abc:"+Pictureurl);
		
		BoardVO bvo = new BoardVO();
		
		bvo.setMID(MID);
		bvo.setBpassword(bPass);
		bvo.setbSubTitle(bSubTitle);
		bvo.setbTitle(bTitle);
		bvo.setbContent(bContent);
		bvo.setPictureurl(Pictureurl);


		BoardDAO bdao = BoardDAO.getInstance();
		bdao.write(MID, bPass, bSubTitle, bTitle, bContent, Pictureurl);
		
		new BoardListPageAction().execute(request, response);

	}

}

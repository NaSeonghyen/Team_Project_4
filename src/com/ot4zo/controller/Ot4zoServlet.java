package com.ot4zo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//20211011 나성현 command 값을 받아 모든 controller action 수행할 서블릿 생성
//20211012 위재림 업로드 기능 생성
@WebServlet("/Ot4zoServlet")
public class Ot4zoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 요청시 보낸 파라미터 command 값을 얻어온다.  
		String command = request.getParameter("command");
		MultipartRequest multi = null;
		
		// command 값이 null인 경우 업로드 관련 명령 실행
		if(command == null) {
			String uploadfolder = request.getServletContext().getRealPath("resources/upload");
	
			System.out.println("경로 : " + uploadfolder +"");
			
			int sizeLimit = 10 * 1024 * 1024;
			String encType = "utf-8";
			
			multi = new MultipartRequest(request,uploadfolder, sizeLimit, encType, new DefaultFileRenamePolicy());	
			command = multi.getParameter("command");
		}
		System.out.println("Ot4zoServlet에서 요청을 받음을 확인 : " + command);
		
	    ActionFactory af = ActionFactory.getInstance();
	    Action action = af.getAction(command,multi);
	
	    if (action != null) {
	      action.execute(request, response);
	    }
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// post 방식으로 요청시 한글 깨짐을 방지하기 위한 코드 추가
		request.setCharacterEncoding("UTF-8");
		// doGet()에서만 요청에 대한 처리
		doGet(request, response);
	}
}

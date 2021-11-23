package com.mypage.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.CartDAO;
//20211101 나성현 장바구니 삭제 동작 구현
public class CartDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "Ot4zoServlet?command=cart_list";
    
	    String[] cseqArr = request.getParameterValues("cseq");
	    
	    for(String cseq:cseqArr){
	      System.out.println(cseq);
	      CartDAO cartDAO = CartDAO.getInstance();
	      cartDAO.deleteCart(Integer.parseInt(cseq));
	    }
	    request.getRequestDispatcher(url).forward(request, response);
	}
}

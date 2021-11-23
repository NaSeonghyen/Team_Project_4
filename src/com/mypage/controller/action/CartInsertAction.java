package com.mypage.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Action;
import com.ot4zo.dao.CartDAO;
import com.ot4zo.vo.CartVO;
import com.ot4zo.vo.MemberVO;
//20211103 나성현 장바구니 삽입 동작 구현
public class CartInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "Ot4zoServlet?command=cart_list";
		// 로그인 세션 생성
	    HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    // 로그인이 안된 경우 로그인 화면으로 이동
	    if (loginUser == null) {
	    	url = "Ot4zoServlet?command=login_form";
	    // 로그인이 된 경우 데이터를 가지고 장바구니 화면으로 이동
	    } else {
	    	CartVO cartVO = new CartVO();
	    	cartVO.setId(loginUser.getMemId());
			cartVO.setPseq(Integer.parseInt(request.getParameter("pseq")));
			cartVO.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			cartVO.setSize(request.getParameter("size"));
	      
			CartDAO cartDAO = CartDAO.getInstance();
			cartDAO.insertCart(cartVO);
	    }
	    response.sendRedirect(url);
	}
}

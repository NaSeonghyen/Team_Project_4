package com.mypage.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Action;
import com.ot4zo.dao.CartDAO;
import com.ot4zo.vo.CartVO;
import com.ot4zo.vo.MemberVO;
//20211103 나성현 장바구니 내역 동작 구현
public class CartListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "views/myinfo/Myinfo_Cart.jsp";
		
		// 로그인 세션 생성
	    HttpSession session = request.getSession();
	    MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    // 로그인이 안된 경우 로그인 화면으로 이동
	    if (loginUser == null) {
    		url = "Ot4zoServlet?command=login_form";
	    // 로그인이 된 경우 장바구니 리스트 불러옴
	    } else {
	        CartDAO cartDAO = CartDAO.getInstance();
	        ArrayList<CartVO> cartList = cartDAO.listCart(loginUser.getMemId());
	        // 총 합계
	        int totalPrice = 0;
	        for (CartVO cartVO : cartList) {
	        	totalPrice += cartVO.getProduct_price() * cartVO.getQuantity();
	        }
	
		    request.setAttribute("cartList", cartList);
		    request.setAttribute("totalPrice", totalPrice);
	    }
	    request.getRequestDispatcher(url).forward(request, response);
	}
}

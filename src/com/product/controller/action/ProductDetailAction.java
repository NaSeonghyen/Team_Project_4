package com.product.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.controller.action.Action;
import com.ot4zo.dao.ProductDAO;
import com.ot4zo.vo.ProductVO;
//20211102 나성현 상품 상세 내역 동작 구현
public class ProductDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    String url="views/product/product_detail_list.jsp";
    // 상품 리스트에서 가져온 상품 고유번호 저장
    String pseq= request.getParameter("pseq").trim();
    // 수량 가져오기
    int quantity = Integer.parseInt(request.getParameter("quantity").trim());
    // 로그인 정보 가져오기
    HttpSession session = request.getSession();
    // 상품 고유번호를 통해 해당 데이터 가져오기
    ProductDAO productDAO=ProductDAO.getInstance();
    ProductVO productVO= productDAO.getProduct(pseq);

	session.getAttribute("loginUser");
    request.setAttribute("productVO", productVO);
    request.setAttribute("quantity", quantity);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
    dispatcher.forward(request, response);
  }
}

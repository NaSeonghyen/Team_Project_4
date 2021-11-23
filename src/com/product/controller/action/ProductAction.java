package com.product.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.controller.action.Action;
import com.ot4zo.dao.ProductDAO;
import com.ot4zo.vo.ProductVO;
//20211102 나성현 상품 리스트 동작 구현
public class ProductAction implements Action {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "views/product/product_list.jsp";
		
		// 상품 종류값  가져오기
		String kind = request.getParameter("product_kind");
		
		// 상품 정렬값 가져오기
		String sortNum = request.getParameter("sort");
		
		// 정렬된 상품리스트 가져오기
		ProductDAO productDAO = ProductDAO.getInstance();
	    ArrayList<ProductVO> newProductList =productDAO.listKindProduct(kind,sortNum);
	    
	    // 상품 개수 가져오기
	 	int kind_cnt = productDAO.listKindCount(kind);
	 	
	    request.setAttribute("newProductList", newProductList);
	    request.setAttribute("kind", kind);
	    request.setAttribute("kind_cnt", kind_cnt);
	    request.setAttribute("sortNum", sortNum);
	    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	    dispatcher.forward(request, response);
	  }
}

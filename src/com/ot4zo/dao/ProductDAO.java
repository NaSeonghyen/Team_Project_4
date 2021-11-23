package com.ot4zo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ot4zo.vo.ProductVO;

import util.DBManager;
//20211020 나성현 상품 DAO 생성
public class ProductDAO {
	private ProductDAO() {
	}

	private static ProductDAO instance = new ProductDAO();

	public static ProductDAO getInstance() {
		return instance;
	}
  
	// 메인화면 신상품 리스트 얻어오기
	public ArrayList<ProductVO> listNewProduct() {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from (select * from product where product_kind='NEW' order by product_indate desc) where rownum <= 3";
    
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
    
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setPseq(rs.getInt("pseq"));
				product.setProduct_name(rs.getString("product_name"));
				product.setProduct_price(rs.getInt("product_price"));
				product.setProduct_url(rs.getString("product_url"));
				product.setProduct_image(rs.getString("product_image"));
				productList.add(product);
			}
		} catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      DBManager.close(conn, pstmt, rs);
	    }
	    return productList;
	}

	// 메인 화면 베스트 상품 리스트 가져오기
	public ArrayList<ProductVO> listBestProduct() {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from (select * from product where product_kind='BEST' order by product_indate desc) where rownum <= 3";

	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	    	conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	    	    ProductVO product = new ProductVO();
	    	    product.setPseq(rs.getInt("pseq"));
		        product.setProduct_name(rs.getString("product_name"));
		        product.setProduct_price(rs.getInt("product_price"));
		        product.setProduct_url(rs.getString("product_url"));
		        product.setProduct_image(rs.getString("product_image"));
		        productList.add(product);
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, pstmt, rs);
	    }
    	return productList;
	} 
	
	// 상품 고유번호 값으로 해당 상품 테이블 데이터 가져오기
	public ProductVO getProduct(String pseq) {
		ProductVO product = null;
	    String sql = "select * from product where pseq=?";
	    
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;    
	    
	    try {
	    	con = DBManager.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, pseq);
	        rs = pstmt.executeQuery();
	        if (rs.next()) { 
		        product = new ProductVO();
		        product.setPseq(rs.getInt("pseq"));
		        product.setProduct_name(rs.getString("product_name"));
		        product.setProduct_kind(rs.getString("product_kind"));
		        product.setProduct_cost(rs.getInt("product_cost"));
		        product.setProduct_price(rs.getInt("product_price"));
		        product.setProduct_revenue(rs.getInt("product_revenue"));
		        product.setProduct_content(rs.getString("product_content"));
		        product.setProduct_image(rs.getString("product_image"));
		        product.setProduct_url(rs.getString("product_url"));
		        product.setProduct_detail_image(rs.getString("product_detail_image"));
		        product.setProduct_detail_url(rs.getString("product_detail_url"));
		        product.setProduct_useyn(rs.getString("product_useyn"));
		        product.setProduct_indate(rs.getString("product_indate"));
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(con, pstmt, rs);
	    }
	    return product;
	}
	  
	// 상품 종류 및 정렬에 따른 상품 리스트 가져오기
	public ArrayList<ProductVO> listKindProduct(String kind, String sortNum) {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
	    String sql;
	    if(sortNum.equals("1")) {
	    	sql= "select * from product where product_kind=?";
	    } else if(sortNum.equals("2")) {
	    	sql= "select * from product where product_kind=? order by product_name";
	    } else if(sortNum.equals("3")) {
	    	sql= "select * from product where product_kind=? order by product_indate desc";
	    } else if(sortNum.equals("4")) {
	    	sql= "select * from product where product_kind=? order by product_price desc";
	    } else {
	    	sql= "select * from product where product_kind=? order by product_price";
	    }
	    System.out.println(sql);
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	    	conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, kind);
	        rs = pstmt.executeQuery();
	      
	        while (rs.next()) {
		        ProductVO product = new ProductVO();
		        product.setPseq(rs.getInt("pseq"));
		        product.setProduct_name(rs.getString("product_name"));
		        product.setProduct_price(rs.getInt("product_price"));
		        product.setProduct_url(rs.getString("product_url"));
		        product.setProduct_image(rs.getString("product_image"));
				product.setProduct_kind(rs.getString("product_kind"));
		        productList.add(product);
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, pstmt, rs);
	    }
	    return productList;
	}
	  
	// 상품별 개수 구하기
	public int listKindCount(String kind) {
		int kindCnt = 0;
	    String sql= "select count(*) as kind_cnt from product where product_kind=?";
	    
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	    	conn = DBManager.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, kind);
	        rs = pstmt.executeQuery();
	      
	        while (rs.next()) {
	        	kindCnt = Integer.parseInt(rs.getString("kind_cnt"));
	        }
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, pstmt, rs);
	    }
	    return kindCnt;
	}
}

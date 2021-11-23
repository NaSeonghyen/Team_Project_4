package com.ot4zo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ot4zo.vo.BoardVO;
//20211018 위재림 게시판 DAO 생성
public class BoardDAO {
	DataSource dataSource;
	  
	private static BoardDAO instance = new BoardDAO();
	  
	public static BoardDAO getInstance() {
		return instance;
	}
	  
	public BoardDAO() {
		try {
			Context context = new InitialContext();
			this.dataSource = (DataSource)context.lookup("java:comp/env/jdbc/myoracle");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
		  
	// 게시글 리스트 가져오기
	public ArrayList<BoardVO> list() {
		ArrayList<BoardVO> dvos = new ArrayList<>();
		String query = "select bId, MID,bSubTitle, bTitle, bContent,Pictureurl, bDate, bHit, bGroup, bStep, bIndent from qnaboard order by bGroup desc, bStep asc";
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = this.dataSource.getConnection();
		    st = conn.createStatement();
		    rs = st.executeQuery(query);
		    System.out.println(query);
		    while (rs.next()) 
		    	dvos.add(new BoardVO(
		    			rs.getInt("bId"), 
		    			rs.getString("MID"), 
			            rs.getString("bPass"), 
			            rs.getString("bSubTitle"), 
			            rs.getString("bTitle"), 
			            rs.getString("bContent"),
			            rs.getString("Pictureurl"),
			            rs.getTimestamp("bDate"), 
			            rs.getInt("bHit"), 
			            rs.getInt("bGroup"), 
			            rs.getInt("bStep"),
			            rs.getInt("bIndent"))); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close(); 
				if (st != null)
					st.close(); 
				if (conn != null)
					conn.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			} 
		} 
		return dvos;
	}
	// 게시글 등록  
	public void write(String MID, String bPass, String bSubTitle, String bTitle, String bContent, String Pictureurl) {
		Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
		    String query = "insert into qnaboard (bid,MID,bPass,bsubtitle,btitle,bcontent,Pictureurl,bhit,bgroup,bstep,bindent) values (qnaboard_seq.nextval, ?, ?, ?, ?, ?, ?, 0, qnaboard_seq.currval, 0, 0 )";
		    ps = conn.prepareStatement(query);
		    ps.setString(1, MID);
		    ps.setString(2, bPass);
		    ps.setString(3, bSubTitle);
	        ps.setString(4, bTitle);
	        ps.setString(5, bContent);
	        ps.setString(6, Pictureurl);
	      
	        ps.executeUpdate();
	        System.out.println(query);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (ps != null)
	    			ps.close(); 
	    		if (conn != null)
	    			conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	}
	// 게시글 vo 가져오기  
	public BoardVO select(String strID) {
		upHit(strID);
	    BoardVO dto = null;
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        String query = "select * from qnaboard where bId = ?order by bGroup desc, bStep asc";
	        ps = conn.prepareStatement(query);
	        ps.setLong(1, Long.parseLong(strID));
	        rs = ps.executeQuery();
	        System.out.println();
	        while (rs.next())
	        	dto = new BoardVO(
	        			rs.getInt("bId"), 
	        			rs.getString("MID"), 
			            rs.getString("bPass"), 
			            rs.getString("bSubTitle"), 
			            rs.getString("bTitle"), 
			            rs.getString("bContent"),
			            rs.getString("Pictureurl"), 
			            rs.getTimestamp("bDate"), 
			            rs.getInt("bHit"), 
			            rs.getInt("bGroup"), 
			            rs.getInt("bStep"), 
			            rs.getInt("bIndent")); 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null)
	    			rs.close(); 
		        if (ps != null)
		          ps.close(); 
		        if (conn != null)
		          conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} finally {
	    		try {
	    			if (rs != null)
	    				rs.close(); 
			        if (ps != null)
			        	ps.close(); 
			        if (conn != null)
			            conn.close(); 
	    		} catch (Exception e3) {
	    			e3.printStackTrace();
	    		} 
	    	} 
	    } 
	return dto;
	}
	// 게시글 vo 한개 선택하기  
	public BoardVO selectOneBoardByNum(String num) {
	    String sql = "select * from qnaboard where bId = ?";
	    BoardVO bVo = null;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, num);
	        rs = pstmt.executeQuery();
	        System.out.println(num);
	        if (rs.next()) {
	        	bVo = new BoardVO();
		        bVo.setbId(rs.getInt("bId"));
		        bVo.setMID(rs.getString("MID"));
		        bVo.setBpassword(rs.getString("bPass"));
		        bVo.setbSubTitle(rs.getString("bSubTitle"));
		        bVo.setbTitle(rs.getString("bTitle"));
		        bVo.setbContent(rs.getString("bContent"));
		        bVo.setPictureurl(rs.getString("Pictureurl"));
		        bVo.setbDate(rs.getTimestamp("bDate"));
		        bVo.setbHit(rs.getInt("bHit"));
		        bVo.setbGroup(rs.getInt("bGroup"));
		        bVo.setbStep(rs.getInt("bStep"));
		        bVo.setbIndent(rs.getInt("bIndent"));
	        } 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } 
	    return bVo;
	}
	//게시글 수정
	public void updateBoard(BoardVO bVo) {
		String query = "update qnaboard set MID=?, bpass=?,bTitle=?, bSubTitle=?, bContent=?,Pictureurl=? where bId = ?";
	    Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        ps = conn.prepareStatement(query);
	        ps.setString(1, bVo.getMID());
	        ps.setString(2, bVo.getBpassword());
	        ps.setString(3, bVo.getbTitle());
	        ps.setString(4, bVo.getbSubTitle());
	        ps.setString(5, bVo.getbContent());
	        ps.setString(6, bVo.getPictureurl());
	        ps.setInt(7, bVo.getbId());
	        ps.executeUpdate();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (ps != null)
	    			ps.close(); 
		        if (conn != null)
		            conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	}
	//게시글 삭제
	public void delete(String bId) {
		Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        String query = "delete from qnaboard where bId = ?";
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, Integer.parseInt(bId));
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	        	if (ps != null)
	        		ps.close(); 
	        	if (conn != null)
	        		conn.close(); 
	        } catch (Exception e2) {
	        	e2.printStackTrace();
	        } 
	    } 
	}
	//게시글  조회
	public BoardVO reply_view(String str) {
		BoardVO dto = null;
	    Connection conn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        String query = "select * from qnaboard where bId = ?";
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, Integer.parseInt(str));
	        rs = ps.executeQuery();
	        if (rs.next())
	        	dto = new BoardVO(
		            rs.getInt("bId"), 
		            rs.getString("MID"), 
		            rs.getString("bPass"), 
		            rs.getString("bSubTitle"), 
		            rs.getString("bTitle"), 
		            rs.getString("bContent"),
		            rs.getString("Pictureurl"), 
		            rs.getTimestamp("bDate"), 
		            rs.getInt("bHit"), 
		            rs.getInt("bGroup"), 
		            rs.getInt("bStep"), 
		            rs.getInt("bIndent")); 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (rs != null)
		          rs.close(); 
		        if (ps != null)
		          ps.close(); 
		        if (conn != null)
		          conn.close(); 
	    	} catch (Exception e3) {
	    		e3.printStackTrace();
	    	} 
	    } 
	    return dto;
	}
	//게시글 조회  
	public void reply(String bId, String MID, String bTitle, String bContent, String Pictureurl, String bGroup, String bStep, String bIndent) {
		replyShape(bGroup, bStep);
	    Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
	    	String query = "insert into qnaboard (bId,MID, bTitle, bContent,Pictureurl, bGroup, bStep, bIndent) values (qnaboard_seq.nextval, ?, ?, ?, ?, ?, ?)";
	        ps = conn.prepareStatement(query);
	        ps.setString(1, MID);
	        ps.setString(2, bTitle);
	        ps.setString(3, bContent);
	        ps.setString(3, Pictureurl);
	        ps.setInt(4, Integer.parseInt(bGroup));
	        ps.setInt(5, Integer.parseInt(bStep) + 1);
	        ps.setInt(6, Integer.parseInt(bIndent) + 1);
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	    	try {
		        if (ps != null)
		          ps.close(); 
		        if (conn != null)
		          conn.close(); 
	    	} catch (Exception e3) {
	    		e3.printStackTrace();
	    	} 
	    } 
	}
	// 게시글 조회 모양  
	private void replyShape(String strGroup, String strStep) {
		Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	    	conn = this.dataSource.getConnection();
	        String query = "update qnaboard set bStep = bStep + 1 where bGroup = ? and bStep > ?";
	        ps = conn.prepareStatement(query);
	        ps.setInt(1, Integer.parseInt(strGroup));
	        ps.setInt(2, Integer.parseInt(strStep));
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	    	try {
		        if (ps != null)
		          ps.close(); 
		        if (conn != null)
		          conn.close(); 
	    	} catch (Exception e3) {
	    		e3.printStackTrace();
	    	} 
	    } 
	}
	  
	private void upHit(String strID) {
	    Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	      conn = this.dataSource.getConnection();
	      String query = "update qnaboard set bHit= bHit + 1 where bId = ?";
	      ps = conn.prepareStatement(query);
	      ps.setString(1, strID);
	      int i = ps.executeUpdate();
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      try {
	        if (ps != null)
	          ps.close(); 
	        if (conn != null)
	          conn.close(); 
	      } catch (Exception e2) {
	        e2.printStackTrace();
	      } 
	    } 
	  }
	  
	  public ArrayList<BoardVO> select(String page, String pageDataCount) {
	    ArrayList<BoardVO> dtos = new ArrayList<>();
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	      conn = this.dataSource.getConnection();
	      String query = String.format("select * from (select rownum m,bId,bPass,MID,bSubTitle,bTitle,bContent,Pictureurl,bDate,bHit,bGroup,bStep,bIndent from qnaboard where rownum <= %s*%s order by bDate desc, bgroup desc, bstep asc) where m>=(%s-1)*%s+1", new Object[] { page, pageDataCount, page, pageDataCount });
	      System.out.println(query);
	      stmt = conn.createStatement();
	      rs = stmt.executeQuery(query);
	      while (rs.next()) {
	        int bId = rs.getInt("bId");
	        String MID = rs.getString("MID");
	        String bTitle = rs.getString("bTitle");
	        String bPass = rs.getString("bPass");
	        String bSubTitle = rs.getString("bSubTitle");
	        String bContent = rs.getString("bContent");
	        String Pictureurl = rs.getString("Pictureurl");
	        Timestamp bDate = rs.getTimestamp("bDate");
	        int bHit = rs.getInt("bHit");
	        int bGroup = rs.getInt("bGroup");
	        int bStep = rs.getInt("bStep");
	        int bIndent = rs.getInt("bIndent");
	        BoardVO dto = new BoardVO(bId, MID, bPass, bSubTitle, bTitle, bContent,Pictureurl, bDate, bHit, bGroup, bStep, bIndent);
	        dtos.add(dto);
	      } 
	    } catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      try {
	        if (rs != null)
	          rs.close(); 
	        if (stmt != null)
	          stmt.close(); 
	        if (conn != null)
	          conn.close(); 
	      } catch (Exception e2) {
	        e2.printStackTrace();
	      } 
	    } 
	    return dtos;
	  }
	  //데이터 카운트
	  public int dataCount() {
		  int returnValue = 0;
		  Connection conn = null;
		  Statement stmt = null;
		  ResultSet rs = null;
		  String query = String.format("select count(bId) bCount from qnaboard");
		  System.out.println(query);
		  try {
			  conn = this.dataSource.getConnection();
		      stmt = conn.createStatement();
		      rs = stmt.executeQuery(query);
		      while (rs.next())
		    	  returnValue = rs.getInt("bCount"); 
		  } catch (Exception e) {
			  e.printStackTrace();
		  } finally {
			  try {
				  if (rs != null)
					  rs.close(); 
			      if (stmt != null)
			    	  stmt.close(); 
			      if (conn != null)
			          conn.close(); 
			  } catch (Exception e2) {
				  e2.printStackTrace();
		      } 
		  } 
		  return returnValue;
	}
	//게시글 검색
	public ArrayList<BoardVO> searchSelect(String page, String pageDataCount, String field, String keyword) {
		ArrayList<BoardVO> dtos = new ArrayList<>();
		Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	    	conn = this.dataSource.getConnection();
	    	String query = String.format("select * from (select rownum m,bId,bPass,MID,bSubTitle,bTitle,bContent,Pictureurl,bDate,bHit,bGroup,bStep,bIndent "
	    			+ "from qnaboard "
	    			+ "where rownum <= %s*%s and %s like '%%%s%%' "
					+ "order by bDate desc, bgroup desc, bstep asc) "
					+ "where m>=(%s-1)*%s+1", page, pageDataCount,field,keyword, page, pageDataCount);		
	    	System.out.println(query);
	    	stmt = conn.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next()) {
	        	int bId = rs.getInt("bId");
		        String MID = rs.getString("MID");
		        String bTitle = rs.getString("bTitle");
		        String bPass = rs.getString("bPass");
		        String bSubTitle = rs.getString("bSubTitle");
		        String bContent = rs.getString("bContent");
		        String Pictureurl = rs.getString("Pictureurl");
		        Timestamp bDate = rs.getTimestamp("bDate");
		        int bHit = rs.getInt("bHit");
		        int bGroup = rs.getInt("bGroup");
		        int bStep = rs.getInt("bStep");
		        int bIndent = rs.getInt("bIndent");
		        BoardVO dto = new BoardVO(bId, MID, bPass, bSubTitle, bTitle, bContent, Pictureurl, bDate, bHit, bGroup, bStep, bIndent);
		        dtos.add(dto);
	        } 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (rs != null)
		          rs.close(); 
		        if (stmt != null)
		          stmt.close(); 
		        if (conn != null)
		          conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	    return dtos;
	}
	//데이터 카운트
	public int dataCount(String field_, String keyword_) {
		int returnValue = 0;
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    String query = String.format("select count(bId) bCount from qnaboard "
	    		+"where %s like '%%%s%%' ",field_,keyword_);
	    System.out.println(query);
	    try {
	    	conn = this.dataSource.getConnection();
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery(query);
	        while (rs.next())
	        	returnValue = rs.getInt("bCount"); 
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
		        if (rs != null)
		          rs.close(); 
		        if (stmt != null)
		          stmt.close(); 
		        if (conn != null)
		          conn.close(); 
	    	} catch (Exception e2) {
	    		e2.printStackTrace();
	    	} 
	    } 
	    return returnValue;
	}
}

	

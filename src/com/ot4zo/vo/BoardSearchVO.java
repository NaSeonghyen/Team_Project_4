package com.ot4zo.vo;
//20211012 위재림 게시판 검색 VO 생성
public class BoardSearchVO extends BoardPageVO{
	private String searchVal;
	private String searchCol;
	
	public void makePage(int page, int pageDataCount, int totalDataCount,String field,String keyword) {
		makePage(page, pageDataCount,totalDataCount);
		this.searchCol=field;
		this.searchVal=keyword;
	}
	@Override
	public String toString() {
		return super.toString()+"\nBoardSearchDvo [searchVal=" + searchVal + ", searchCol=" + searchCol + "]";
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	public String getSearchCol() {
		return searchCol;
	}
	public void setSearchCol(String searchCol) {
		this.searchCol = searchCol;
	}
}

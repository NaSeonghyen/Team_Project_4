package com.ot4zo.vo;

import java.sql.Timestamp;

//20211015 위재림 공지사항 VO 생성
public class NoticeVO {
	  private int nId;
	  private String nAdminID;
	  private String nPass;
	  private String nTitle;  
	  private String nContent;  
	  private String nPictureurl;
	  private Timestamp nDate;  
	  private int nHit;
	  private int nIndent;
	  
	  public NoticeVO() {
		}

	public NoticeVO(int nId, String nAdminID, String nPass, String nTitle, String nContent, String nPictureurl,
			Timestamp nDate, int nHit, int nIndent) {
		super();
		this.nId = nId;
		this.nAdminID = nAdminID;
		this.nPass = nPass;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nPictureurl = nPictureurl;
		this.nDate = nDate;
		this.nHit = nHit;
		this.nIndent = nIndent;
	}

	@Override
	public String toString() {
		return "NoticeVO [nId=" + nId + ", nAdminID=" + nAdminID + ", nPass=" + nPass + ", nTitle=" + nTitle
				+ ", nContent=" + nContent + ", nPictureurl=" + nPictureurl + ", nDate=" + nDate + ", nHit=" + nHit
				+ ", nIndent=" + nIndent + "]";
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public String getnAdminID() {
		return nAdminID;
	}

	public void setnAdminID(String nAdminID) {
		this.nAdminID = nAdminID;
	}

	public String getnPass() {
		return nPass;
	}

	public void setnPass(String nPass) {
		this.nPass = nPass;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnPictureurl() {
		return nPictureurl;
	}

	public void setnPictureurl(String nPictureurl) {
		this.nPictureurl = nPictureurl;
	}

	public Timestamp getnDate() {
		return nDate;
	}

	public void setnDate(Timestamp nDate) {
		this.nDate = nDate;
	}

	public int getnHit() {
		return nHit;
	}

	public void setnHit(int nHit) {
		this.nHit = nHit;
	}

	public int getnIndent() {
		return nIndent;
	}

	public void setnIndent(int nIndent) {
		this.nIndent = nIndent;
	}
}

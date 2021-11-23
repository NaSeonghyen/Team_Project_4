package com.ot4zo.vo;

import java.sql.Timestamp;
//20211012 위재림 게시판  VO 생성
public class BoardVO {
	  private int bId;
	  private String MID;
	  private String Bpassword;  
	  private String bSubTitle;  
	  private String bTitle;  
	  private String bContent;  
	  private String Pictureurl;
	  private Timestamp bDate;  
	  private int bHit;  
	  private int bGroup;  
	  private int bStep;  
	  private int bIndent;
	  
	public BoardVO() {} 
	  public BoardVO(int bId, String MID, String Bpassword, String bSubTitle,
			  String bTitle, String bContent, String Pictureurl, Timestamp bDate, int bHit, int bGroup, int bStep, int bIndent) {
	    this.bId = bId;
	    this.MID = MID;
	    this.Bpassword = Bpassword;
	    this.bSubTitle = bSubTitle;
	    this.bTitle = bTitle;
	    this.bContent = bContent;
	    this.Pictureurl = Pictureurl;
	    this.bDate = bDate;
	    this.bHit = bHit;
	    this.bGroup = bGroup;
	    this.bStep = bStep;
	    this.bIndent = bIndent;
	  }
	  
	  public int getbId() {
	    return this.bId;
	  }
	  
	  public void setbId(int bId) {
	    this.bId = bId;
	  }
	  
	  public String getMID() {
	    return this.MID;
	  }
	  
	  public void setMID(String MID) {
	    this.MID = MID;
	  }
	  
	  public String getBpassword() {
	    return this.Bpassword;
	  }
	  
	  public void setBpassword(String Bpassword) {
	    this.Bpassword = Bpassword;
	  }
	  
	  public String getbSubTitle() {
	    return this.bSubTitle;
	  }
	  
	  public void setbSubTitle(String bSubTitle) {
	    this.bSubTitle = bSubTitle;
	  }
	  
	  public String getbTitle() {
	    return this.bTitle;
	  }
	  
	  public void setbTitle(String bTitle) {
	    this.bTitle = bTitle;
	  }
	  
	  public String getbContent() {
	    return this.bContent;
	  }
	  
	  public void setbContent(String bContent) {
	    this.bContent = bContent;
	  }
	  
	  public Timestamp getbDate() {
	    return this.bDate;
	  }
	  
	  public void setbDate(Timestamp bDate) {
	    this.bDate = bDate;
	  }
	  
	  public int getbHit() {
	    return this.bHit;
	  }
	  
	  public void setbHit(int bHit) {
	    this.bHit = bHit;
	  }
	  
	  public int getbGroup() {
	    return this.bGroup;
	  }
	  
	  public void setbGroup(int bGroup) {
	    this.bGroup = bGroup;
	  }
	  
	  public int getbStep() {
	    return this.bStep;
	  }
	  
	  public void setbStep(int bStep) {
	    this.bStep = bStep;
	  }
	  
	  public int getbIndent() {
	    return this.bIndent;
	  }
	  
	  public void setbIndent(int bIndent) {
	    this.bIndent = bIndent;
	  }
	  public String getPictureurl() {
		  return Pictureurl;
	  }
	  public void setPictureurl(String Pictureurl) {
		  this.Pictureurl = Pictureurl;
	  }
	  
	  public String toString() {
	    return "BDvo [bId=" + this.bId + ", MID=" + this.MID + ", Bpassword=" + this.Bpassword + ", bSubTitle=" + this.bSubTitle + 
	      ", bTitle=" + this.bTitle + ", bContent=" + this.bContent + "Pictureurl " + this.Pictureurl +", bDate=" + this.bDate + ", bHit=" + this.bHit + ", bGroup=" + 
	      this.bGroup + ", bStep=" + this.bStep + ", bIndent=" + this.bIndent +  "]";
	  }
	}

package com.ot4zo.vo;

import java.sql.Timestamp;
//20211101 위재림 주문 VO 생성
public class OrderVO {
	
	private int odseq;
	private int oseq;
	private String id;
	private Timestamp indate;
	private String mname;
	private String address1;
	private String address2;
	private String phone;
	private int pseq;
	private String pname;
	private int quantity;
	private String size;
	private int product_price;
	private String result;
	private String product_image;
	private String product_url;
	
	
	public OrderVO(int odseq, int oseq, String id, Timestamp indate, String mname, String address1, String address2,
			String phone, int pseq, String pname, int quantity, String size, int product_price, String result,
			String product_image, String product_url) {
		super();
		this.odseq = odseq;
		this.oseq = oseq;
		this.id = id;
		this.indate = indate;
		this.mname = mname;
		this.address1 = address1;
		this.address2 = address2;
		this.phone = phone;
		this.pseq = pseq;
		this.pname = pname;
		this.quantity = quantity;
		this.size = size;
		this.product_price = product_price;
		this.result = result;
		this.product_image = product_image;
		this.product_url = product_url;
	}
	public OrderVO() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "OrderVO [odseq=" + odseq + ", oseq=" + oseq + ", id=" + id + ", indate=" + indate + ", mname=" + mname
				+ ", address1=" + address1 + ", address2=" + address2 + ", phone=" + phone + ", pseq=" + pseq
				+ ", pname=" + pname + ", quantity=" + quantity + ", size=" + size + ", product_price=" + product_price
				+ ", result=" + result + ", product_image=" + product_image + ", product_url=" + product_url + "]";
	}
	public int getOdseq() {
		return odseq;
	}
	public void setOdseq(int odseq) {
		this.odseq = odseq;
	}
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_url() {
		return product_url;
	}
	public void setProduct_url(String product_url) {
		this.product_url = product_url;
	}
	
	
}
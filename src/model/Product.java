package model;

import java.util.Date;

public class Product {
	
	/*srno number(10) primary key,
	  cat varchar(20) not null,
	  description varchar(50),
	  mfd date not null,
	  ed date not null,
	  price number(10),
	  qty number(10),
	  sphone number(14),*/
	private int srno;
	private String cat;
	private String desc;
	private String qtypp;
	private String mfd;
	private String ed;
	private int price;
	private int qty;
	private long phone;
	private int discountprice;
	
	public Product()
	{
		
	}

	public Product(int srno, String cat, String desc,String qtypp, String mfd, String ed, int price, int qty, long phone) {
		super();
		this.srno = srno;
		this.cat = cat;
		this.desc = desc;
		this.qtypp=qtypp;
		this.mfd = mfd;
		this.ed = ed;
		this.price = price;
		this.qty = qty;
		this.phone = phone;
	}
	
	public Product(int srno,String cat,String desc,String qtypp, String mfd,String ed,int price,int qty, int discountprice)
	{
		this.srno = srno;
		this.cat = cat;
		this.desc = desc;
		this.qtypp=qtypp;
		this.mfd = mfd;
		this.ed = ed;
		this.price = price;
		this.qty = qty;
		this.discountprice=discountprice;
	}
	
	public int getSrno() {
		return srno;
	}

	public void setSrno(int srno) {
		this.srno = srno;
	}

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getMfd() {
		return mfd;
	}

	public void setMfd(String mfd) {
		this.mfd = mfd;
	}

	public String getEd() {
		return ed;
	}

	public void setEd(String ed) {
		this.ed = ed;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getQtypp() {
		return qtypp;
	}

	public void setQtypp(String qtypp) {
		this.qtypp = qtypp;
	}

	public int getDiscountprice() {
		return discountprice;
	}

	public void setDiscountprice(int discountprice) {
		this.discountprice = discountprice;
	}
	
	

}

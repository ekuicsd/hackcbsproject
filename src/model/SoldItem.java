package model;

import java.util.Date;

public class SoldItem {
	private long sphone;
	private long bphone;
	private int iqty;
	private Date bdate;
	private int disprice;
	private String name;
	
	public SoldItem()
	{
		
	}

	public SoldItem(long sphone, long bphone, int iqty, Date bdate, int disprice, String name) {
		super();
		this.sphone = sphone;
		this.bphone = bphone;
		this.iqty = iqty;
		this.bdate = bdate;
		this.disprice = disprice;
		this.name=name;
	}

	public long getSphone() {
		return sphone;
	}

	public void setSphone(long sphone) {
		this.sphone = sphone;
	}

	public long getBphone() {
		return bphone;
	}

	public void setBphone(long bphone) {
		this.bphone = bphone;
	}

	public int getIqty() {
		return iqty;
	}

	public void setIqty(int iqty) {
		this.iqty = iqty;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public int getDisprice() {
		return disprice;
	}

	public void setDisprice(int disprice) {
		this.disprice = disprice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}

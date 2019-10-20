package service;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;

import model.Product;
import model.SoldItem;
import oracle.jdbc.pool.OracleDataSource;

public class DBHandler {
	
	public Connection getcon()
	{
		Connection con=null;
		OracleDataSource ods;
		try {
			ods = new OracleDataSource();
			ods.setURL("jdbc:oracle:thin:@localhost:1521:xe");
			con=ods.getConnection("wastefood","icsd");
			System.out.println("connect successfully");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public boolean getValidSeller( String unm, String pwd)
	{
		boolean res=false;
		long phone=Long.parseLong(unm);
		System.out.println(phone);
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select * from seller where phone=? and pwd=?");
			stmt.setLong(1,phone);
			stmt.setString(2,pwd);
			ResultSet rset=stmt.executeQuery();
			if(rset.next())
			{
				res=true;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int insertSeller(String phone, String name, String email, String pwd,String city,String add)
	{
		int res=0;
		Connection con=getcon();
		long phn=Long.parseLong(phone);
		try {
			PreparedStatement stmt=con.prepareStatement("insert into seller values(?,?,?,?,?,?,?)");
			stmt.setLong(1, phn);
			stmt.setString(2, name);
			stmt.setString(3,pwd);
			stmt.setString(4, email);
			stmt.setString(5,city);
			stmt.setString(6, add);
			stmt.setString(7, null);
			res=stmt.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	
	public LinkedList<Product> getSearchByItem(String search)
	{
		
		LinkedList<Product> lst=new LinkedList<>();
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select * from product where cat=?");
			stmt.setString(1, search);
			ResultSet rset=stmt.executeQuery();
				while(rset.next())
				{
					/*srno number(10) primary key,
					  cat varchar(20) not null,
					  description varchar(50),
					  mfd date not null,
					  ed date not null,
					  price number(10),
					  qty number(10),
					  sphone number(14),*/
					  
					String cat, desc, qtypp;
					int srno, price,qty;
					String mfd, ed;
					long phone;
					cat=rset.getString("cat");
					desc= rset.getString("description");
					qtypp=rset.getString("qtypp");
					srno=rset.getInt("srno");
					price=rset.getInt("price");
					qty=rset.getInt("qty");
					phone=rset.getLong("sphone");
					mfd=rset.getString("mfd");
					ed=rset.getString("ed");
					Product p= new Product(srno, cat, desc,qtypp, mfd, ed, price, qty, phone);
					lst.add(p);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;		
	}
	
	public int getMaxProdId()
	{
		int id=0;
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select max(srno) as id from product");
			ResultSet rset=stmt.executeQuery();
			if(rset.next())
			{
				id=rset.getInt("id");
				if(id==0)
				{
					id=100;
				}
			}
			System.out.println(id);
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return id+1;
	}
	
	public void insertStock(int srno,String cat,String name,String qtypp,String mfd,String ed,int intprice,int intqty,String username)
	{
		Connection con=getcon();
		long phone=Long.parseLong(username);
		try {
			PreparedStatement stmt=con.prepareStatement("insert into product values(?,?,?,?,?,?,?,?,?,?)");
			stmt.setInt(1,srno);
			stmt.setString(2,cat);
			stmt.setString(3,name);
			stmt.setString(4, qtypp);
			stmt.setString(5,mfd);
			stmt.setString(6,ed);
			stmt.setInt(7,intprice);
			stmt.setInt(8, intqty);
			stmt.setLong(9, phone);
			stmt.setString(10,null);
			stmt.executeUpdate();
			con.close();
			System.out.println("inserted product");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public LinkedList<Product> getProductLstByCat(String loc, String cat)
	{
		LinkedList<Product> lst=new LinkedList<>();
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select * from product, seller where cat=? and city=? and qty!=? and product.sphone=seller.phone");
			stmt.setString(1,cat);
			stmt.setString(2, loc);
			stmt.setInt(3, 0);
			ResultSet rset=stmt.executeQuery();
			while(rset.next())
			{
				String  desc, qtypp;
				int srno, price,qty;
				String mfd, ed;
				long phone;
				cat=rset.getString("cat");
				desc= rset.getString("description");
				qtypp=rset.getString("qtypp");
				srno=rset.getInt("srno");
				price=rset.getInt("price");
				qty=rset.getInt("qty");
				phone=rset.getLong("sphone");
				mfd=rset.getString("mfd");
				ed=rset.getString("ed");
				Product p= new Product(srno, cat, desc,qtypp, mfd, ed, price, qty, phone);
				lst.add(p);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lst;
	}
	
	
	public Product getDisplayProduct(String srno, String dis)
	{
		Product p=null;
		int intsrno=Integer.parseInt(srno);
		int intdis=Integer.parseInt(dis);
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select * from product where srno=?");
			stmt.setInt(1,intsrno);
			ResultSet rset=stmt.executeQuery();
			if(rset.next())
			{
				String  desc, qtypp, cat;
				int  price,qty;
				String mfd, ed;
				long phone;
				cat=rset.getString("cat");
				desc= rset.getString("description");
				qtypp=rset.getString("qtypp");
				price=rset.getInt("price");
				qty=rset.getInt("qty");
				phone=rset.getLong("sphone");
				mfd=rset.getString("mfd");
				ed=rset.getString("ed");
				p= new Product(intsrno, cat, desc,qtypp, mfd, ed, price, qty, intdis);
				
			}
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
	
	public int getMaxIdFromAddToCart()
	{
		int id=0;
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select max(ids) as id from addtocart");
			ResultSet rset=stmt.executeQuery();
			if(rset.next())
			{
				id=rset.getInt("id");
			}
			System.out.println(id);
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return id+1;
	}
	
	
	public void insertIntoAddToCart(String srno,String discountprice,String buyerunm)
	{
		Connection con=getcon();
		int intsrno=Integer.parseInt(srno);
		int dis=Integer.parseInt(discountprice);
		int bunm= Integer.parseInt(buyerunm);
		int id=getMaxIdFromAddToCart();
		try {
			/*ids number(20) primary key,
			  srno number(10),
			  bunm number(12),
			  dis number(10)*/
			PreparedStatement stmt=con.prepareStatement("insert into addtocart values(?,?,?,?)");
			stmt.setInt(1,id);
			stmt.setInt(2, intsrno);
			stmt.setInt(3, bunm);
			stmt.setInt(4, dis);
			stmt.executeUpdate();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean getValidBuyer(String unm,String pwd)
	{
		boolean res=false;
		long phone=Long.parseLong(unm);
		System.out.println(phone);
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select * from buyer where phone=? and pwd=?");
			stmt.setLong(1,phone);
			stmt.setString(2,pwd);
			ResultSet rset=stmt.executeQuery();
			if(rset.next())
			{
				res=true;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int insertBuyer(String phone, String name, String email, String pwd,String city)
	{
		int res=0;
		Connection con=getcon();
		long phn=Long.parseLong(phone);
		try {
			PreparedStatement stmt=con.prepareStatement("insert into buyer values(?,?,?,?,?,?)");
			/*phone number(14) primary key,
			  bname varchar(20) not null,
			  pwd varchar(20) not null,
			  email varchar(30),
			  city varchar(20),
			  remarks varchar(50)*/
			stmt.setLong(1, phn);
			stmt.setString(2, name);
			stmt.setString(3,pwd);
			stmt.setString(4, email);
			stmt.setString(5,city);
			stmt.setString(6, null);
			res=stmt.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public LinkedList<Product> getSellerDashboard(String username)
	{
		LinkedList<Product> lst=new LinkedList<Product>();
		Product p=null;
		long phone=Integer.parseInt(username);
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select * from (select * from product where qty!=? and sphone=?) order by ed desc");
			stmt.setInt(1, 0);
			stmt.setLong(2, phone);
			ResultSet rset=stmt.executeQuery();
			while(rset.next())
			{
				String  cat, desc, qtypp;
				int srno, price,qty;
				String mfd, ed;
				cat=rset.getString("cat");
				desc= rset.getString("description");
				qtypp=rset.getString("qtypp");
				srno=rset.getInt("srno");
				price=rset.getInt("price");
				qty=rset.getInt("qty");
				mfd=rset.getString("mfd");
				ed=rset.getString("ed");
				p= new Product(srno, cat, desc,qtypp, mfd, ed, price, qty, phone); 
				lst.add(p);
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
	

	public LinkedList<SoldItem> getSellerHistory(String unm)
	{
		long phone=Integer.parseInt(unm);
		LinkedList<SoldItem> lst= new LinkedList<SoldItem>();
		Connection con=getcon();
		try {
			PreparedStatement stmt=con.prepareStatement("select  iqty, buyer,bdate, disprice, description from (select * from product, solditems where sphone=? and product.srno=solditems.srno) order by bdate desc");
			stmt.setLong(1, phone);
			ResultSet rset=stmt.executeQuery();
			while(rset.next())
			{
				int iqty, disprice;
				long buyer;
				String bdate, desc;
				iqty=rset.getInt("iqty");
				buyer=rset.getLong("buyer");
				bdate =rset.getString("bdate");
				Date date1=new Date();
				try {
					date1 = new SimpleDateFormat("MM/dd/yy").parse(bdate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				disprice=rset.getInt("disprice");
				desc=rset.getString("description");
				SoldItem s=new SoldItem(phone, buyer,iqty,date1,disprice,desc);
				lst.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
	
	
	
	
	
	
	
	
}













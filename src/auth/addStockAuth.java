package auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DBHandler;

/**
 * Servlet implementation class addStockAuth
 */
@WebServlet("/addStockAuth")
public class addStockAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addStockAuth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String srno, cat,name, mfd, ed, price, qty, qtypp;
		Date datemfd=null, dateed=null;
		String username=request.getParameter("unm");
		srno=request.getParameter("srno");
		cat=request.getParameter("cat");
		name=request.getParameter("name");
		qtypp=request.getParameter("qtypp");
		mfd=request.getParameter("mfd");
		ed=request.getParameter("ed");
		price=request.getParameter("price");
		qty=request.getParameter("qty");
		int intprice=Integer.parseInt(price);
		int intqty=Integer.parseInt(qty);
		int intsrno=Integer.parseInt(srno);
		try {
			datemfd=new SimpleDateFormat("MM/dd/yyyy").parse(mfd);
			dateed=new SimpleDateFormat("MM/dd/yyyy").parse(ed);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(datemfd);
		int day1 = cal1.get(Calendar.DAY_OF_MONTH); // 17
		int month1 = cal1.get(Calendar.MONTH);
		int year1 = cal1.get(Calendar.YEAR);
		
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(dateed);
		int day2 = cal2.get(Calendar.DAY_OF_MONTH); // 17
		int month2 = cal2.get(Calendar.MONTH);
		int year2 = cal2.get(Calendar.YEAR);
		System.out.println(srno+cat+mfd+ed+price+qty);
		System.out.println(datemfd);
		System.out.println(dateed);
		System.out.println(intprice+" "+intqty);
		System.out.println(day1+" "+day2+" "+month1+" "+month2+" "+year1+" "+year2);
		if(intqty<=0 || (year2-year1)<0 || (month2-month1)<0)
		{
			response.sendRedirect(request.getContextPath()+"/formError.jsp");
		}
		else
		{
			DBHandler obj=new DBHandler();
			//insert into product values(1, 'milk','amul', '15-10-19', '20-10-19',21, 5, 1234567890, null );
			obj.insertStock(intsrno, cat, name, qtypp, mfd, ed, intprice, intqty, username);
			response.sendRedirect(request.getContextPath()+"/sellerWlcmPage.jsp?unm="+username);
			
		}
	}

}

package auth;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product;
import service.DBHandler;

/**
 * Servlet implementation class AddItemAuth
 */
@WebServlet("/AddItemAuth")
public class AddItemAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItemAuth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loc=request.getParameter("loc");
		String cat=request.getParameter("cat");
		String srno=request.getParameter("srno");
		String discountprice=request.getParameter("dis");
		System.out.println(loc+cat+srno+discountprice);
		
		HttpSession session=request.getSession();
		String buyerunm=(String)session.getAttribute("buyerunm");
		System.out.println(buyerunm);
		if(buyerunm.equals("nil"))
		{
			//buyerlogin page;
			response.sendRedirect(request.getContextPath()+"/buyerLogin.jsp?loc="+loc+"&cat="+cat+"&srno="+srno+"&dis="+discountprice);
		}
		else {
			DBHandler obj=new DBHandler();
			obj.insertIntoAddToCart(srno, discountprice, buyerunm);
			response.sendRedirect(request.getContextPath()+"/ProductList.jsp?loc="+loc+"&cat="+cat);
		}
		
		//DBHandler obj=new DBHandler();
		//Product p=obj.getDisplayProduct(srno, discountprice);
		//session.setAttribute("cartlist",p);
		//Product list=(Product)session.getAttribute("cartlist");
		//LinkedList<Product> list=(LinkedList<Product>)session.getAttribute("cartlist");
		//System.out.println(list);
		//response.sendRedirect(request.getContextPath()+"/ProductList.jsp?loc="+loc+"&cat="+cat);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}

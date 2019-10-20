package auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.DBHandler;

/**
 * Servlet implementation class buyerLoginAuth
 */
@WebServlet("/buyerLoginAuth")
public class buyerLoginAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyerLoginAuth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loc= request.getParameter("loc");
		String cat= request.getParameter("cat");
		String srno=request.getParameter("srno");
		String discountprice=request.getParameter("dis");
		String unm=request.getParameter("username");
		String pwd=request.getParameter("password");
		System.out.println(unm+" "+pwd);
		DBHandler obj= new DBHandler();
		boolean res=obj.getValidBuyer(unm, pwd);
		if(res==true)
		{	
			
			obj.insertIntoAddToCart(srno, discountprice, unm);
			HttpSession session=request.getSession();
			session.setAttribute("buyerunm",unm);
			String buyerunm=(String)session.getAttribute("buyerunm");
			System.out.println("after login"+buyerunm);
			response.sendRedirect(request.getContextPath()+"/ProductList.jsp?loc="+loc+"&cat="+cat);
			//response.sendRedirect(request.getContextPath()+"/ProductList.jsp?loc="+loc+"&cat="+cat);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/loginErrorPage.jsp");
		}
				
	}

}

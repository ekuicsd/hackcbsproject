package auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DBHandler;

/**
 * Servlet implementation class buyerSigupAuth
 */
@WebServlet("/buyerSigupAuth")
public class buyerSigupAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public buyerSigupAuth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String phone, name, pwd, email, city;
		phone=request.getParameter("phone");
		name=request.getParameter("name");
		email=request.getParameter("email");
		pwd=request.getParameter("pwd");
		city=request.getParameter("city");
		String loc=request.getParameter("loc");
		String cat=request.getParameter("cat");
		
		System.out.println(phone+name+email+pwd+city);
		
		DBHandler obj= new DBHandler();
		int res=obj.insertBuyer(phone, name, email, pwd, city);
		if(res!=0)
		{
			response.sendRedirect(request.getContextPath()+"/ProductList.jsp?loc="+loc+"&cat="+cat);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/loginErrorPage.jsp");
		}
	}

}

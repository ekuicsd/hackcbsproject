package auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DBHandler;

/**
 * Servlet implementation class sellerSigupAuth
 */
@WebServlet("/sellerSigupAuth")
public class sellerSigupAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sellerSigupAuth() {
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
		String phone, name, pwd, email, city, add;
		phone=request.getParameter("phone");
		name=request.getParameter("name");
		email=request.getParameter("email");
		pwd=request.getParameter("pwd");
		city=request.getParameter("city");
		add=request.getParameter("add");
		
		System.out.println(phone+name+email+pwd+city+add);
		
		DBHandler obj= new DBHandler();
		int res=obj.insertSeller(phone, name, email, pwd, city, add);
		if(res!=0)
		{
			response.sendRedirect(request.getContextPath()+"/sellerWlcmPage.jsp?unm="+phone);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/loginErrorPage.jsp");
		}
		
	}

}

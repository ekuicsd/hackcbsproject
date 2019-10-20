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
 * Servlet implementation class sellerLoginAuth
 */
@WebServlet("/sellerLoginAuth")
public class sellerLoginAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sellerLoginAuth() {
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
		String unm=request.getParameter("username");
		String pwd=request.getParameter("password");
		System.out.println(unm+" "+pwd);
		DBHandler obj= new DBHandler();
		boolean res=obj.getValidSeller(unm, pwd);
		if(res==true)
		{
			HttpSession session=request.getSession();
			session.setAttribute("sellerunm", unm);
			response.sendRedirect(request.getContextPath()+"/sellerWlcmPage.jsp?unm="+unm);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/loginErrorPage.jsp");
		}
				
	}

}

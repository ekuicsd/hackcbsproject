package auth;

import java.io.IOException;
import java.util.LinkedList;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import service.DBHandler;

/**
 * Servlet implementation class searchAuth
 */
@WebServlet("/searchAuth")
public class searchAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchAuth() {
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
	    String search=request.getParameter("search");
	    System.out.println(search);
	    search=search.toLowerCase(Locale.ENGLISH);
	    DBHandler obj= new DBHandler();
	    LinkedList<Product> lst=obj.getSearchByItem(search);
	    System.out.println(lst);
	}

}

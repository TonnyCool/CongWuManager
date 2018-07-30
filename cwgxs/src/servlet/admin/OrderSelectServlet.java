package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SelectBean;

public class OrderSelectServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public OrderSelectServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String sql = "select a.id as userid,b.id as bookid,c.id as orderid,realname,phone,address,b.name as bookname,booksum,price,times from users a,dog b,orders c where a.id=c.userid and b.id=c.bookid and c.id='"+id+"'";
		String[] args = {"userid","bookid","orderid","realname","phone","address","bookname","booksum","price","times"};
		SelectBean sb = new SelectBean();
		ArrayList al = sb.select(sql, args);
		request.setAttribute("order", al);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/order_show.jsp");
		rd.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

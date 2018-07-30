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

import util.Validate;

public class OrderListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public OrderListServlet() {
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
		Validate vd = new Validate();
		String userid = vd.getUnicode(request.getParameter("userid"));
		String bookname = vd.getUnicode(request.getParameter("bookname"));
		String orderda = vd.getUnicode(request.getParameter("orderda"));
		String orderxiao = vd.getUnicode(request.getParameter("orderxiao"));
		String sql = "select a.id as userid,b.id as bookid,c.id as orderid,realname,phone,address,b.name as bookname,booksum,price,times from users a,dog b,orders c where a.id=c.userid and b.id=c.bookid ";
		String[] args = {"userid","bookid","orderid","realname","phone","address","bookname","booksum","price","times"};
		if(userid != null && !userid.equals("")){
			sql += "and a.id='"+userid+"'";
		}
		if(bookname != null && !bookname.equals("")){
			sql += "and b.name like '%"+bookname+"%'";
		}
		if(orderda != null && !orderda.equals("")){
			sql += "and c.booksum>'"+orderda+"'";
		}
		if(orderxiao != null && !orderxiao.equals("")){
			sql += "and c.booksum<'"+orderxiao+"'";
		}
		SelectBean sb = new SelectBean();
		ArrayList al = sb.select(sql, args);
		request.setAttribute("order", al);
		RequestDispatcher rd=request.getRequestDispatcher("/admin/order.jsp");
        rd.forward(request,response);
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

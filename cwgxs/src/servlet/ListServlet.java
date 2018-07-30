package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.SelectBean;

public class ListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ListServlet() {
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
		

		SelectBean ib = new SelectBean();
		
		String sql1 = "select * from types";
		String[] args1 = {"id","name"};
		ArrayList al1 = ib.select(sql1, args1);
		request.setAttribute("type", al1);
		
		String sql2 = "select * from dog";
		String[] args2 = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath"};
		ArrayList al2 = ib.select(sql2, args2);
		request.setAttribute("books", al2);
		
		String sql3 = "select * from paihang order by times desc";
		String[] args3 = {"bookid","name"};
		ArrayList al3 = ib.select(sql3, args3);
		request.setAttribute("xiaosou", al3);
		
		String sql4 = "select * from tates";
		String[] args4 = {"id","name"};
		ArrayList al4 = ib.select(sql4, args4);
		request.setAttribute("tate", al4);
		
		String sql5 = "select * from dog where tate=1";
		String[] args5 = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath"};
		ArrayList al5 = ib.select(sql5, args5);
		request.setAttribute("tuibook", al5);
		
		String sql6 = "select * from dog where tate=2";
		String[] args6 = {"id","name","author","publishing","number","price","storage","brief","type","tate","sums","imgpath"};
		ArrayList al6 = ib.select(sql6, args6);
		request.setAttribute("newbook", al6);
		
		String sql7 = "select * from users";
		String[] args7 = {"id","name","pwd","realname","sex","age","card","address","phone","email","code"};
		ArrayList al7 = ib.select(sql7, args7);
		request.setAttribute("users", al7);
		
		String sql8 = "select * from affiche";
		String[] args8 = {"id","name","content","times"};
		ArrayList al8 = ib.select(sql8, args8);
		request.setAttribute("affiche", al8);
	
		
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

package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Validate;
import bean.SelectBean;

public class AfficheShowServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AfficheShowServlet() {
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
		String show = vd.getUnicode(request.getParameter("show"));
		String rework = vd.getUnicode(request.getParameter("rework"));
		String usershow = vd.getUnicode(request.getParameter("usershow"));
		String str = "";
		SelectBean sb = new SelectBean();
		String sql = "";
		String[] args = {"id","name","content","times"};
		if(show != null && !show.equals("")){
			sql = "select * from affiche where id="+show;
			str = "/admin/affiche_show.jsp";
		}
		if(rework != null && !rework.equals("")){
			sql = "select * from affiche where id="+rework;
			str ="/admin/affiche_rework.jsp";
		}
		if(usershow != null && !usershow.equals("")){
			sql = "select * from affiche where id="+usershow;
			str ="/qiantai/affiche_show.jsp";
		}
		ArrayList al = sb.select(sql, args);
		request.setAttribute("affiches", al);
		RequestDispatcher rd=request.getRequestDispatcher(str);
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

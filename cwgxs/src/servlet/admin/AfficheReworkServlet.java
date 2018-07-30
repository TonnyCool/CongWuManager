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
import bean.InsertUpdateDelBean;
import bean.SelectBean;

public class AfficheReworkServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AfficheReworkServlet() {
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
		String id = vd.getUnicode(request.getParameter("id"));
		String name = vd.getUnicode(request.getParameter("content"));
		if(name != null && !name.equals("")){
			String sql ="update affiche set content='"+name+"' where id='"+id+"'";
			InsertUpdateDelBean ib = new InsertUpdateDelBean();
			ib.insertANDupdateANDdel(sql);
		}
		SelectBean sb = new SelectBean();
		String sql2 = "select * from affiche where id='"+id+"'";
		String[] args2 = {"id","name","content","times"};
		ArrayList al2 = sb.select(sql2, args2);
		request.setAttribute("affiches", al2);

		RequestDispatcher rd=request.getRequestDispatcher("/admin/affiche_rework.jsp");
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

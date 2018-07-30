package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

import util.Validate;

public class DelServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelServlet() {
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
		String bookid = vd.getUnicode(request.getParameter("id"));
		String typeid = vd.getUnicode(request.getParameter("typeid"));
		String userid = vd.getUnicode(request.getParameter("userid"));
		String afficheid = vd.getUnicode(request.getParameter("afficheid"));
		String after = vd.getUnicode(request.getParameter("after"));
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		String sql = "";
		String str = "";
		if(bookid != null && !bookid.equals("")){
			str = "/admin/booklist.jsp";
			sql = "delete from dog where id='"+bookid+"'";
			ib.insertANDupdateANDdel(sql);
		}
		if(typeid != null && !typeid.equals("")){
			str = "/admin/typelist.jsp";
			sql = "delete from types where id='"+typeid+"'";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("error", "1");
			}
		}
		if(userid != null && !userid.equals("")){
			str = "/admin/userlist.jsp";
			sql = "delete from users where id='"+userid+"'";
			ib.insertANDupdateANDdel(sql);
		}
		if(afficheid != null && !afficheid.equals("")){
			str = "/admin/affiche.jsp";
			sql = "delete from affiche where id='"+afficheid+"'";
			ib.insertANDupdateANDdel(sql);
		}
		if(after != null && !after.equals("")){
			str = "/admin/after.jsp";
			sql = "delete from after where id='"+after+"'";
			ib.insertANDupdateANDdel(sql);
		}
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

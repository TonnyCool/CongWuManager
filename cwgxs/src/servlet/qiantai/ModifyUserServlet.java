package servlet.qiantai;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Validate;
import bean.InsertUpdateDelBean;

public class ModifyUserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyUserServlet() {
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
		String flag = vd.getUnicode(request.getParameter("flag"));
		String pwd = vd.getUnicode(request.getParameter("newpass"));
		String address = vd.getUnicode(request.getParameter("address"));
		String phone = vd.getUnicode(request.getParameter("phone"));
		String email = vd.getUnicode(request.getParameter("email"));
		String code = vd.getUnicode(request.getParameter("code"));
		HttpSession session = request.getSession();
		ArrayList login = (ArrayList)session.getAttribute("login");
		String str = "";
		String sql = "";
		
		if(flag != null && flag.equals("text")){
			str = "/qiantai/usertext.jsp";
			sql = "update users set address='"+address+"',phone='"+phone+"',email='"+email+"',code='"+code+"' where id="+login.get(0);
		}
		if(flag != null && flag.equals("pass")){
			str = "/qiantai/userpass.jsp";
			sql = "update users set pwd='"+pwd+"' where id="+login.get(0);
			login.set(2, pwd);
		}
		request.setAttribute("message", "²Ù×÷³É¹¦£¡");
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		ib.insertANDupdateANDdel(sql);
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

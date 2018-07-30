package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.InsertUpdateDelBean;

import smartupload.SmartFile;
import smartupload.SmartUpload;
import smartupload.SmartUploadException;
import util.Validate;

public class AddBookServlet extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public AddBookServlet() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
	{
		this.config = config;
	}

	final public ServletConfig getServletConfig()
	{
		return config;
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
		String name = "";
		String author = "";
		String publishing = "";
		String number = "";
		String price = "";
		String storage = "";
		String brief = "";
		String type = "";
		String tate = "";
		String path = "";
		String str = "";
		
		SmartUpload mySmartUpload = new SmartUpload();//init
		mySmartUpload.initialize(config,request,response);
		try {
			mySmartUpload.upload();
			name = mySmartUpload.getRequest().getParameter("name").trim();
			author = mySmartUpload.getRequest().getParameter("author").trim();
			publishing = mySmartUpload.getRequest().getParameter("publishing").trim();
			number = mySmartUpload.getRequest().getParameter("number").trim();
			price = mySmartUpload.getRequest().getParameter("price").trim();
			storage = mySmartUpload.getRequest().getParameter("storage").trim();
			brief = mySmartUpload.getRequest().getParameter("brief").trim();
			type = mySmartUpload.getRequest().getParameter("type").trim();
			tate = mySmartUpload.getRequest().getParameter("tate").trim();
			
			int count = 0;
			SmartFile file = mySmartUpload.getFiles().getFile(0);
			String fileExt = file.getFileExt();
			path="/bookimg";
			
			InsertUpdateDelBean ib = new InsertUpdateDelBean();
			String sql = "insert into dog([name], [author], [publishing], [number], [price], [storage], [brief], [type], [tate], [imgpath])" +
					" values('"+name+"','"+author+"','"+publishing+"','"+number+"','"+price+"','"+storage+"','"+brief+"','"+type+"','"+tate+"','"+path.substring(1)+"/"+file.getFileName()+"')";
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				str = "/admin/addbook.jsp";
				request.setAttribute("error", "1");
			}else{
				str = "/admin/booklist.jsp";
				request.setAttribute("ok", "1");
			}
			count = mySmartUpload.save(path);
		} catch (SmartUploadException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
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

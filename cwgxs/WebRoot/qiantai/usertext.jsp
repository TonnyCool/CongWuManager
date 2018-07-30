<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="user" scope="page" class="bean.UserBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id = (String)((ArrayList)session.getAttribute("login")).get(0);
ArrayList users = user.getUser(id);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">	
  </head>
  <script language="JavaScript">
		function check11()
			{
				if (document.form1.address.value == ""  )  
				{
					alert("家庭住址不能为空!");
					document.form1.address.focus();
					return false;
				}
				if (document.form1.phone.value == ""  )  
				{
					alert("电话号码不能为空!");
					document.form1.phone.focus();
					return false;
				}
				if (document.form1.email.value == ""  )  
				{
					alert("电子邮箱不能为空!");
					document.form1.email.focus();
					return false;
				}
				if (document.form1.code.value == ""  )  
				{
					alert("邮政编码不能为空!");
					document.form1.code.focus();
					return false;
				}
			}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
  <body>
<jsp:include flush="true" page="top.jsp"/>
  <table width="800" border="0" cellspacing="0" cellpadding="0" align="center" style="border:#CCC 1px solid">
  <tr>
    <td style="border:#CCC 1px solid" align="center">
  <form action="servlet/ModifyUserServlet?flag=text" name="form1" method="post" onSubmit="return check11()">
  <table bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" border="1">
				<tr>
					<td colspan="3" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25"><font color="#666666">用户信息修改</font></td>
				</tr>
<tr>
			  <td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
				  <font color="#996633">家庭住址：</font>			  </td>
			  <td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
				  <input class="input7" type="text" name="address" value="<%=users.get(7) %>"/>			  </td>
			  <td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
				  <font color="red">&nbsp;* </font>请填写您的真实信息			  </td>
			</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">电话号码：</font>					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="phone" value="<%=users.get(8) %>"/>					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>请填写您的真实信息(格式为02411111111或13911111111) </td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">电子邮箱：</font>					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="email" value="<%=users.get(9) %>"/>					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>请填写您有效的邮件地址，以便于我们为您提供有效的服务。					</td>
				</tr>
				<tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">邮政编码：</font>					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="text" name="code" value="<%=users.get(10) %>"/>					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>请填写您的真实信息(格式为111111)</td>
				</tr>
				<tr>
					<td colspan="3" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input type="submit" value="修改">					</td>
				</tr>
</table>
  </form></td>
  </tr>
</table>
  </body>
</html>
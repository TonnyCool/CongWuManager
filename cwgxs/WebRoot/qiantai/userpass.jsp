<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList login = (ArrayList)session.getAttribute("login");
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
				if (document.form1.oldpass.value == ""  )  
				{
					alert("�����벻��Ϊ��!");
					document.form1.oldpass.focus();
					return false;
				}
				if (document.form1.oldpass.value != "<%=login.get(2) %>"  )  
				{
					alert("���������!");
					document.form1.oldpass.focus();
					return false;
				}
				if (document.form1.newpass.value == ""  )  
				{
					alert("�����벻��Ϊ��!");
					document.form1.newpass.focus();
					return false;
				}
				if (document.form1.cnewpass.value == ""  )  
				{
					alert("�ظ������벻��Ϊ��!");
					document.form1.cnewpass.focus();
					return false;
				}
				if (document.form1.cnewpass.value != document.form1.newpass.value  )  
				{
					alert("�������벻һ��!");
					document.form1.cnewpass.focus();
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
  <form action="servlet/ModifyUserServlet?flag=pass" name="form1" method="post" onSubmit="return check11()">
  <table bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" border="1">
				<tr>
					<td colspan="3" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25"><font color="#666666">�û������޸�</font></td>
				</tr>
                <tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">�����룺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="password" name="oldpass"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>���ȱ������5��С��16���ַ���ֻ��ΪӢ���֡�����
					</td>
				</tr>	
                <tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">�����룺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="password" name="newpass"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="red">&nbsp;* </font>���ȱ������5��С��16���ַ���ֻ��ΪӢ���֡�����
					</td>
				</tr>	
                <tr>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<font color="#996633">�ظ������룺</font>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input class="input7" type="password" name="cnewpass"/>
					</td>
					<td bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						
					</td>
				</tr>	
				<tr>
					<td colspan="3" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25">
						<input type="submit" value="�޸�">					</td>
				</tr>
</table>
  </form></td>
  </tr>
</table>
  </body>
</html>
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
<jsp:include flush="true" page="/servlet/SessLoginServlet"/>
<body>
<jsp:include flush="true" page="top.jsp"/>
<form action="servlet/ModifyUserServlet" name="form1" method="post" onSubmit="return check11()">
<table width="800" border="0" cellspacing="0" cellpadding="0" style="border:#CCC 1px solid" align="center">
  <tr>
    <td align="center">
    <table width="50%" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" border="1">
      <tr>
        <td colspan="2" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" height="25"><font color="#666666">�û���Ϣ</font></td>
      </tr>
      <tr>
        <td width="22%" height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">�� �� ����</font></td>
        <td width="78%" height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(1) %></td>
      </tr>
      <tr>
        <td height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">��ʵ������</font></td>
        <td height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(3) %> ��</td>
      </tr>
      <tr>
        <td height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">��&nbsp; &nbsp;&nbsp;��</font></td>
        <td height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(4) %> ��</td>
      </tr>
      <tr>
        <td height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">��&nbsp;&nbsp; &nbsp;�䣺</font></td>
        <td height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(5) %></td>
      </tr>
      <tr>
        <td height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">���֤�ţ�</font></td>
        <td height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(6) %></td>
      </tr>
      <tr>
        <td height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">��ͥסַ��</font></td>
        <td height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(7) %></td>
      </tr>
      <tr>
        <td height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">�绰���룺</font></td>
        <td height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(8) %></td>
      </tr>
      <tr>
        <td height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">�������䣺</font></td>
        <td height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(9) %></td>
      </tr>
      <tr>
        <td height="25" align="center" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0"><font color="#996633">�������룺</font></td>
        <td height="25" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0">&nbsp;&nbsp;<%=users.get(10) %></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link href="img/styleframe.css" type=text/css rel=stylesheet>
</head>
<script language="JavaScript">
function CheckForm()

{

if(document.userlogin.username.value=="")
 {
  alert("�����������û�����");
  document.userlogin.username.focus();
  return false;
  }

if(document.userlogin.userpass.value=="")
 {
  alert("�������������룡");
  document.userlogin.userpass.focus();
  return false;
  }

 
return true;
}
</script>
<%
String error = (String)request.getAttribute("error");
String ok = (String)request.getAttribute("ok");
if(error != null && error.equals("1")){
%>
<script>alert('�û������������!')</script>
<%
}
%>
<body>
<%
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String time = df.format(date);
ArrayList login = (ArrayList)session.getAttribute("login");
if(login == null || login.size() == 0){
%>
<form name=userlogin onSubmit="return CheckForm();" action="servlet/UserLoginServlet" method="post">
<table width=800 border=0 align="center" cellpadding=1 cellspacing=1 style="border: #CCC 1px solid">  
    <tbody>
      <tr>
        <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;�����ǣ�<%=time.substring(0,4) %>��<%=time.substring(5,7) %>��<%=time.substring(8,10) %>��</td>
        <td align=middle>&nbsp;��ӭ�����װ����ο�</td>
        <td>�û���:</td>
        <td><input id=username 
      style="BORDER-RIGHT: #b4b4b4 1px double; BORDER-TOP: #b4b4b4 1px double; BORDER-LEFT: #b4b4b4 1px double; BORDER-BOTTOM: #b4b4b4 1px double" 
      maxlength=20 size=10 name=username></td>
        <td align=right>����:</td>
        <td><input id=userpass 
      style="BORDER-RIGHT: #b4b4b4 1px double; BORDER-TOP: #b4b4b4 1px double; BORDER-LEFT: #b4b4b4 1px double; BORDER-BOTTOM: #b4b4b4 1px double" 
      type=password maxlength=20 size=10 name=userpass></td>
        <td><input class=buttonlog type=submit value="�� ¼" name=submit></td>
        <td><input class=buttonlog type=button onClick="window.open('../qiantai/reg.jsp','RegWindow','toolbar=no,directories=no,menubar=no,width=450,height=300')" value="ע ��" name=submit></td>
      </tr>    
</table>
</form>
<%}else{%>
	<table width="800" border="0" cellspacing="1" cellpadding="1" align="center" style="border: #CCC 1px solid">
  <tr height="25">
    <td align="center">�����ǣ�<%=time.substring(0,4) %>��<%=time.substring(5,7) %>��<%=time.substring(8,10) %>��</td>
    <td><%=login.get(1) %>���ã�</td>
    <td><a href="qiantai/user.jsp">�û�����</a></td>
    <td><a href="qiantai/usertext.jsp">�޸�����</a></td>
    <td><a href="qiantai/userpass.jsp">�޸�����</a></td>
    <td><a href="servlet/RemoveServlet?login=login">�˳���¼</a></td>
  </tr>
</table>

<% }%>
</body>
</html>

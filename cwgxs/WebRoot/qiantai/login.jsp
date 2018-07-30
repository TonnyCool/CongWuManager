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
  alert("请输入您的用户名！");
  document.userlogin.username.focus();
  return false;
  }

if(document.userlogin.userpass.value=="")
 {
  alert("请输入您的密码！");
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
<script>alert('用户名或密码错误!')</script>
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
        <td align="center">&nbsp;&nbsp;&nbsp;&nbsp;今天是：<%=time.substring(0,4) %>年<%=time.substring(5,7) %>月<%=time.substring(8,10) %>日</td>
        <td align=middle>&nbsp;欢迎您，亲爱的游客</td>
        <td>用户名:</td>
        <td><input id=username 
      style="BORDER-RIGHT: #b4b4b4 1px double; BORDER-TOP: #b4b4b4 1px double; BORDER-LEFT: #b4b4b4 1px double; BORDER-BOTTOM: #b4b4b4 1px double" 
      maxlength=20 size=10 name=username></td>
        <td align=right>密码:</td>
        <td><input id=userpass 
      style="BORDER-RIGHT: #b4b4b4 1px double; BORDER-TOP: #b4b4b4 1px double; BORDER-LEFT: #b4b4b4 1px double; BORDER-BOTTOM: #b4b4b4 1px double" 
      type=password maxlength=20 size=10 name=userpass></td>
        <td><input class=buttonlog type=submit value="登 录" name=submit></td>
        <td><input class=buttonlog type=button onClick="window.open('../qiantai/reg.jsp','RegWindow','toolbar=no,directories=no,menubar=no,width=450,height=300')" value="注 册" name=submit></td>
      </tr>    
</table>
</form>
<%}else{%>
	<table width="800" border="0" cellspacing="1" cellpadding="1" align="center" style="border: #CCC 1px solid">
  <tr height="25">
    <td align="center">今天是：<%=time.substring(0,4) %>年<%=time.substring(5,7) %>月<%=time.substring(8,10) %>日</td>
    <td><%=login.get(1) %>您好！</td>
    <td><a href="qiantai/user.jsp">用户中心</a></td>
    <td><a href="qiantai/usertext.jsp">修改资料</a></td>
    <td><a href="qiantai/userpass.jsp">修改密码</a></td>
    <td><a href="servlet/RemoveServlet?login=login">退出登录</a></td>
  </tr>
</table>

<% }%>
</body>
</html>

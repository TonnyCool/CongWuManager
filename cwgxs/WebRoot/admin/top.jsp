<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>系统后台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="img/css.css">
	

  </head>
  
  <body>
	<div align="center">
	<table style="border-style: dotted; border-width: 1px">
	<tr><td><img src="img/bgt.jpg" width="800" height="200"></td></tr>
  <tr>
  <td align="center" valign="top">
  <table width="100%" background="img/tu_bg.gif">
  <tr><td align="center" background="img/tu_bg.gif">
  <table background="img/tu_bg.gif">
  <tr>
  <td><a href="admin/affiche.jsp">公告管理|</a></td>
  <td><a href="admin/booklist.jsp">宠物狗管理|</a></td>
  <td><a href="admin/typelist.jsp">类别管理|</a></td>
  <td><a href="admin/userlist.jsp">会员管理|</a></td>
  <td><a href="admin/kuxiao.jsp">库存销售查询|</a></td>
  <td><a href="admin/order.jsp">订单查询|</a></td>
  <td><a href="admin/after.jsp">售后服务管理|</a></td>
  <td><a href="admin/modifypwd.jsp">用户管理|</a></td>
  <td><a href="servlet/RemoveServlet?admin=1">注销退出|</a></td> 
  </tr>
  </table>
  </td></tr>
  </table>
  </td>
  </tr>
  </table>
  	</div>
  </body>
</html>
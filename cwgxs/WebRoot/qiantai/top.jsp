<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>宠物销售系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="img/css.css" type="text/css" rel="stylesheet"/>
	
  </head>
  
  <body>
  <div align="center">
	<table border="0" width="800" cellspacing="0" cellpadding="0" id="table1" height="29">
		<tr>			
			<td>
			<marquee onMouseOver="this.stop()" onMouseOut="this.start()" scrollamount="2" direction="left" width="100%" height="25" style="border-left: #CCC 1px solid; border-right: #CCC 1px solid; padding-top:6px;">
			<jsp:include flush="true" page="/servlet/ListServlet"/>
			<%
              					ArrayList affiche = (ArrayList)request.getAttribute("affiche");
              					for(int i = 0;i < affiche.size();i++){
              						ArrayList afficheRow = (ArrayList)affiche.get(i);
              					 %>
              					&nbsp;&nbsp;<a href="servlet/AfficheShowServlet?usershow=<%=afficheRow.get(0) %>"><%=afficheRow.get(1) %>&nbsp;&nbsp;&nbsp;&nbsp;</a>
              					<%} %>
			</marquee>
			</td>
		</tr>
		<tr>			
			<td align="center"><jsp:include flush="true" page="login.jsp"/></td>
		</tr>
		<tr>			
			<td align="center"><img src="img/bgt.jpg" width="800" height="200"></td>
		</tr>
		<tr>
			<td background="img/tu_bg.gif" colspan="2" height="29">
			<div align="center">
				<table border="0" width="80%" id="table2" cellpadding="0" height="100%" cellspacing="0">
					<tr>
						<td align="center"><a href="qiantai/index.jsp">[ 首页 ]</a></td>
						<td align="center"><a href="qiantai/affiche.jsp">[ 网站公告 ]</a></td>						
						<td align="center"><a href="qiantai/types.jsp">[ 宠物分类 ]</a></td>
						<td align="center"><a href="qiantai/reg.jsp">[ 用户注册 ]</a></td>
						<td align="center"><a href="qiantai/search.jsp">[ 宠物搜索 ]</a></td>
						<td align="center"><a href="servlet/ShoppingServlet">[ 购物车 ]</a></td>
					</tr>
				</table>
			</div>
			</td>
		</tr>
	</table>
</div>
  </body>
</html>
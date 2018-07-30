<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="img/css.css">
	

  </head>
  <jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <body>
	<div align="center">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="" method="post" name="form1">
	<table border="1" width="42%" bordercolorlight="#C0C0C0">
	<%
	 ArrayList al = (ArrayList)request.getAttribute("bookinf");
 	 ArrayList bookinf = (ArrayList)al.get(0);
 	 ArrayList type = (ArrayList)request.getAttribute("type");
	 %>
		<tr>
			<td height="25"  align="right">宠物狗名称：</td>
			<td height="25" >
			<input name="T1" type="text" value="<%=bookinf.get(1)%>" size="45" readonly="readonly"></td>
		</tr>
		<tr>
			<td height="25"  align="right">产地：</td>
			<td height="25" >
			<input name="T2" type="text" value="<%=bookinf.get(2)%>" size="45" readonly="readonly"></td>
		</tr>
		<tr>
			<td height="25"  align="right">出生日期：</td>
			<td height="25" >
			<input name="T3" type="text" value="<%=bookinf.get(3)%>" size="45" readonly="readonly"></td>
		</tr>
		<tr>
			<td height="25"  align="right">体重：</td>
			<td height="25" >
			<input name="T4" type="text" value="<%=bookinf.get(4)%>" size="45" readonly="readonly">kg</td>
		</tr>
		<tr>
			<td height="25"  align="right">价格：</td>
			<td height="25" >
			<input name="T5" type="text" value="<%=bookinf.get(5)%>元" size="45" readonly="readonly">元</td>
		</tr>
		<tr>
			<td height="25"  align="right">库 存 量：</td>
			<td height="25" >
			<input name="T6" type="text" value="<%=bookinf.get(6)%>" size="45" readonly="readonly">只</td>
		</tr>
		<tr>
			<td height="25"  align="right">说明：</td>
			<td height="25" >
		  <textarea name="S1" cols="43" rows="12" readonly="readonly"><%=bookinf.get(7)%></textarea></td>
		</tr>
		<tr>
			<td height="25"  align="right">类别：</td>
			<td height="25" >
			<%
            for(int i = 0;i < type.size();i++){
            	ArrayList alRow = (ArrayList)type.get(i);
            	if(alRow.get(0).equals(bookinf.get(8))){ 
            %>
             <%=alRow.get(1)%>
              <%break;}} %></td>
		</tr>
		<tr>
			<td height="25"  align="right">已销数量：</td>
			<td height="25" ><%=bookinf.get(10)%></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="cata" scope="page" class="bean.AllBean"/>
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
	
	
  </head>
  
  <body>
  <div align="center">
  <jsp:include flush="true" page="top.jsp"/>
	<table border="0" width="800" cellspacing="0" cellpadding="0" id="table1" style="border-style: solid; border-width: 1px" bordercolor="#C0C0C0">
	<tr><td height="10" colspan="2"></td></tr>
		<tr>
			<td align="center">
			<%
                  ArrayList alType = cata.getType();
                  for(int m = 0;m < alType.size();m++){
                  	ArrayList alRow = (ArrayList)alType.get(m);
			 %>
			<table border="1" width="100%" cellspacing="0" cellpadding="0" height="100%">
				<tr>
					<td width="55" height="34" background="img/th_img2.gif">　</td>
					<td background="img/th_bg.gif"><b><font color="blue">&nbsp;<a href="servlet/SearchServlet?types=<%=alRow.get(0)%>"><%=alRow.get(1) %></a></font></b></td>
				</tr>
				<tr>
					<td>　</td>
					<td>
					<%			
				  ArrayList alNewly = cata.getDogType(alRow.get(0).toString());
                  int tem = 0;
				  int x = 0;
				  if(alNewly.size()%3 == 0){
				  	tem = alNewly.size()/3;
				  }else{
				  	tem = alNewly.size()/3+1;
				  }
				  for(int n = 1;n <= tem;n++){ 
					 %>
					<table cellspacing="0" cellpadding="3" width="590" border="0">
                      <tr>
                        <%
                for(int i = n*3-3;i < alNewly.size();i++){
                      ArrayList alNewlyRow = (ArrayList)alNewly.get(i);
                  %>
                        <td align="middle" width="590">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td rowspan="4" align="center" valign="middle"><a href="servlet/BookinfServlet?id=<%=alNewlyRow.get(0)%>"> <img src="<%=alNewlyRow.get(11)%>" border="0" alt="《<%=alNewlyRow.get(1)%>》" width="65" height="96"/> </a> </td>
                              <td><a href="servlet/BookinfServlet?id=<%=alNewlyRow.get(0)%>">
                                <%if(alNewlyRow.get(1).toString().length()>10){%>
                                《<%=alNewlyRow.get(1).toString().substring(0,7)%>......》
                                <%}else{%>
                                《<%=alNewlyRow.get(1)%>》
                                <%}%>
                                </a> </td>
                            </tr>
                            <tr>
                              <td>&nbsp;会员价：<%=alNewlyRow.get(5)%>元</td>
                            </tr>
                            <tr>
                              <td>&nbsp;VIP 价：<font color="#ff9999">更优惠！</td>
                            </tr>
                            <tr>
                              <td align="center"><a href="servlet/ShoppingServlet?bookId=<%=alNewlyRow.get(0)%>"> <img height="18" src="img/goumai.gif" width="40" border="0" alt=""/> </a> </td>
                            </tr>
                          </table><br></td>
                        <%
                        x++;
			 	if(x == 3){
			 	x = 0;
			 	break;
			 	}
                        }
                        %>
                      </tr>
                    </table>
                    <%} %>
					</td>
				</tr>
			</table>
			<%} %>
			</td>
		</tr>
	</table>
	</div>
	<jsp:include flush="true" page="Copyright.jsp"/>
  </body>
</html>

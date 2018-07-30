<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<jsp:include flush="true" page="/qiantai/top.jsp" />
		<table border="0" width="800" cellspacing="0" cellpadding="0"
			id="table1" style="border-style: solid; border-width: 1px"
			bordercolor="#C0C0C0">
			<jsp:include flush="true" page="/servlet/ListServlet" />
			<tr>
				<td height="10" colspan="2"></td>
			</tr>
			<tr>
				<td><div align="left">
						<img src="img/bg003.jpg" width=450 " height="200" /> 
						&nbsp;&nbsp;&nbsp;
						<img src="img/3.gif" width=260 " height="200" />
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<table border="0" width="100%" cellspacing="0" cellpadding="0"
						height="100%" style="border:#999 1px solid">
						<tr>
							<td width="55" height="34" background="img/th_img2.gif"></td>
							<td background="img/th_bg.gif"><b><font color="blue">&nbsp;最新推荐宠物</font>
							</b></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<%
									ArrayList alNewly = (ArrayList) request.getAttribute("tuibook");
									ArrayList newbook = (ArrayList) request.getAttribute("newbook");
									ArrayList alType = (ArrayList) request.getAttribute("type");
									int tem = 0;
									int x = 0;
									if (alNewly.size() % 3 == 0) {
										tem = alNewly.size() / 3;
									} else {
										tem = alNewly.size() / 3 + 1;
									}
									for (int n = 1; n <= tem; n++) {
								%>
								<table cellspacing="0" cellpadding="3" width="590" border="0">
									<tr>
										<%
											for (int i = n * 3 - 3; i < alNewly.size(); i++) {
													ArrayList alNewlyRow = (ArrayList) alNewly.get(i);
										%>
										<td align="middle" width="590">
											<table border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td colspan="2" align="center" bgcolor="#0075b5"><font
														color="#ff9900"> <%
 	for (int j = 0; j < alType.size(); j++) {
 				ArrayList alTypeRow = (ArrayList) alType.get(j);
 				if (alTypeRow.get(0).equals(alNewlyRow.get(8))) {
 %> <a href="servlet/SearchServlet?types=<%=alTypeRow.get(0)%>"><%=alTypeRow.get(1)%></a>
															<%
																break;
																			}
																		}
															%> </font>
													</td>
												</tr>
												<tr>
													<td colspan="2" height="2">&nbsp;</td>
												</tr>
												<tr>
													<td rowspan="4" align="center" valign="middle"><a
														href="servlet/BookinfServlet?id=<%=alNewlyRow.get(0)%>">
															<img src="<%=alNewlyRow.get(11)%>" border="0"
															alt="《<%=alNewlyRow.get(1)%>》" width="65" height="96" />
													</a>
													</td>
													<td><a
														href="servlet/BookinfServlet?id=<%=alNewlyRow.get(0)%>">
															<%
																if (alNewlyRow.get(1).toString().length() > 10) {
															%> 《<%=alNewlyRow.get(1).toString().substring(0, 7)%>......》
															<%
																} else {
															%> 《<%=alNewlyRow.get(1)%>》 <%
																}
															%> </a>
													</td>
												</tr>
												<tr>
													<td>&nbsp;会员价：<%=alNewlyRow.get(5)%>元</td>
												</tr>
												<tr>
													<td>&nbsp;VIP 价：<font color="#ff9999">更优惠！ 
													</td>
												</tr>
												<tr>
													<td align="center"><a
														href="servlet/ShoppingServlet?bookId=<%=alNewlyRow.get(0)%>">
															<img height="18" src="img/goumai.gif" width="40"
															border="0" alt="" /> </a>
													</td>
												</tr>
											</table> <br></td>
										<%
											x++;
													if (x == 3) {
														x = 0;
														break;
													}
												}
										%>
									</tr>
								</table> <%
 	}
 %>
							</td>
						</tr>
						<tr>
							<td width="55" height="34" background="img/th_img.gif"></td>
							<td background="img/th_bg.gif">&nbsp;<b><font
									color="blue">最新上架宠物</font> </b></td>
						</tr>
						<tr>
							<td></td>
							<td>
								<%
									for (int n = 1; n <= tem; n++) {
								%>
								<table cellspacing="0" cellpadding="3" width="590" border="0">
									<tr>
										<%
											x = 0;
												for (int i = n * 3 - 3; i < newbook.size(); i++) {
													ArrayList alNewlyRow = (ArrayList) newbook.get(i);
										%>
										<td align="middle" width="590">
											<table border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td colspan="2" align="center" bgcolor="#DFBCB7"><font
														color="#66cc00"> <%
 	for (int j = 0; j < alType.size(); j++) {
 				ArrayList alTypeRow = (ArrayList) alType.get(j);
 				if (alTypeRow.get(0).equals(alNewlyRow.get(8))) {
 %> <a href="servlet/SearchServlet?types=<%=alTypeRow.get(0)%>"><%=alTypeRow.get(1)%></a>
															<%
																break;
																			}
																		}
															%> </font>
													</td>
												</tr>
												<tr>
													<td colspan="2" height="2">&nbsp;</td>
												</tr>
												<tr>
													<td rowspan="4" align="center" valign="middle"><a
														href="servlet/BookinfServlet?id=<%=alNewlyRow.get(0)%>">
															<img src="<%=alNewlyRow.get(11)%>" border="0"
															alt="《<%=alNewlyRow.get(1)%>》" width="65" height="96" />
													</a>
													</td>
													<td><a
														href="servlet/BookinfServlet?id=<%=alNewlyRow.get(0)%>">
															<%
																if (alNewlyRow.get(1).toString().length() > 10) {
															%> 《<%=alNewlyRow.get(1).toString().substring(0, 7)%>......》
															<%
																} else {
															%> 《<%=alNewlyRow.get(1)%>》 <%
																}
															%> </a>
													</td>
												</tr>
												<tr>
													<td>&nbsp;会员价：<%=alNewlyRow.get(5)%>元</td>
												</tr>
												<tr>
													<td>&nbsp;VIP 价：<font color="#ff9999">更优惠！ 
													</td>
												</tr>
												<tr>
													<td align="center"><a
														href="servlet/ShoppingServlet?bookId=<%=alNewlyRow.get(0)%>">
															<img height="18" src="img/goumai.gif" border="0" alt=""
															width="40" /> </a>
													</td>
												</tr>
											</table> <br></td>
										<%
											x++;
													if (x == 3) {
														x = 0;
														break;
													}
												}
										%>
									</tr>
								</table> <%
 	}
 %>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
				<tr>
				<td><div align="center">
						<img src="img/4.jpg" width=800 " height="150" /> 
					</div>
				</td>
			</tr>

	<jsp:include flush="true" page="Copyright.jsp" />

</body>
</html>

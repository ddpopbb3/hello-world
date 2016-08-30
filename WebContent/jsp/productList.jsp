<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="cn.tedu.mvc.web.pojo.Product,cn.tedu.mvc.web.pojo.Users,javax.servlet.http.HttpServletRequest,java.util.List" language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>达内电子商务门户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="description" content="达内电子商务门户">
<link href="<%=request.getContextPath() %>/css/tarena.css" rel=stylesheet>
<%Users user=(Users)session.getAttribute("user");%>
	<%List list = (List)request.getAttribute("list");%>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
	<!-- Header Start -->

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		id="table2">
		<tr>
			<td align="left" width="7%" background="<%=request.getContextPath() %>/images/top_bg.gif"><img
				src="<%=request.getContextPath() %>/images/logo.gif" width="286" height="58"></td>
			<td width="62%" background="<%=request.getContextPath() %>/images/top_bg.gif"></td>
			<td width="31%" background="<%=request.getContextPath() %>/images/top_bg.gif" align="right"><img
				src="<%=request.getContextPath() %>/images/top_r.gif" width="352" height="58" border="0"></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td background="<%=request.getContextPath() %>/images/dh_bg.gif" align="left" height="12">
				<table width="100" border="0" cellspacing="0" cellpadding="0"
					align="center">
					<tr>
						<td width="5%"></td>

						<td width="10%"><a href="productList.do"><img
								name="Image1" border="0" src="<%=request.getContextPath() %>/images/index.gif" width="90"
								height="36"></a></td>

						<td width="10%"><a href="userList.do"><img
								name="Image2" border="0" src="<%=request.getContextPath() %>/images/reg.gif" width="92"
								height="36"></a></td>

						<td width="10%"><a href="<%=request.getContextPath()%>/jsp/shoppingCart.jsp"><img
								name="Image4" border="0" src="<%=request.getContextPath() %>/images/cart.gif" width="92"
								height="36"></a></td>

						<td width="10%"><a href="<%=request.getContextPath()%>/orderlist.do"><img
								name="Image5" border="0" src="<%=request.getContextPath() %>/images/order.gif" width="92"
								height="36"></a></td>

						<td width="10%"><a href="dologin.do"><img
								name="Image6" border="0" src="<%=request.getContextPath() %>/images/exit.gif" width="92"
								height="36"></a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table cellspacing="1" cellpadding="3" align="center" border="0"
		width="98%">
		<tr>
			<td width="65%"><br> >> 欢迎访问 <b>达内电子商务门户</b></td>
			<td width="35%" align="right"></td>
		</tr>
	</table>
	<!-- Header End -->
	<!-- Body Start -->
	<table cellspacing="1" cellpadding="3" align="center"
		class="tableBorder2">
		<tr>
			<td height="25" valign="middle"><img
				src="<%=request.getContextPath() %>/images/Forum_nav.gif" align="absmiddle"> <a
				href=<%=request.getContextPath() %>/index.jsp>达内电子商务门户</a> →<img border="0"
				src="<%=request.getContextPath() %>/images/dog.gif" width="19" height="18">欢迎<font
				color="red"><%if(user!=null){%>
					<%=user.getUserid() %>
					<%}else{
					}
					%></font>光临！</td>
				
		</tr>
	</table>
	<br>
	<table cellpadding="3" cellspacing="1" align="center"
		class="tableborder1">
		<tr>
			<td valign="middle" align="center" height="25"
				background="<%=request.getContextPath() %>/images/bg2.gif" width="8%"><font
				color="#ffffff"> <b>序号</b>
			</font></td>
			<td valign="middle" align="center" height="25"
				background="<%=request.getContextPath() %>/images/bg2.gif" width="60%"><font
				color="#ffffff"> <b>产品名称</b>
			</font></td>
			<td valign="middle" align="center" height="25"
				background="<%=request.getContextPath() %>/images/bg2.gif" width="8%"><font
				color="#ffffff"> <b>价格</b>
			</font></td>
			<td valign="middle" align="center" height="25"
				background="<%=request.getContextPath() %>/images/bg2.gif" width="24%"><font
				color="#ffffff"> <b>操作</b>
			</font></td>
		</tr>

		<tr>
		<% for(int i = 0;i < list.size();i++){
				Product product = (Product)list.get(i);
				%>
			<td class=tablebody2 valign="middle" align="center" width="8%"><a><%=product.getProductid()%></a>
				</td>

			<td class=tablebody1 valign="middle" width="60%">&nbsp;&nbsp;<a
				href="<%=request.getContextPath() %>/jsp/productDetail.jsp?id=<%=product.getProductid()%>"><%=product.getName()%></a>
			
			</td>
			<td class=tablebody2 valign="middle" align="center" width="8%">
				<%=product.getBasePrice()%></td>

			<td class=tablebody1 valign="middle" align="center" width="24%">

				<a href="goods.do?pid=<%=product.getProductid()%>&baseprice=<%=product.getBasePrice()%>&name=<%=product.getName()%>">
				<img border="0"
					src="<%=request.getContextPath() %>/images/car_new.gif" width="97" height="18"></a>
			</td>
		</tr>
		<%}%>
		
	</table>
	<!-- Body End -->
	<!-- Footer Start -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		align="center" height="28">
		<tr>
			<td height="17" background="<%=request.getContextPath() %>/images/bot_bg.gif"></td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td bgcolor="#f1f1f6" height="53" valign="center">
				<p align="center">
					Copyright &copy;2004 - 2005 <a href="http://www.tarena.com.cn"><b>Tarena</b><font
						color="red">.com.cn</font></a>
				</p>
			</td>
		</tr>
	</table>
	<!-- Footer End -->
	<%session.setAttribute("list",list);%> 
</body>
</html>
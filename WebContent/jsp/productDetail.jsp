<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="cn.tedu.mvc.web.pojo.Product,javax.servlet.http.HttpServletRequest,java.util.List" language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%List list = (List)session.getAttribute("list");%>
<%Product product = (Product)list.get(Integer.parseInt(request.getParameter("id"))-1);%>
	<head>
		<title>达内电子商务门户</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="description" content="达内电子商务门户">
		<link href="<%=request.getContextPath() %>/css/tarena.css" rel=stylesheet>
	</head>
	<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<!-- Header Start -->
		<table width="100%" border="0" cellspacing="0" cellpadding="0" id="table2">
			<tr>
				<td align="left" width="7%" background="<%=request.getContextPath() %>/images/top_bg.gif"><img src="<%=request.getContextPath() %>/images/logo.gif" width="286" height="58"></td>
				<td width="62%" background="<%=request.getContextPath() %>/images/top_bg.gif">　</td>
				<td width="31%" background="<%=request.getContextPath() %>/images/top_bg.gif" align="right"><img src="<%=request.getContextPath() %>/images/top_r.gif" width="352" height="58" border="0"></td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td background="<%=request.getContextPath() %>/images/dh_bg.gif" align="left" height="12">
					<table width="100" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td width="5%"></td>
							
          <td width="10%"><a href="productList.do"><img name="Image1" border="0" src="<%=request.getContextPath() %>/images/index.gif" width="90" height="36"></a></td>
							
          <td width="10%"><a href="userList.do"><img name="Image2" border="0" src="<%=request.getContextPath() %>/images/reg.gif" width="92" height="36"></a></td>
							
          <td width="10%"><a href="<%=request.getContextPath()%>/jsp/shoppingCart.jsp"><img name="Image4" border="0" src="<%=request.getContextPath() %>/images/cart.gif" width="92" height="36"></a></td>
							
          <td width="10%"><a href="<%=request.getContextPath()%>/orderlist.do"><img name="Image5" border="0" src="<%=request.getContextPath() %>/images/order.gif" width="92" height="36"></a></td>
							
          <td width="10%"><a href="dologin.do"><img name="Image6" border="0" src="<%=request.getContextPath() %>/images/exit.gif" width="92" height="36"></a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table cellspacing="1" cellpadding="3" align="center" border="0" width="98%">
			<tr>
				<td width="65%"><br>
					>> 欢迎访问 <b>达内电子商务门户</b>
				</td>
				<td width="35%" align="right">
				</td>
			</tr>
		</table>
<!-- Header End -->


<!-- Body Start -->

	<table cellspacing="1" cellpadding="3" align="center" class="tableBorder2">

			<tr>
				<td height="25" valign="middle">
					<img src="<%=request.getContextPath() %>/images/Forum_nav.gif" align="absmiddle">
					<a href=<%=request.getContextPath() %>/index.jsp>达内电子商务门户</a> → 产品明细
				</td>
			</tr>
		</table>

		<br>
			
		<table cellpadding="3" cellspacing="1" align="center" class="tableborder1">
			<tr>
				<td  colspan="2" valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="100%">
					<font color="#ffffff">
						<b><%=product.getName() %></b>
					</font>
				</td>
			</tr>
			<tr>
				<td class=tablebody1 valign="middle" width="25%" align="center">
				[ 作 &nbsp者 ]
				</td>
				
				<td class=tablebody1 valign="middle" width="75%">
				<%=product.getAuthor() %>
				</td>
			</tr>
			<tr>
				<td class=tablebody1 valign="middle" width="25%" align="center">
				[ 价 &nbsp格 ]
				</td>
				
				<td class=tablebody1 valign="middle" width="75%">
				<%=product.getBasePrice() %>
				</td>
			</tr>
			<tr>
				<td class=tablebody1 valign="middle" width="25%" align="center">
				[出 版 社]
				</td>
				
				<td class=tablebody1 valign="middle" width="75%">
				<%=product.getPublish() %>
				</td>
			</tr>
			<tr>
				<td class=tablebody1 valign="middle" width="25%" align="center">
				[ 书 &nbsp号 ]
				</td>
				
				<td class=tablebody1 valign="middle" width="75%">
				<%=product.getProductid() %>
				</td>
			</tr>
			<tr>
				<td class=tablebody1 valign="middle" width="25%" align="center">
				[ 页 &nbsp码 ]
				</td>
				
				<td class=tablebody1 valign="middle" width="75%">
				<%=product.getPages() %>
				</td>
			</tr>
			<tr>
				<td class=tablebody1 valign="middle" width="25%" align="center">
				[所属类别]
				</td>
				
				<td class=tablebody1 valign="middle" width="75%">
				<%=product.getCategoryid() %><br>
				</td>
			</tr>
			<tr>
				<td class=tablebody1 valign="top" width="25%" align="center">
				[ 简 &nbsp介 ]
				</td>
				
				<td class=tablebody1 valign="middle" width="75%">
				<%=product.getDescription() %>
				</td>
			</tr>
			<tr>
				<td class=tablebody1 valign="middle" width="25%">
				
				</td>
				
				<td class=tablebody1 valign="middle" width="75%">
				&nbsp
				<img src="<%=request.getContextPath() %>/images/zcover2.gif"><!-- 数据库图片地址 -->
				</td>
			</tr>
			
			<tr>
			<td colspan="2" class=tablebody2 valign="top" align="center" width="100%" height="32"> 
				<a href="goods.do?pid=<%=product.getProductid()%>&baseprice=<%=product.getBasePrice()%>&name=<%=product.getName()%>"><img border="0" src="<%=request.getContextPath() %>/images/buycar.gif" ></a> 
    		</td>
    		</tr>
			
		</table>
		<br>
		<br>

<!-- Body End -->



<!-- Footer Start -->
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="28">
			<tr>
				<td height="17" background="<%=request.getContextPath() %>/images/bot_bg.gif">
				</td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td bgcolor="#f1f1f6" height="53" valign="center">
					<p align="center">
						Copyright &copy;2004 - 2005 <a href="http://www.tarena.com.cn"><b>Tarena</b><font color="red">.com.cn</font></a>
					</p>
				</td>

			</tr>
		</table>
<!-- Footer End -->
	</body>
</html>
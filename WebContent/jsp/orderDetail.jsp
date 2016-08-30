<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="cn.tedu.mvc.web.pojo.OrderDetail"%>
<%@page import="cn.tedu.mvc.web.pojo.Orders,cn.tedu.mvc.web.pojo.Contactinfo,javax.servlet.http.HttpServletRequest,java.util.List" language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%List<OrderDetail> orders = (List<OrderDetail>)session.getAttribute("list");%>
	<%Contactinfo cti = (Contactinfo)request.getAttribute("cti"); %>
	<%Double price =0.00;%>
<html>
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
					<a href=<%=request.getContextPath() %>/index.jsp>达内电子商务门户</a> → <a href="orderList.html">定单列表</a>  → <b>定单明细</b>
				</td>
			</tr>
		</table>
		<br>
		
		<table cellpadding="3" cellspacing="1" align="center" class="tableborder1">
			<tr>
				<td colspan="2" valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%">
					<font color="#ffffff">
						<b>用户信息</b>
					</font>
				</td>
			</tr>
			
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">
					<b>用户名：</b>
				</td>
				
    			<td class=tablebody1 valign="middle" width="60%"> 
    			<%=cti.getUserid()%>
    			</td>
			</tr>
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">
					<b>联系地址：</b>
				</td>
				
				<%String country[]={"中国","中国香港","中国台湾"} ;%>
				<%String province[]={"安徽","北京","重庆","福建","广东","甘肃","广西","贵州","河南","湖北","河北","海南","香港","黑龙江","湖南","吉林","江苏","江西","辽宁"}; %>
    			<td class=tablebody1 valign="middle" width="60%"> 
    			<%=country[Integer.parseInt(cti.getCountry())-1]%>
    			<%=province[Integer.parseInt(cti.getProvince())-1] %>
    			<%=cti.getCity()%>
    			<%=cti.getStreet1() %>
    			<%=cti.getStreet2() %>

    			</td>
			</tr>
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">
					<b>邮编：</b>
				</td>
				
    			<td class=tablebody1 valign="middle" width="60%"> 
    			<%=cti.getZip() %>
    			</td>
			</tr>
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">
					<b>家庭电话：</b>
				</td>
				
    			<td class=tablebody1 valign="middle" width="60%"> 
    			<%=cti.getHomephone() %>
    			</td>
			</tr>
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">
					<b>办公室电话：</b>
				</td>
				
    			<td class=tablebody1 valign="middle" width="60%"> 
    			<%=cti.getOfficephone() %>
    			</td>
			</tr>
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">
					<b>手机：</b>
				</td>
				
    			<td class=tablebody1 valign="middle" width="60%"> 
    			<%=cti.getCellphone() %>
    			</td>
			</tr>
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">
					<b>Email地址：</b>
				</td>
				
    			<td class=tablebody1 valign="middle" width="60%"> 
    			<%=cti.getEmail() %>
    			</td>
			</tr>
			
		</table>
		<br>
		<table cellpadding="3" cellspacing="1" align="center" class="tableborder1">
			<tr>
				<td colspan="2" valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%">
					<font color="#ffffff">
						<b>付款方式</b>
					</font>
				</td>
			</tr>
			
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">
					
				</td>
				
    			<td class=tablebody1 valign="middle" width="60%"> 
    			<%=orders.get(0).getPayStyle() %>
    			</td>
			</tr>
		
		</table>
		<br>
		
		
		<table cellpadding="3" cellspacing="1" align="center" class="tableborder1">
		<tr>
				<td colspan="5" valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%">
					<font color="#ffffff">
						<b>商品购物清单</b>
					</font>
				</td>
			</tr>
			<%for(int i = 0;i<orders.size();i++){ %>
			<tr>
				<td class=tablebody2 valign="middle"  align="center" width="3%">
					<%=i+1 %>
				</td>
				
    			<td class=tablebody1 valign="middle" width="50%"> 
    			<%=orders.get(i).getProductname()%>
    			</td>
    			<td class=tablebody2 valign="middle" align="center" width="18%"> 
    			价格：<%=orders.get(i).getBasePrice()%>
    			</td>
    			<td class=tablebody1 valign="middle" align="center" width="14%"> 
    			数量：<%=orders.get(i).getAmount() %>
    			</td>
    			<td class=tablebody2 valign="middle" width="25%"> 
    			小计：￥<%=Double.parseDouble(orders.get(i).getBasePrice())*orders.get(i).getAmount()%>
    			<%price+=Double.parseDouble(orders.get(i).getBasePrice())*orders.get(i).getAmount();%>
    			</td>
			</tr>
			<%} %>
			<tr>
			<td colspan="4" class=tablebody1 valign="middle" width="75%">
			
				</td>
			<td class=tablebody1 valign="middle" width="25%"> 
    			合计：<font color="red"><b>￥<%=price %></b><font>
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




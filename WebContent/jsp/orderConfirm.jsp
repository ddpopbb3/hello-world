<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="cn.tedu.mvc.web.pojo.Users,cn.tedu.mvc.web.pojo.Goods,cn.tedu.mvc.web.pojo.Contactinfo,javax.servlet.http.HttpServletRequest,java.util.List" language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%Users user=(Users)session.getAttribute("user");%>
    <%Contactinfo cti = (Contactinfo)request.getAttribute("cti"); %>
    <%List list = (List)session.getAttribute("goodslist");%>
<html>
<script type="text/javascript">
	function test(){
		var a = document.getElementById("cost").value;
		var b = document.getElementById("paywayid").value;
		alert(a);
		window.location.href = "neworder.do?cost="+a+"&paywayid="+b;
	}
</script>
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
	<form name='form1'>
		<table cellspacing="1" cellpadding="3" align="center" class="tableBorder2">
			<tr>
				<td height="25" valign="middle">
					<img src="<%=request.getContextPath() %>/images/Forum_nav.gif" align="absmiddle">
					<a href=<%=request.getContextPath() %>/index.jsp>达内电子商务门户</a> →&nbsp<img border="0" src="<%=request.getContextPath() %>/images/dog.gif" width="19" height="18">&nbsp订单确认
				</td>
			</tr>
		</table>
		
		<br>
		
		<table cellspacing="1" cellpadding="3" align="center" class="tableborder1">
			<tr>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%" colspan="2">
						<font color="#ffffff" size="2pt">
							<b>用户信息</b>
						</font>
						<input type="button" value="修改" onclick="javascript:window.location='userModify.do?userid=<%=user.getUserid() %>';">
				</td>
			</tr>
			<tr>
				<td class=tablebody2 valign="middle" align="right" width="40%">用户名&nbsp:&nbsp</td>
				<td class=tablebody1><%=user.getUserid() %></td>
			</tr>
			<tr>
				<td class=tablebody2 align="right">联系地址&nbsp:&nbsp</td>
				
				<%String country[]={"中国","中国香港","中国台湾"} ;%>
				<%String province[]={"安徽","北京","重庆","福建","广东","甘肃","广西","贵州","河南","湖北","河北","海南","香港","黑龙江","湖南","吉林","江苏","江西","辽宁"}; %>
    			<td class=tablebody1>
    			<%=country[Integer.parseInt(cti.getCountry())-1]%>
    			<%=province[Integer.parseInt(cti.getProvince())-1] %>
    			<%=cti.getCity()%>
    			<%=cti.getStreet1() %>
    			<%=cti.getStreet2() %>
				</td>
			</tr>
			<tr>
				<td class=tablebody2 align="right">邮编&nbsp:&nbsp</td>
				<td class=tablebody1><%=cti.getZip() %></td>
			</tr>
			<tr>
				<td class=tablebody2 align="right">家庭电话&nbsp:&nbsp</td>
				<td class=tablebody1><%=cti.getHomephone() %></td>
			</tr>
			<tr>
				<td class=tablebody2 align="right">办公室电话&nbsp:&nbsp</td>
				<td class=tablebody1><%=cti.getOfficephone() %></td>
			</tr>
			<tr>
				<td class=tablebody2 align="right">手机&nbsp:&nbsp</td>
				<td class=tablebody1><%=cti.getCellphone() %></td>
			</tr>
			<tr>
				<td class=tablebody2 align="right">Email地址&nbsp:&nbsp</td>
				<td class=tablebody1><%=cti.getEmail() %></td>
			</tr>
		</table>		
		
		<br>
		
		<table cellspacing="1" cellpadding="3" align="center" class="tableborder1">
			<tr>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%" colspan="2">
					<font color="#ffffff" size="2pt">
						<b>付款方式</b>
					</font>
				</td>
			</tr>
			<tr>
				<td class=tablebody2 align="center" width="40%"></td>
				<td class=tablebody1>
					<select id="paywayid">
						<option value="1">邮局汇款</option>
						<option value="2">银行转帐</option>
						<option value="3">货到付款</option>
					</select>
				</td>
			</tr>
		</table>
		
		<br>
		
		<table cellspacing="1" cellpadding="3" align="center" class="tableborder1">
			<tr>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%" colspan="5">
					<font color="#ffffff" size="2pt">
							<b>商品购物清单</b>
					</font>
					<input type="button" value="修改" onclick="javascript:window.location='<%=request.getContextPath()%>/jsp/shoppingCart.jsp';" >
				</td>
			</tr>
<%float sum = 0; float price=0; %>
			<%if(list!=null){ %>
			<% for(int i = 0;i <list.size();i++){
				Goods goods = (Goods)list.get(i);
				%>
				<tr>
				<td class=tablebody2 valign="middle" align="center" width="8%">
					<%=goods.getProductid()%>
				</td>
				<td class=tablebody1 valign="middle" align="center" width="44%">
					<%=goods.getName() %>
				</td>
				<td class=tablebody2 valign="middle" align="center" width="8%">
					<%=goods.getBaseprice()%>
				</td>
				<td class=tablebody1 valign="middle" align="center" width="8%">
					<input name="name" type="text" value="<%=goods.getAmount()%>">
				</td>
				<td class=tablebody2 valign="middle" align="center" width="8%">
					<b><%=(Float.parseFloat(goods.getBaseprice())*goods.getAmount()) %></b>
					<%price =  (Float.parseFloat(goods.getBaseprice())*goods.getAmount());%>
					<%sum += price; %>
				</td>
			</tr>
						<%} 
			}
			else{
			}%>
			<tr>
				<td class=tablebody1 align="center" colspan="4"></td>
				<td class=tablebody1>合计&nbsp:&nbsp<font color="red">￥<%=sum %></font></td>
				<input type="hidden" id="cost" value="<%=sum%>"/>
			</tr>
		</table>
		
		<br>
		
		<table cellspacing="1" cellpadding="3" align="center" border="0" width="98%">
			<tr>
				<td width="65%" align="center">
					<b>请认真检查以上订单信息，确认无误后，点击&nbsp;→</b>
					<a onclick="test()"><img border="0" src="<%=request.getContextPath() %>/images/submit.gif"></a>
				</td>
			</tr>
		</table>
		
		<br>
		</form>
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
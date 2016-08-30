<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="cn.tedu.mvc.web.pojo.Product,cn.tedu.mvc.web.pojo.Users,cn.tedu.mvc.web.pojo.Goods,cn.tedu.mvc.web.pojo.Users,java.util.ArrayList,javax.servlet.http.HttpServletRequest,java.util.List" language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<script type="text/javascript">
	function test(pro){
		var t1 = "goodsamount";
		var goodsamount =t1.concat(pro);
		var a = document.getElementById(goodsamount).value;
		var t2 = "pid";
		var proid = t2.concat(pro);
		var b = document.getElementById(proid).value;
		window.location.href = "updateGoods.do?pid="+b+"&goodsamount="+a;
	}
</script>
<%List list = (List)session.getAttribute("goodslist");%>
<%Users user=(Users)session.getAttribute("user");%>
	<head>
<!-- 
		var t1 = "goodsamount";
		var goodsamount =t1.concat(pro);
		var a = myform[goodsamount4].value;
		var t2 = "pid";
		var proid = t2.concat(pro);
		var b = myform[pid].value;
		alert("确认修改产品"+pro+a);
		window.location.href = "update.do?pid="+b+"&goodsamount="+a;

 -->
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
<form name="myform">
		<table cellspacing="1" cellpadding="3" align="center" class="tableBorder2">
			<tr>
				<td height="25" valign="middle">
					<img src="<%=request.getContextPath() %>/images/Forum_nav.gif" align="absmiddle">
					<a href=<%=request.getContextPath() %>/index.jsp>达内电子商务门户</a> →<img border="0" src="<%=request.getContextPath() %>/images/dog.gif" width="19" height="18"><b>购物清单</b>
				</td>
			</tr>
		</table>
		<br>

		<table cellpadding="3" cellspacing="1" align="center" class="tableborder1">
			<tr>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%">
					<font color="#ffffff">
						<b>序号</b>
					</font>
				</td>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="44%">
					<font color="#ffffff">
						<b>产品名称</b>
					</font>
				</td>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%">
					<font color="#ffffff">
						<b>价格</b>
					</font>
				</td>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%">
					<font color="#ffffff">
						<b>数量</b>
					</font>
				</td>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="8%">
					<font color="#ffffff">
						<b>合计</b>
					</font>
				</td>
				<td valign="middle" align="center" height="25" background="<%=request.getContextPath() %>/images/bg2.gif" width="24%">
					<font color="#ffffff">
						<b>操作</b>
					</font>
				</td>
			</tr>

			<tr>
			<%float sum = 0; float price=0; %>
			<%if(list!=null){ %>
			<% for(int i = 0;i <list.size();i++){
				Goods goods = (Goods)list.get(i);
				%>
				<td class=tablebody2 valign="middle" align="center" width="8%">
					<%=i+1%>
				</td>
				<td class=tablebody1 valign="middle" align="center" width="44%">
					<%=goods.getName() %>
				</td>
				<td class=tablebody2 valign="middle" align="center" width="8%">
					<%=goods.getBaseprice()%>
				</td>
				<td class=tablebody1 valign="middle" align="center" width="8%">
					<input id ="goodsamount" name="goodsamount<%=goods.getProductid()%>"   type="text" value="<%=goods.getAmount()%>">
					<input id = "pid" name="pid<%=goods.getProductid()%>"   type="hidden" value="<%=goods.getProductid()%>"><!-- 看这里！！！！！ -->
				</td>
				<td class=tablebody2 valign="middle" align="center" width="8%">
					<b><%=(Float.parseFloat(goods.getBaseprice())*goods.getAmount()) %></b>
					<%price =  (Float.parseFloat(goods.getBaseprice())*goods.getAmount());%>
					<%sum += price; %>
				</td>
				
				<td class=tablebody1 valign="middle" align="center" width="24%">
					<input type="button" value="删除物品" size="1" onclick="javascrtpt:window.location.href='deleteGoods.do?pid=<%=i+1%>'">
					<input type="button" value="保存修改" size="2" onclick="test(<%=goods.getProductid()%>)">
				</td>
						
			</tr>

			<%} 
			}
			else{
			}%>
			<tr>
				<td class=tablebody1 valign="middle" align="center" width="8%" colspan="4">
					
				</td>
				
				<td class=tablebody2 valign="middle" align="center" width="8%">
					<font color="red"><b><%=sum %></b></font>
				</td>
				<td class=tablebody1 valign="middle" align="center" width="24%">
					
				</td>
			</tr>
			<tr>
				<td class=tablebody2 valign="middle" align="center" width="8%" colspan="6">

					<input type="button" value="提交订单" size="1" onclick="javascript:window.location='orderConfirm.do?userid=<%=user.getUserid()%>'">
					<input type="button" value="继续购物" size="2" onclick="javascrtpt:window.location.href='productList.do'">
					<input type="button" value="清空购物车" size="2" onclick="javascript:window.location='noShoppingCart.do';">

				</td>
			</tr>
		</table>
		<br>
		
		
		
</form>
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="cn.tedu.mvc.web.pojo.Contactinfo,javax.servlet.http.HttpServletRequest,java.util.List" language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%Contactinfo contactinfo = (Contactinfo)request.getAttribute("contactinfo");%>
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
</html>
<!-- Header End -->
<!-- Body Start -->
<form method="post" name="reg"  action="<%=request.getContextPath() %>/userUpdate.do">
	<input type="hidden" name="userid" value="<%=contactinfo.getUserid()%>"/>

	<input type="hidden" name="contactid" value="<%=contactinfo.getContactid()%>"/>
		<table cellspacing="1" cellpadding="3" align="center" class="tableBorder2">

			<tr>
				<td height="25" valign="middle">
					<img src="<%=request.getContextPath() %>/images/Forum_nav.gif" align="absmiddle">
					<a href="<%=request.getContextPath() %>/index.jsp">达内电子商务门户</a> →用户信息修改
				</td>
			</tr>
		</table>
		<br>
		<table cellspacing="1" cellpadding="3" align="center" class="tableBorder1">
			<tr>
				 <td colspan="2" align="center" valign="middle" background="<%=request.getContextPath() %>/images/bg2.gif" width="60%"> &nbsp;&nbsp;<font><b>用户信息修改</b></font> 
   				 </td>
			<tr>
			<tr>
				<td width="40%" class="tablebody1"><b>用户名</b>：<br>英文字母或数字，最大长度为8位</td>
				<td width="60%" class="tablebody1">
				<input type="text" maxLength="12" size="32" name="username"  value="<%=contactinfo.getUserid()%>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
				<font color="#FF0000">*</font></td>
			</tr>
			<tr>
				<td width="40%" class="tablebody1"><b>密码</b>：<br>数字，6到8位</td>
				<td width="60%" class="tablebody1">
				<input type="password" maxLength="12" size="32" name="password" value="<%=contactinfo.getPassword() %>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
				<font color="#FF0000">*</font></td>
			</tr>
			<tr>
				<td width="40%" class="tablebody1"><b>确认密码</b>：<br>数字，6到8位</td>
				<td width="60%" class="tablebody1">
				<input type="password" maxLength="12" size="32" name="password2" value="<%=contactinfo.getPassword() %>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
				<font color="#FF0000">*</font></td>
			</tr>
			<%String country[]={"中国","中国香港","中国台湾"} ;%>
			<%String province[]={"安徽","北京","重庆","福建","广东","甘肃","广西","贵州","河南","湖北","河北","海南","香港","黑龙江","湖南","吉林","江苏","江西","辽宁"}; %>
			<tr>
				<td width="40%" class="tablebody1"><b>所在地区</b>：</td>
				<td width="60%" class="tablebody1">
					<select name="country" onchange="javascript:initProvince(this.value)" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
               		  	<%for(int i=0;i<country.length;i++){
               		  		String ii = String.valueOf(i+1) ;
							 if(ii.equals(contactinfo.getCountry())){
							 %>
							 <option value="<%=i+1 %>" selected ="selected"><%=country[i] %> </option>
							<%
							 }
							 else{
							 %>
							 <option value="<%=i+1 %>"><%=country[i] %> </option>
							<%
							 }
						}
						%>
						
					</select>
					<select name="province" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000">
               		  	<%for(int i=0;i<province.length;i++){
               		  		String ii = String.valueOf(i+1) ;
							 if(ii.equals(contactinfo.getProvince())){
							 %>
							 <option value="<%=i+1 %>" selected ="selected"><%=province[i] %> </option>
							<%
							 }
							 else{
							 %>
							 <option value="<%=i+1 %>"><%=province[i] %> </option>
							<%
							 }
						}
						%>
				</select>省
				<input type="text" size="8" name="city" value="<%=contactinfo.getCity() %>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>市/县</td>
			</tr>
			<tr>
				<td class="tablebody1"><b>联系地址1</b>：</td>
				<td class="tablebody1">
				<input type="text" size="64" maxlength="32" name="street1" value="<%=contactinfo.getStreet1() %>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
			</td>
			<tr>
				<td class="tablebody1"><b>联系地址2</b>：</td>
				<td class="tablebody1">
				<input type="text" size="64" maxlength="32" name="street2" value="<%=contactinfo.getStreet2()%>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
			</td>
			<tr>
				<td class="tablebody1"><b>邮编</b>：</td>
				<td class="tablebody1">
				<input type="text" size="32" maxlength="8" name="zip" value="<%=contactinfo.getZip()%>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
			</td>
			<tr>
				<td class="tablebody1"><b>家庭电话</b>：</td>
				<td class="tablebody1">
				<input type="text" size="32" maxlength="16" name="homephone" value="<%=contactinfo.getHomephone()%>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
			</td>
			<tr>
				<td class="tablebody1"><b>办公室电话</b>：</td>
				<td class="tablebody1">
				<input type="text" size="32" maxlength="16" name="officephone" value="<%=contactinfo.getOfficephone() %>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
			</td>
			<tr>
				<td class="tablebody1"><b>手机</b>：</td>
				<td class="tablebody1">
				<input type="text" size="32" maxlength="16" name="cellphone" value="<%=contactinfo.getCellphone() %>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/>
			</td>
			<tr>

			<td class="tablebody1"><b>Email地址</b>：<br>	请输入有效的邮件地址</td>
			<td class="tablebody1">
			<input maxLength="50" size="32" maxlength="32" name="email" value="<%=contactinfo.getEmail() %>" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px; color: #000000"/></td>
			</tr>
			<tr>
			<td class="tablebody2" valign="middle" colspan="2" align="center">
			<input type="submit" value="修&nbsp;改"/>
			</td>
		</tr>
		</table>
</form>
<html>
	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="28">
		  <tr>

		    <td height="17" background="/ecport/images/bot_bg.gif"></td>
		  </tr>
		</table>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
		    <td bgcolor="#f1f1f6" height="53" valign="center">
			<p align="center">
				Copyright &copy;2004 - 2005 <a href="http://www.tarena.com.cn">

				<b><font face="Verdana,">Tarena</font></b>
				<font color=#CC0000>.com.cn</font>
			</a></p><br>
		    </td>
		  </tr>
		</table>
	</body>
</html>

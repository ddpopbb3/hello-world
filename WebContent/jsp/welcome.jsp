<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="cn.tedu.mvc.web.pojo.Users,javax.servlet.http.HttpServletRequest,java.util.List" language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Welcome</title>
	</head>
<%Users user=(Users)request.getAttribute("user");%>
<body>
<h2 align="center">Welcome</h2>
<hr>
Welcome <%=user.getUserid() %>!<br/>
<a href="<%=request.getContextPath()%>/productList.do ">to HomePage</a>
</body>
</html>
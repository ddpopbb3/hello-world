package cn.tedu.mvc.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.mvc.web.pojo.Student;

public class StudentListServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			List studentList = (List)req.getAttribute("studentList");
			
			resp.setContentType("text/html");
			
			PrintWriter out = resp.getWriter();
			
			out.println("<html>");
			out.println("<head>");
			out.println("	<title>StudentList</title>");
			out.println("</head>");
			out.println("");
			out.println("<body>");
			out.println("<h2 align=\"center\">StudentList</h2>");
			out.println("<hr>");
			out.println("<table border=\"1\" align=\"center\">");
			out.println("	<tr>");
			out.println("		<th>USER_NAME</th>");
			out.println("		<th>PASSWORD</th>");
			out.println("		<th>PROVINCE</th>");
			out.println("		<th>GENDER</th>");
			out.println("		<th>HOBBIES</th>");
			out.println("	</tr>");
			
			for(int i = 0;i < studentList.size();i++){
				Student student = (Student)studentList.get(i);
				
				out.println("	<tr>");
				out.println("		<td>" + student.getUserName() + "</td>");
				out.println("		<td>" + student.getPassword() + "</td>");
				out.println("		<td>" + student.getProvince() + "</td>");
				out.println("		<td>" + student.getGender() + "</td>");
				out.println("		<td>" + student.getHobbes() + "</td>");
				out.println("	</tr>");
			}
						
			out.println("</table>");
			out.println("");
			out.println("</body>");
			out.println("</html>");
			
			out.close();	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

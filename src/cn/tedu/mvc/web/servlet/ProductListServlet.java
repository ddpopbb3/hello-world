package cn.tedu.mvc.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.mvc.web.pojo.Product;

public class ProductListServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			List productList = (List)req.getAttribute("productList");
			
			resp.setContentType("text/html;charset=gbk");
			
			PrintWriter out = resp.getWriter();
			
			out.println("<html>");
			out.println("<head>");
			out.println("	<title>StudentList</title>");
			out.println("</head>");
			out.println("");
			out.println("<body>");
			out.println("<h2 align=\"center\">ProductList</h2>");
			out.println("<hr>");
			out.println("<table border=\"1\" align=\"center\">");
			out.println("	<tr>");
			out.println("		<th>name</th>");
			out.println("		<th>basePrice</th>");
			out.println("	</tr>");
			
			for(int i = 0;i < productList.size();i++){
				Product product = (Product)productList.get(i);
				
				out.println("	<tr>");
				out.println("		<td>" + product.getName() + "</td>");
				out.println("		<td>" + product.getBasePrice() + "</td>");
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

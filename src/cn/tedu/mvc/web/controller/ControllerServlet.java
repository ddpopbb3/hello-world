package cn.tedu.mvc.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tedu.mvc.web.service.ProductService;
import cn.tedu.mvc.web.service.StudentService;

public class ControllerServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("ok");
			//toStudentList(req, resp);	
		      toProductList(req,resp);
		
	}

	private void toStudentList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			StudentService studentService = new StudentService();
			
			List studentList = studentService.getStudentList();
			
			req.setAttribute("studentList", studentList);
			
			//forward to studentList
			getServletContext().getRequestDispatcher("/studentList").forward(req, resp);
		}catch(Exception e){
			//forward to error
			req.setAttribute("message", e.getMessage());
			
			getServletContext().getRequestDispatcher("/error").forward(req, resp);
		}
	}
	
	private void toProductList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			ProductService productService = new ProductService();
			
			List productList = productService.getProductList();
			
			req.setAttribute("productList", productList);
			
			//forward to studentList
			getServletContext().getRequestDispatcher("/ProductListServlet").forward(req, resp);
		}catch(Exception e){
			//forward to error
			req.setAttribute("message", e.getMessage());
			
			getServletContext().getRequestDispatcher("/error").forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

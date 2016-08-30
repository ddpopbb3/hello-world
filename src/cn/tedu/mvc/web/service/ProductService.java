package cn.tedu.mvc.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.tedu.mvc.web.pojo.Product;
import cn.tedu.mvc.web.util.ConnectionFactory;

public class ProductService {
	
	
	public List getProductList(){
		List productList = new ArrayList();
		
		Connection conn = null;
		
		Statement stmt = null;
		
		ResultSet rs = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery("select * from product");
			
			while(rs.next()){
				Product product = new Product();
				
				product.setName(rs.getString("name"));
				product.setProductid(rs.getString("productid"));
				product.setDescription(rs.getNString("description"));
				product.setBasePrice(rs.getDouble("basePrice"));
				product.setCategoryid(rs.getString("categoryid"));
				product.setAuthor(rs.getNString("author"));
				product.setPublish(rs.getNString("publish"));
				product.setPages(rs.getInt("pages"));

				productList.add(product);
			}
			
			return productList;
		} catch (Exception e) {
			throw new RuntimeException("Error when query product",e);
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				throw new RuntimeException("Error when query product",e);
			}
		}
	}
}

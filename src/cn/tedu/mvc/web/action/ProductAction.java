package cn.tedu.mvc.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import cn.tedu.mvc.web.pojo.Product;
import cn.tedu.mvc.web.pojo.Users;
import cn.tedu.mvc.web.service.ProductService;

public class ProductAction {
	@SuppressWarnings("rawtypes")
	public String productList(){
		
		ProductService ps = new ProductService();

		
		List list = ps.getProductList();
		
//		for(int i =0;i<list.size();i++){
//			Product product = new Product();
//			product = (Product) list.get(i);
//			System.out.println(product.getName());
//		}
		
		ActionContext.getContext().put("list",list);
		
		return "ok";
	}
}

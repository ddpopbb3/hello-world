package cn.tedu.mvc.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import cn.tedu.mvc.web.pojo.Product;
import cn.tedu.mvc.web.pojo.Users;
import cn.tedu.mvc.web.service.ProductService;
import cn.tedu.mvc.web.service.UserService;

public class UserAction {
	@SuppressWarnings("rawtypes")
	public String userList(){
		if((Users)ActionContext.getContext().getSession().get("user")!=null){
		
		UserService ps = new UserService();
		
		List list = ps.getuserList();
		for(int i=0;i<list.size();i++){
			Users user = (Users)list.get(i);
		}
		ActionContext.getContext().put("userlist",list);
		
		return "ok";
		}
		else{
			return "login";
		}
	}
}

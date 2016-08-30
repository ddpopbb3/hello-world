package cn.tedu.mvc.web.action;

import com.opensymphony.xwork2.ActionContext;

import cn.tedu.mvc.web.pojo.Users;
import cn.tedu.mvc.web.service.UserService;

public class loginAction{
	private String userid;
	private String password;

	

	public String dologin(){  
		UserService us = new UserService();
		ActionContext.getContext().getSession().put("user", null);
		ActionContext.getContext().getSession().put("goodslist", null);
		
		
//		System.out.print(userid);
//		System.out.print(password);
		
		Users user = us.getUser(userid,password);
		
		if(user!=null){
			ActionContext.getContext().getSession().put("user", user);
			return "welcome";
		}
		else{
			ActionContext.getContext().getSession().put("user", null);
			return "login";
		}
		
    }  
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}

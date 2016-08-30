package cn.tedu.mvc.web.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import cn.tedu.mvc.web.pojo.Contactinfo;
import cn.tedu.mvc.web.pojo.OrderDetail;
import cn.tedu.mvc.web.pojo.Orders;
import cn.tedu.mvc.web.pojo.Users;
import cn.tedu.mvc.web.service.OrderService;
import cn.tedu.mvc.web.service.UserModifyService;

public class OrderAction{
	private String orderid;
	private String userid;
	private String paywayid;
	private String cost;

	public String getList(){
		if((Users)ActionContext.getContext().getSession().get("user")!=null){
		OrderService ols = new OrderService();
		List list = new ArrayList();
		Users user=(Users)ActionContext.getContext().getSession().get("user");
		list = ols.getOrderList(user.getUserid());
		ActionContext.getContext().put("orders", list);
		
		return "ok";
		}
		else{
			return "login";
		}
    }  
	public String getDetail(){  
		if((Users)ActionContext.getContext().getSession().get("user")!=null){
		OrderDetail od = new OrderDetail();
		OrderService os = new OrderService();
		Users user = (Users) ActionContext.getContext().getSession().get("user");	
		List<OrderDetail>  list= (List) os.getOrderDetail2(user.getUserid(),orderid);
		ActionContext.getContext().getSession().put("list", list);
		for(int i = 0;i<list.size();i++){ 
			System.out.println(list.get(i).getProductname());
		}
		OrderService ols = new OrderService();

		UserModifyService ums = new UserModifyService();
		Contactinfo cti = ums.getCti(user.getUserid());
		ActionContext.getContext().put("cti", cti);
		System.out.println(cti.getUserid());
		System.out.println(cti.getContactid());
		System.out.println(cti.getStreet1());
		System.out.println(cti.getStreet2());

		return "ok";
		}
		else{
			return "login";
		}
    }
	public String insert(){
		if((List) ActionContext.getContext().getSession().get("goodslist")!=null){
		UserModifyService ums = new UserModifyService();
		Contactinfo cti = ums.getCti(userid);
		ActionContext.getContext().put("cti", cti);
		
		return "ok";
		}
		else{
			return "back";
		}
		}
	
	public String NewOrder() throws ClassNotFoundException, SQLException{
		Users user =(Users)ActionContext.getContext().getSession().get("user");
		List goods = (List) ActionContext.getContext().getSession().get("goodslist");
		OrderService os = new OrderService();
		Orders orders = new Orders();
		orders.setPaywayid(paywayid);
		orders.setCost(cost);
		os.newOrder(orders, user.getUserid(), goods);
		ActionContext.getContext().getSession().put("goodslist", null);
		return "ok";
		}
	

	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getPaywayid() {
		return paywayid;
	}
	public void setPaywayid(String paywayid) {
		this.paywayid = paywayid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

}

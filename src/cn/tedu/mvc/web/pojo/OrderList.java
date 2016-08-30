package cn.tedu.mvc.web.pojo;

public class OrderList {
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
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
	public String getStatusid() {
		return statusid;
	}
	public void setStatusid(String statusid) {
		this.statusid = statusid;
	}
	private String orderid;
	private String cost;
	private String paywayid;
	private String statusid;
}

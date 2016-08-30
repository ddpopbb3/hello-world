package cn.tedu.mvc.web.pojo;

public class Orderline {
	private String lineid;
	public String getLineid() {
		return lineid;
	}
	public void setLineid(String lineid) {
		this.lineid = lineid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	private String orderid;
	private String productid;
	private int amount;
}

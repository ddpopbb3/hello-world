package cn.tedu.mvc.web.pojo;

public class OrderDetail {
	private String orderid;
	private String productname;
	private String basePrice;
	private String payStyle;
	private String userid;
	private String o_name;
	private int amount;
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
	
	@Override
	public String toString() {
		return "OrderDetail [orderid=" + orderid + ", productname=" + productname + ", basePrice=" + basePrice
				+ ", payStyle=" + payStyle + ", userid=" + userid + ", o_name=" + o_name + ", amount=" + amount + "]";
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(String basePrice) {
		this.basePrice = basePrice;
	}
	public String getPayStyle() {
		return payStyle;
	}
	public void setPayStyle(String payStyle) {
		this.payStyle = payStyle;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	

}

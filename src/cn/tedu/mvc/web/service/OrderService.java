package cn.tedu.mvc.web.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.tedu.mvc.web.pojo.Contactinfo;
import cn.tedu.mvc.web.pojo.Goods;
import cn.tedu.mvc.web.pojo.OrderDetail;
import cn.tedu.mvc.web.pojo.OrderList;
import cn.tedu.mvc.web.pojo.Orders;
import cn.tedu.mvc.web.pojo.Payway;
import cn.tedu.mvc.web.util.ConnectionFactory;


public class OrderService {
	
	public void newOrder(Orders orders,String userid,List goods) throws ClassNotFoundException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = ConnectionFactory.getConnection();
		String orderid = null;
		String lineid = null;
		
		try {
			stmt = conn.prepareStatement("select count(orderid) from orders");
			rs = stmt.executeQuery();
			if(rs.next()){
				int n=0;
				n = Integer.parseInt(rs.getString("count(orderid)"));
				orderid = String.valueOf(n+1);
			}
			stmt =conn.prepareStatement("insert into orders(orderid,cost,userid,statusid,paywayid) values(?,?,?,?,?)");
		
		
			stmt.setString(1,orderid);
			stmt.setString(2, orders.getCost());
			stmt.setString(3, userid);
			stmt.setString(4, "1");
			stmt.setString(5, orders.getPaywayid());
			stmt.executeUpdate();
		
		for(int i=0;i<goods.size();i++){
			stmt = conn.prepareStatement("select count(lineid) from orderline");
			rs = stmt.executeQuery();
			if(rs.next()){
				int n=0;
				n = Integer.parseInt(rs.getString("count(lineid)"));
				lineid = String.valueOf(n+1);
			}
			Goods gs = (Goods) goods.get(i);
			stmt =conn.prepareStatement("insert into orderline (lineid,orderid,productid,amount) values(?,?,?,?)");
			stmt.setString(1,lineid);
			stmt.setString(2, orderid);
			stmt.setString(3, gs.getProductid());
			stmt.setString(4, String.valueOf(gs.getAmount()));
			stmt.executeUpdate();
		}
		
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List getOrderList(String userid){
	List orderlist = new ArrayList();
	
	Connection conn = null;
	
	PreparedStatement stmt = null;
	
	ResultSet rs = null;
	
	try {
		
		conn = ConnectionFactory.getConnection();
		
		stmt = conn.prepareStatement("select * from orders where userid = ?");
		stmt.setString(1,userid);
		
		rs = stmt.executeQuery();
		
		while(rs.next()){
			
			Orders orders = new Orders();
			orders.setOrderid(rs.getString("orderid"));
			orders.setCost(rs.getString("cost"));
			if("1".equals(rs.getString("paywayid"))){
				orders.setPaywayid("邮局汇款");
			}
			else if("2".equals(rs.getString("paywayid"))){
				orders.setPaywayid("银行转账");
			}
			else{
				orders.setPaywayid("货到付款");
			}
			if("1".equals(rs.getString("statusid"))){
				orders.setStatusid("pending");
			}
			else if("2".equals(rs.getString("paywayid"))){
				orders.setStatusid("processing");
			}
			else{
				orders.setStatusid("finished");
			}
			
			orderlist.add(orders);
		}
		return orderlist;
		
		} catch (Exception e) {
			throw new RuntimeException("Error when query orders cnm!",e);
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				throw new RuntimeException("Error when query orders,fuck!",e);
			}
		}
	}
	
	public List<OrderDetail> getOrderDetail2(String userid,String orderid){
		Connection conn = null;
		
		PreparedStatement stmt = null;
		
		ResultSet rs = null;
		

		
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		
		try {
			conn = ConnectionFactory.getConnection();
			
			stmt = conn.prepareStatement("select * from DETAIL where userid = ? and orderid = ?");
			
			stmt.setString(1, userid);
			stmt.setString(2, orderid);
			
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDetail od = new OrderDetail();
				od.setUserid(rs.getString("userid"));
				od.setOrderid(rs.getString("orderid"));
				od.setBasePrice(rs.getString("basePrice"));
				od.setAmount(rs.getInt("amount"));
				od.setO_name(rs.getString("o_name"));
				od.setPayStyle(rs.getString("paystyle"));
				od.setProductname(rs.getString("name"));
				list.add(od);
			}
			return list;
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public Orders getOrderDetail(String orderid){
		Connection conn = null;
		
		PreparedStatement stmt = null;
		
		ResultSet rs = null;
		
		
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			stmt = conn.prepareStatement("select * from orders where orderid = ?");
			
			stmt.setString(1, orderid);
			
			rs = stmt.executeQuery();
			
			if(rs.next()){
				
				Orders orders = new Orders();
				orders.setOrderid(orderid);
				orders.setUserid(rs.getString("userid"));
				orders.setCost(rs.getString("cost"));
				if("1".equals(rs.getString("paywayid"))){
					orders.setPaywayid("货到付款");
				}
				else if("2".equals(rs.getString("paywayid"))){
					orders.setPaywayid("邮局汇款");
				}
				else{
					orders.setPaywayid("银行转帐");
				}
				if("1".equals(rs.getString("statusid"))){
					orders.setStatusid("pending");
				}
				else if("2".equals(rs.getString("paywayid"))){
					orders.setStatusid("processing");
				}
				else{
					orders.setStatusid("finished");
				}
				return orders;
			}
			return null;
			
			} catch (Exception e) {
				throw new RuntimeException("Error when query orders cnm!",e);
			} finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					throw new RuntimeException("Error when query orders,fuck!",e);
				}
			}
	}
	public Orders getOrderLine(String orderid){
		Connection conn = null;
		
		PreparedStatement stmt = null;
		
		ResultSet rs = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			stmt = conn.prepareStatement("select * from orderline where orderid = ?");
			
			stmt.setString(1, orderid);
			
			rs = stmt.executeQuery();
			
			if(rs.next()){
				
				Orders orders = new Orders();
				orders.setOrderid(rs.getString("orderid"));
				orders.setCost(rs.getString("cost"));
				return orders;
			}
			return null;
			
			} catch (Exception e) {
				throw new RuntimeException("Error when query orders cnm!",e);
			} finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					throw new RuntimeException("Error when query orders,fuck!",e);
				}
			}
	}
	
}

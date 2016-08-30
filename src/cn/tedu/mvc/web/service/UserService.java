package cn.tedu.mvc.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import cn.tedu.mvc.web.pojo.Users;
import cn.tedu.mvc.web.util.ConnectionFactory;



public class UserService {
	public List getuserList(){
		List userList = new ArrayList();
		
		Connection conn = null;
		
		Statement stmt = null;
		
		ResultSet rs = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery("select * from users");
			
			while(rs.next()){
				Users us = new Users();
				
				us.setUserid(rs.getString("userid"));
				
				us.setUserName(rs.getString("name"));
				
				us.setPassword(rs.getString("password"));
				
				userList.add(us);
				
			}
			
			
			return userList;
		} catch (Exception e) {
			throw new RuntimeException("Error when query users",e);
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				throw new RuntimeException("Error when query users",e);
			}
		}
	}

	public Users getUser(String userid,String password){
		
		Connection conn = null;
		
		PreparedStatement stmt = null;
		
		ResultSet rs = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			stmt =conn.prepareStatement("select * from users where userid = ? and password = ?");
			
			stmt.setString(1,userid);
			stmt.setString(2,password);
			
			
			rs = stmt.executeQuery();
			if(rs.next()){
				
				Users u = new Users();
				u.setUserid(rs.getString("userid"));
				u.setPassword(rs.getString("password"));
				
				return u;
			}
			
			return null;
			} catch (Exception e) {
				throw new RuntimeException("Error when query user cnm!",e);
			} finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					throw new RuntimeException("Error when query user,fuck!",e);
				}
			}
		}
}



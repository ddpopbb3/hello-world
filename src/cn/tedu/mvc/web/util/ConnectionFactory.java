package cn.tedu.mvc.web.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	private static final String DB_PASSWORD="new_password";
	private static final String DB_USER="root";
	private static final String DB_URL="jdbc:mysql://localhost/gwap";
	private static final String DB_DRIVER="com.mysql.jdbc.Driver";
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Connection conn;
		Class.forName(DB_DRIVER);
		conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
		return conn;
	}
	public static void main(String args[]){
		try {
			Connection con = ConnectionFactory.getConnection();
			if(con!=null)
			System.out.println("ok");
			else
				System.out.println("asdf");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}	

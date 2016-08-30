package cn.tedu.mvc.web.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import cn.tedu.mvc.web.pojo.Contactinfo;
import cn.tedu.mvc.web.util.ConnectionFactory;

public class UserModifyService {
	
	public Contactinfo getInfo(String userid){
		
		Connection conn = null;
		
		PreparedStatement stmt = null;
		
		ResultSet rs = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			stmt =conn.prepareStatement("select * from contactinfo,users where users.userid = contactinfo.userid and contactinfo.userid = ? ");
			
			stmt.setString(1,userid);
			
			rs = stmt.executeQuery();
			if(rs.next()){
				
				Contactinfo cti = new Contactinfo();
				cti.setUserid(userid);
				cti.setUsername(rs.getString("userid"));
				cti.setPassword(rs.getString("password"));
				cti.setCellphone(rs.getString("cellphone"));
				cti.setCity(rs.getString("city"));
				cti.setContactid(rs.getString("contactid"));
				cti.setCountry(rs.getString("country"));
				cti.setEmail(rs.getString("email"));
				cti.setHomephone(rs.getString("homephone"));
				cti.setOfficephone(rs.getString("officephone"));
				cti.setProvince(rs.getString("province"));
				cti.setStreet1(rs.getString("street1"));
				cti.setStreet2(rs.getString("street2"));
				cti.setZip(rs.getString("zip"));
				
				return cti;
			}
			
			return null;
			} catch (Exception e) {
				throw new RuntimeException("Error when query contactinfo cnm!",e);
			} finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					throw new RuntimeException("Error when query contactinfo,fuck!",e);
				}
			}
		}
	
	
public Contactinfo getCti(String userid){
		
		Connection conn = null;
		
		PreparedStatement stmt = null;
		
		ResultSet rs = null;
		
		try {
			
			conn = ConnectionFactory.getConnection();
			
			stmt =conn.prepareStatement("select * from contactinfo where userid = ? ");
			
			stmt.setString(1,userid);
			
			rs = stmt.executeQuery();
			if(rs.next()){
				
				Contactinfo cti = new Contactinfo();
				cti.setUserid(userid);
				cti.setCellphone(rs.getString("cellphone"));
				cti.setCity(rs.getString("city"));
				cti.setContactid(rs.getString("contactid"));
				cti.setCountry(rs.getString("country"));
				cti.setEmail(rs.getString("email"));
				cti.setHomephone(rs.getString("homephone"));
				cti.setOfficephone(rs.getString("officephone"));
				cti.setProvince(rs.getString("province"));
				cti.setStreet1(rs.getString("street1"));
				cti.setStreet2(rs.getString("street2"));
				cti.setZip(rs.getString("zip"));
				
				return cti;
			}
			
			return null;
			} catch (Exception e) {
				throw new RuntimeException("Error when query contactinfo cnm!",e);
			} finally {
				try {
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					throw new RuntimeException("Error when query contactinfo,fuck!",e);
				}
			}
		}
	
	public void newUser(Contactinfo cti) throws ClassNotFoundException, SQLException{
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = ConnectionFactory.getConnection();
		String contactid = null;
		
		try {
			stmt = conn.prepareStatement("select count(contactid) from contactinfo");
			rs = rs = stmt.executeQuery();
			if(rs.next()){
				int n=0;
				n = Integer.parseInt(rs.getString("count(contactid)"));
				contactid = String.valueOf(n+1);
			}
			stmt =conn.prepareStatement("insert into contactinfo(street1,street2,city,province,country,zip"
					+ ",email,homephone,cellphone,officephone,userid,contactid)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?)");
		
		
			stmt.setString(1,cti.getStreet1());
			stmt.setString(2,cti.getStreet2());
			stmt.setString(3,cti.getCity());
			stmt.setString(4,cti.getProvince());
			stmt.setString(5,cti.getCountry());
			stmt.setString(6,cti.getZip());
			stmt.setString(7,cti.getEmail());
			stmt.setString(8,cti.getHomephone());
			stmt.setString(9,cti.getCellphone());
			stmt.setString(10,cti.getOfficephone());
			stmt.setString(11,cti.getUserid());
			stmt.setString(12,contactid);
			stmt.executeUpdate();
		
		stmt =conn.prepareStatement("insert into users (userid,password) values(?,?)");
		stmt.setString(1,cti.getUserid());
		stmt.setString(2,cti.getPassword());
		stmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void setUser(Contactinfo cti) throws ClassNotFoundException, SQLException{
		
		Connection conn = null;
		PreparedStatement stmt = null;
		conn = ConnectionFactory.getConnection();
		
		try {
			stmt =conn.prepareStatement("update contactinfo set street1=? ,"
					+ "street2 = ?,city = ? ,province = ?, country = ?, zip = ?,"
					+ "email = ?, homephone = ?, cellphone = ?, officephone = ?, userid=?"
					+ "where userid = ?");
		
		
		stmt.setString(1,cti.getStreet1());
		stmt.setString(2,cti.getStreet2());
		stmt.setString(3,cti.getCity());
		stmt.setString(4,cti.getProvince());
		stmt.setString(5,cti.getCountry());
		stmt.setString(6,cti.getZip());
		stmt.setString(7,cti.getEmail());
		stmt.setString(8,cti.getHomephone());
		stmt.setString(9,cti.getCellphone());
		stmt.setString(10,cti.getOfficephone());
		stmt.setString(11,cti.getUserid());
		stmt.setString(12,cti.getUserid());
		stmt.executeUpdate();
		
		stmt =conn.prepareStatement("update users set userid=?,password=? where userid = ?");
		stmt.setString(1,cti.getUsername());
		stmt.setString(2,cti.getPassword());
		System.out.println(cti.getUsername());
		stmt.setString(3, cti.getUserid());
		stmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

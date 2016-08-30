package cn.tedu.mvc.web.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.tedu.mvc.web.pojo.Student;
import cn.tedu.mvc.web.util.ConnectionFactory;

public class StudentService {
	
	
	public List getStudentList(){
		List studentList = new ArrayList();
		
		Connection conn = null;
		
		Statement stmt = null;
		
		ResultSet rs = null;
		
		try {
			conn = ConnectionFactory.getConnection();
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery("select * from student");
			
			while(rs.next()){
				Student student = new Student();
				
				student.setUserName(rs.getString("USER_NAME"));
				student.setPassword(rs.getString("PASSWORD"));
				student.setGender(rs.getString("GENDER"));
				student.setProvince(rs.getString("PROVINCE"));
				student.setHobbes(rs.getString("HOBBIES"));
				
				studentList.add(student);
			}
			
			return studentList;
		} catch (Exception e) {
			throw new RuntimeException("Error when query students",e);
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				throw new RuntimeException("Error when query students",e);
			}
		}
	}
}

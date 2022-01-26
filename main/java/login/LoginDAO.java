package login;

import java.sql.*;

import dbconn.DBconn;

public class LoginDAO {
	DBconn db;
	
	String sql;
	Statement stmt;
	PreparedStatement pstmt;
	CallableStatement cstmt;
	ResultSet rs;
	
	public LoginDAO() {
		db = new DBconn();
		db.start();
	}
	
	public String login(String id) {
		String pw = null;
		
		try {
			sql = "select * from user where user_id = \'" + id + "\'";
			stmt = db.getCon().createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				pw = rs.getString("user_pw");
			}
			
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return pw;
	}

}

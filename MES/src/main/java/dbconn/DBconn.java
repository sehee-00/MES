package dbconn;

import java.sql.*;

public class DBconn {
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://192.168.0.115:3306/mes?" + "useUnicode=true&characterEncoding=utf8"; 
	private String id = "Usera";
	private String pw = "1234";
	private Connection con;
	
	public DBconn() { //DB 연결
		try {
			Class.forName(driver);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getCon(){ //Connection 연결
		try {
			con = DriverManager.getConnection(url, id, pw);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void close() { //Connection 해제
		try {
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

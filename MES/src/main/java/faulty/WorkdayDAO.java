package faulty;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBconn;
public class WorkdayDAO {
	private DBconn db;

	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	private Connection con;
	
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://192.168.0.115:3306/mes?" + "useUnicode=true&characterEncoding=utf8"; 
	private String id = "Usera";
	private String pw = "1234";
	
	
	
	public WorkdayDAO() {
		db = new DBconn();
	}
	

	public Workday getWork(String ln) {
		Workday vo = new Workday();
			
			try {
				String sql = "select * from my_work where work_id = " + ln + "";
				con = db.getCon();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					vo.setProcess(rs.getString("process"));
					vo.setOrder_name(rs.getString("order_name"));
					vo.setClient(rs.getString("client"));
					vo.setWorker(rs.getString("worker"));			
					vo.setFacilities(rs.getString("facilities"));
					vo.setWork_start(rs.getString("work_start"));	
					vo.setWork_end(rs.getString("work_end"));
					//vo.setPart_name(rs.getString("part_name"));
				}
				
				con.close();
				stmt.close();
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return vo;
	}
	
	public String[] getpdate(String it) {
		String SQL="select del_date, order_note from mes.order where item_no = ?";
		String []result=new String[2];
		
		try {
			con = DriverManager.getConnection(url, id, pw);
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, it);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result[0] = rs.getString(1);
				result[1] = rs.getString(2);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public String getPay(String ln) {
		String SQL="SELECT pay FROM mes.process where process_name = ?";
		String result=null;
		
		try {
			con = DriverManager.getConnection(url, id, pw);
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, ln);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String getTotaltime(String ln) {
		String SQL="SELECT TIMESTAMPDIFF(hour, work_start, work_end)AS time_diff FROM mes.my_work WHERE work_id = " + ln + "";
		String result=null;
		
		try {
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				result = rs.getString(1);
			}
			
			con.close();
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String getMcost(String ln) {
		String SQL="select manufacturing_cost from my_work where work_id = " + ln + "";
		String result=null;
		
		try {
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				result = rs.getString(1);
			}
			
			con.close();
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	 
}

package login;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.simple.JSONObject;

import dbconn.DBconn;

public class alarmDAO {
	private DBconn db;
	
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
	public alarmDAO() {
		db = new DBconn();
	}
	
	public JSONObject getAlarm() {
		JSONObject res = new JSONObject();
		
		try {
			String sql = "SELECT * FROM alarm";
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				res.put(rs.getString("al_type"),rs.getInt("cnt"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res.isEmpty() ? null : res;
	}
}

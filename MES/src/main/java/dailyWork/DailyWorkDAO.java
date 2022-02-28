package dailyWork;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONObject;

import dbconn.DBconn;

public class DailyWorkDAO {
	private DBconn db;

	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	
	public DailyWorkDAO() {
		db = new DBconn();
	}
	
	//조회
	public int getDailyWorkNext(){ //전체작업일보 열 수 조회
		int res = 0;
		
		try {
			String sql = "SELECT count(*) FROM (SELECT * FROM daily_work) dw ORDER BY regdate DESC";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				res = rs.getInt(1);
			}
			rs.close();
			stmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
	public List<DailyWorkDTO> getDailyWorkList(int pagenum){ //전체작업일보 조회
		List<DailyWorkDTO> list = new ArrayList<DailyWorkDTO>();
		
		try {
			String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS id, worker, dwtype, order_name, regdate, part_name, process, start_date, end_date, faulty, company, price, warehousing_exp_date, facilities, status, work_id "
					+ "FROM (SELECT @ROWNUM := 0) TMP, (SELECT * FROM daily_work) dw ORDER BY regdate DESC LIMIT ?, 10";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (pagenum-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DailyWorkDTO dto = new DailyWorkDTO();
				dto.setDwtype(rs.getString("dwtype"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setWorker(rs.getString("worker"));
				dto.setCompany(rs.getString("company"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setFacilities(rs.getString("facilities"));
				dto.setFaulty(rs.getString("faulty"));
				dto.setOrder_name(rs.getString("order_name"));
				dto.setPart_name(rs.getString("part_name"));
				dto.setPrice(rs.getInt("price"));
				dto.setProcess(rs.getString("process"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setStatus(rs.getString("status"));
				dto.setWarehousing_exp_date(rs.getString("warehousing_exp_date"));
				dto.setWork_id(rs.getInt("work_id"));
				
				list.add(dto);
			}
			rs.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return list.isEmpty() ? null : list;
	}
	
	public int getDailyWorkListSearchNext(String condition){ //검색한 전체작업일보의 열 수를 가져옴(page를 위함)
		int res = -1;
		
		try {
			String sql = "SELECT count(*) FROM (SELECT @ROWNUM := 0) TMP, (SELECT * FROM daily_work) dw "+ condition + " ORDER BY regdate DESC";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				res = rs.getInt("count(*)");
			}
			rs.close();
			stmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return res;
	}
	
	public List<DailyWorkDTO> getDailyWorkListSearch(int pagenum, String condition){ //검색한 전체작업일보 조회
		List<DailyWorkDTO> list = new ArrayList<DailyWorkDTO>();
		
		try {
			String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS id, worker, dwtype, order_name, regdate, part_name, process, start_date, end_date, faulty, company, price, warehousing_exp_date, facilities, status, work_id "
					+ "FROM (SELECT @ROWNUM := 0) TMP, (SELECT * FROM daily_work) dw "+ condition + " ORDER BY regdate DESC LIMIT ?, 10";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (pagenum-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DailyWorkDTO dto = new DailyWorkDTO();
				dto.setDwtype(rs.getString("dwtype"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setWorker(rs.getString("worker"));
				dto.setCompany(rs.getString("company"));
				dto.setEnd_date(rs.getString("end_date"));
				dto.setFacilities(rs.getString("facilities"));
				dto.setFaulty(rs.getString("faulty"));
				dto.setOrder_name(rs.getString("order_name"));
				dto.setPart_name(rs.getString("part_name"));
				dto.setPrice(rs.getInt("price"));
				dto.setProcess(rs.getString("process"));
				dto.setStart_date(rs.getString("start_date"));
				dto.setStatus(rs.getString("status"));
				dto.setWarehousing_exp_date(rs.getString("warehousing_exp_date"));
				dto.setWork_id(rs.getInt("work_id"));
				
				list.add(dto);
			}
			rs.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return list.isEmpty() ? null : list;
	}
	
	public String getfdate() { //등록된 작업일보의 첫 날짜를 가져옴(검색 시 사용)
		String res = null;
		
		try {
			String sql = "SELECT regdate FROM (SELECT * FROM daily_work) dw order by regdate";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				res = rs.getString(1);
			}
			
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		if(res != null) {
			String y = res.substring(2,4);
			String m = res.substring(5,7);
			String d = res.substring(8,10);
			res = y.concat("/" + m + "/" + d);
		}else {
			Date d = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yy/mm/dd");
			res = format.format(d);
		}
		
		return res;
	}
	
	public JSONObject getMyWorkInfo(String workid) { //나의 작업일보 정보를 불러옴
		JSONObject result = new JSONObject();
		
		try {
			String sql = "SELECT client, dobun, core, work_time, real_processing_time, quantity, "
					+ "no_men_processing_time, un_processing_time, total_work_time, "
					+ "total_processing_time FROM my_work WHERE work_id = " + workid;
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				result.put("client", rs.getString("client"));
				result.put("dobun", rs.getString("dobun"));
				result.put("core", rs.getString("core"));
				result.put("work_time", rs.getInt("work_time"));
				result.put("real_processing_time", rs.getInt("real_processing_time"));
				result.put("quantity", rs.getInt("quantity"));
				result.put("no_men_processing_time", rs.getInt("no_men_processing_time"));
				result.put("un_processing_time", rs.getInt("un_processing_time"));
				result.put("total_work_time", rs.getInt("total_work_time"));
				result.put("total_processing_time", rs.getInt("total_processing_time"));
			}
			
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return result.isEmpty() ? null : result;
	}
}

package dailyWork;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
	public List<DailyWorkDTO> getDailyWorkList(int pagenum){ //전체작업일보 조회
		List<DailyWorkDTO> list = new ArrayList<DailyWorkDTO>();
		
		try {
			String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS id, worker, dwtype, order_name, regdate, part_name, process, start_date, end_date, faulty, company, price, warehousing_exp_date, facilities, status "
					+ "FROM (SELECT @ROWNUM := 0) TMP, (SELECT * FROM daily_work) dw LIMIT ?, 10";
			
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
			String sql = "SELECT count(*) FROM (SELECT @ROWNUM := 0) TMP, (SELECT * FROM daily_work) dw "+ condition +" LIMIT ?, 10";
			
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
			String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS id, worker, dwtype, order_name, regdate, part_name, process, start_date, end_date, faulty, company, price, warehousing_exp_date, facilities, status "
					+ "FROM (SELECT @ROWNUM := 0) TMP, (SELECT * FROM daily_work) dw "+ condition + " LIMIT ?, 10";
			
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
	
	//수정
	//삭제
}

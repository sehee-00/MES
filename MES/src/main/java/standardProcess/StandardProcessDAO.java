package standardProcess;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;

import dbconn.DBconn;
import standardProcess.*;

public class StandardProcessDAO {
	private DBconn db;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	
	public StandardProcessDAO() {
		db = new DBconn();
	}
	
	//메뉴용 단순 조회
	public List<String> getProcessNames(){ //공정명 드롭박스 메뉴
		List<String> list = new ArrayList<String>();
		
		try {
			String sql = "SELECT process_name FROM process";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list.isEmpty() ? null : list;
	}
	
	public List<String> getFacilitiesNames(){ //설비명 드롭박스 메뉴
		List<String> list = new ArrayList<String>();
		
		try {
			String sql = "SELECT facilities_name FROM facilities";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list.isEmpty() ? null : list;
	}
	
	//사용자 불러오기
	public List<String> getUserID(){
		List<String> list = new ArrayList<String>();
		
		try {
			String sql = "SELECT user_id FROM mes.user";
			
			con = db.getCon();
			stmt=con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
			rs.close();
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list.isEmpty() ? null : list;
	}
	
	//조회
	public List<StandardProcessPDTO> getTopStandardProcessProcesses() { //최상위 공정 조회
		List<StandardProcessPDTO> list = new ArrayList<StandardProcessPDTO>();
		
		try {
			String sql = "SELECT * FROM mes.process WHERE process_name NOT IN (SELECT sub_proc FROM process_multi)";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				StandardProcessPDTO dto = new StandardProcessPDTO();
				dto.setProcess_name(rs.getString("process_name"));
				dto.setType(rs.getString("type"));
				dto.setPay(rs.getInt("pay"));
				dto.setLoad_factor(rs.getInt("load_factor"));
				dto.setUsing(rs.getBoolean("using"));
				dto.setLowerlevel(rs.getBoolean("lowerlevel"));
				dto.setProcess_manager(rs.getString("process_manager"));
				
				list.add(dto);
			}
			
			rs.close();
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list.isEmpty() ? null : list;
	}
	
	public List<StandardProcessPDTO> getLowerStandardProcessProcesses(String upperlevel){ //하위 레벨 공정 조회
		List<StandardProcessPDTO> list = new ArrayList<StandardProcessPDTO>();
		
		try {
			String sql = "SELECT * FROM mes.process WHERE process_name IN (SELECT sub_proc FROM mes.process_multi WHERE proc_name = ? AND sortation = \"p\")";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upperlevel);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StandardProcessPDTO dto = new StandardProcessPDTO();
				dto.setProcess_name(rs.getString("process_name"));
				dto.setType(rs.getString("type"));
				dto.setPay(rs.getInt("pay"));
				dto.setLoad_factor(rs.getInt("load_factor"));
				dto.setUsing(rs.getBoolean("using"));
				dto.setLowerlevel(rs.getBoolean("lowerlevel"));
				dto.setProcess_manager(rs.getString("process_manager"));
				
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
	
	public List<StandardProcessFDTO> getLowerStandardProcessFacilities(String upperlevel){ //하위 레벨 설비 조회
		List<StandardProcessFDTO> list = new ArrayList<StandardProcessFDTO>();
		
		try {
			String sql = "SELECT facilities_name, facilities.using FROM mes.facilities WHERE facilities_name IN (SELECT sub_proc FROM mes.process_multi WHERE proc_name = ? AND sortation = \"f\");";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upperlevel);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StandardProcessFDTO dto = new StandardProcessFDTO();
				dto.setFacility_name(rs.getString("facilities_name"));
				dto.setUsing(rs.getString("using"));
				
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
	
	public JSONObject getWorkTime(String process_name) { //공정의 표준 작업 시간 조회
		JSONObject result = new JSONObject();
		
		try {
			String sql = "select * from process_time where p_name=?";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, process_name);
			rs = pstmt.executeQuery();
			
			int index = 0;
			
			while(rs.next()) {
				JSONObject wt = new JSONObject();
				
				wt.put("wtstart", rs.getString("work_start"));
				wt.put("wtend", rs.getString("work_end"));
				
				result.put(index, wt);
				
				index += 1;
			}
			
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return result.isEmpty() ? null : result;
	}
	
	//입력, 수정
	public int insertProcessMulti(StandardProcessPMDTO dto) { //process_multi table insert (상위-하위 연결 관계 설정(데이터 입력))
		int res = 0;
		try {
			String sql = "insert into process_multi values(?, ?, ?)";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getProc_name());
			pstmt.setString(2, dto.getSortation());
			pstmt.setString(3, dto.getSub_proc());
			
			res = pstmt.executeUpdate();
			
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		return res;
	}
	
	public int insertProcess(StandardProcessPDTO dto) { //process table insert(공정 등록)
		int res = 0;
		try {
			String sql = "insert into mes.process(process_name, mes.process.type, pay, load_factor, mes.process.using) values(?, ?, ?, ?, ?)";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getProcess_name());
			pstmt.setString(2, "공정");
			pstmt.setInt(3, dto.getPay());
			pstmt.setInt(4, dto.getLoad_factor());
			pstmt.setBoolean(5, dto.getUsing());
			
			res = pstmt.executeUpdate();
			
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
	public int insertProcessManager(String process_name, String proc_manager) { //update process_manager at process(공정의 담당자 수정(등록))
		int res = 0;
		
		try {
			String sql = "UPDATE mes.process SET process_manager = ? WHERE process_name = ?";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, proc_manager);
			pstmt.setString(2, process_name);
			
			res = pstmt.executeUpdate();
			
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
	public int insertWorkTime(String p_name, String[] wt) { //insert process_time table(표준 작업 시간 등록 및 수정)
		int res = 0;
		
		if(wt.length % 2 != 0) {
			return 0;
		}
		
		try {
			String sql = "delete from process_time where p_name=?";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_name);
			res = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		for(int i = 0; i<wt.length; i +=2) {
			try {
				String sql = "insert into process_time values(?,?,?)";
				con = db.getCon();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, p_name);
				pstmt.setString(2, wt[i]);
				pstmt.setString(3, wt[i+1]);
				
				res = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				db.close();
			}
		}
		
		return res;
	}
	
	//삭제
	public int deleteProcessMulti(String proc_name, String sub_proc) { //process_multi table delete(상위-하위 연결 끊기(데이터 삭제))
		int res = 0;
		try {
			String sql = "delete from process_multi where proc_name=? and sub_proc=?";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, proc_name);
			pstmt.setString(2, sub_proc);
			res = pstmt.executeUpdate();

			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
	public int deleteProcess(String process_name) { //공정 삭제
		int res = 0;
		String sql = "";
		try {
			List<String> sub_proclist = new ArrayList<String>();
			sql = "SELECT sub_proc FROM process_multi WHERE proc_name=?";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, process_name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sub_proclist.add(rs.getString("sub_proc"));
			}
			
			rs.close();
			pstmt.close();
			
			for(String sproc:sub_proclist) {
				deleteProcess(sproc);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		try {
			sql = "delete from process where process_name=?";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, process_name);
			res = pstmt.executeUpdate();
			
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
	public void updatelowerlevelafterdelete() { //하위 공정 혹은 설비 삭제 후 상위 공정의 하위 공정 혹은 설비가 있는지 여부에 대한 데이터 설정
		try {
			String sql = "UPDATE mes.process SET lowerlevel = 0 WHERE process_name NOT IN (SELECT proc_name FROM mes.process_multi GROUP BY proc_name)";
			con = db.getCon();
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
	}
}

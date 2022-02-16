package userMenu;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dbconn.DBconn;

public class UserMenuDAO {
private DBconn db;
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	
	public UserMenuDAO(){
		db = new DBconn();
	}
	
	//조회
	public int getUserNext() { //paging을 위해 user 열 수 가져옴
		int res = -1;
		
		try {
			String sql = "SELECT count(*) as rownum from user";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				res = rs.getInt("rownum") + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
	public List<String[]> getUsers(int pagenum){ //user id와 name을 가져옴
		List<String[]> list = new ArrayList<String[]>();
		
		try {
			String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS id, user_id, user_name FROM mes.user, (SELECT @ROWNUM := 0) TMP LIMIT ?, 10";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (pagenum-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String[] user = {rs.getString("user_id"), rs.getString("user_name")};
				list.add(user);
			}
			
			pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list.isEmpty() ? null : list;
	}
	
	public int getUserNext(String condition) { //paging을 위해 검색한 user 열 수 가져옴
		int res = -1;
		
		try {
			String sql = "SELECT count(*) as rownum from user " + condition;
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				res = rs.getInt("rownum") + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
	public List<String[]> getSearchUsers(int pagenum, String condition){ //검색한 user의 id와 name을 가져옴
		List<String[]> list = new ArrayList<String[]>();
		
		try {
			String sql = "SELECT @ROWNUM := @ROWNUM + 1 AS id, user_id, user_name FROM mes.user, (SELECT @ROWNUM := 0) TMP " + condition + " LIMIT ?, 10";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (pagenum-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String[] user = {rs.getString("user_id"), rs.getString("user_name")};
				list.add(user);
			}
			
			pstmt.close();
			rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list.isEmpty() ? null : list;
	}
	
	public HashMap<String,String[]> getAllMenu() { //모든 메뉴 조회
		HashMap<String, String[]> hash = new HashMap<String, String[]>();
		
		String[] sales = {"견적서 관리","수주 관리"};
		hash.put("영업 관리", sales);
		
		String[] prod = {"생산 진행 관리","진척 현황"};
		hash.put("생산 관리", prod);
		
		String[] work = {"전체작업일보","나의작업일보","외주작업일보","불량 관리","게시판"};
		hash.put("작업 관리", work);
		
		String[] material_prod = {"부품 관리","자재 관리","자재 현황 조회"};
		hash.put("자재 제품 관리", material_prod);
		
		String[] order_warehousing = {"발주 관리","외주 관리","입출고 관리"};
		hash.put("발주입고 관리", order_warehousing);
		
		String[] dashboard = {"작업자별 실적 현황","수주별 작업공수표","계획대비 실적원가분석", "불량현황","PQCD 현황","설비 가동 현황","외주 비용 현황","소모품 현황"};
		hash.put("Dashboard", dashboard);
		
		String[] info_manage = {"공통코드 관리","업체 관리","표준공정 관리","설비 관리"};
		hash.put("기준정보 관리", info_manage);
		
		String[] admin = {"사용자 관리","사용자 메뉴 관리"};
		hash.put("Admin", admin);
		
		return hash.isEmpty() ? null : hash;
	}
	
	public HashMap<String,String[]> getUserMenu(String id){ //선택한 사용자의 메뉴를 가져옴
		HashMap<String, String[]> hash = new HashMap<String, String[]>();
		
		try {
			String sql = "SELECT * FROM user_menu WHERE user_id=?";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("sales") != null) {
					String[] menus = rs.getString("sales").split(",");
					hash.put("영업 관리", menus);
				}
				if(rs.getString("prod") != null) {
					String[] menus = rs.getString("prod").split(",");
					hash.put("생산 관리", menus);
				}
				if(rs.getString("work") != null) {
					String[] menus = rs.getString("work").split(",");
					hash.put("작업 관리", menus);
				}
				if(rs.getString("material_prod") != null) {
					String[] menus = rs.getString("material_prod").split(",");
					hash.put("자재 제품 관리", menus);
				}
				if(rs.getString("order_warehousing") != null) {
					String[] menus = rs.getString("order_warehousing").split(",");
					hash.put("발주입고 관리", menus);
				}
				if(rs.getString("dashboard") != null) {
					String[] menus = rs.getString("dashboard").split(",");
					hash.put("Dashboard", menus);
				}
				if(rs.getString("info_manage") != null) {
					String[] menus = rs.getString("info_manage").split(",");
					hash.put("기준정보 관리", menus);
				}
				if(rs.getString("admin") != null) {
					String[] menus = rs.getString("admin").split(",");
					hash.put("Admin", menus);
				}
			}
			
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return hash.isEmpty() ? null : hash;
	}
	
	//수정
	public int updateUserMenu(UserMenuDTO dto) {
		int res = 0;
		
		try {
			String sql = "UPDATE user_menu SET sales=?, prod=?, work=?, material_prod=?, order_warehousing=?, dashboard=?, info_manage=?, admin=? WHERE user_id=?";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			
			if(dto.getSales() == null) {
				pstmt.setNull(1, Types.VARCHAR);
			}else {
				pstmt.setString(1, dto.getSales());
			}
			
			if(dto.getProd() == null) {
				pstmt.setNull(2, Types.VARCHAR);
			}else {
				pstmt.setString(2, dto.getProd());
			}
			
			if(dto.getWork() == null) {
				pstmt.setNull(3, Types.VARCHAR);
			}else {
				pstmt.setString(3, dto.getWork());
			}
			
			if(dto.getMaterial_prod() == null) {
				pstmt.setNull(4, Types.VARCHAR);
			}else {
				pstmt.setString(4, dto.getMaterial_prod());
			}
			
			if(dto.getOrder_warehousing() == null) {
				pstmt.setNull(5, Types.VARCHAR);
			}else {
				pstmt.setString(5, dto.getOrder_warehousing());
			}
			
			if(dto.getDashboard() == null) {
				pstmt.setNull(6, Types.VARCHAR);
			}else {
				pstmt.setString(6, dto.getDashboard());
			}
			
			if(dto.getInfo_manage() == null) {
				pstmt.setNull(7, Types.VARCHAR);
			}else {
				pstmt.setString(7, dto.getInfo_manage());
			}
			
			if(dto.getAdmin() == null) {
				pstmt.setNull(8, Types.VARCHAR);
			}else {
				pstmt.setString(8, dto.getAdmin());
			}
			
			pstmt.setString(9, dto.getUser_id());
			
			res = pstmt.executeUpdate();
			
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
}

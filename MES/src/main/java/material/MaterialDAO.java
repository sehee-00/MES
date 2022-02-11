package material;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBconn;
import material.MaterialDTO;

public class MaterialDAO {
	private DBconn db;
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;

	public MaterialDAO() {
		db = new DBconn();
	}
	
	public int getNext() {
		String sql = "select count(*) from materials";
		int res = -1;
		
		try {
			con = db.getCon();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				res = rs.getInt(1) + 1;
			}
			else {
				res = 1;
			}
			
			rs.close();
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			db.close();
		}
		
		return res;
	}
	
	public int getNext(String condition) {
		String sql = "select count(*) from materials" + condition;
		int res = -1;
		
		try {
			con = db.getCon();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				res = rs.getInt(1) + 1;
			}
			else {
				res = 1;
			}
			
			rs.close();
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			db.close();
		}
		
		return res;
	}
	
	public List<MaterialDTO> getList(int pagenum){
		List<MaterialDTO> list = new ArrayList<MaterialDTO>();
		
		try {
			String sql = "SELECT * FROM materials WHERE materials_id<? ORDER BY materials_id DESC LIMIT 10";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pagenum-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MaterialDTO m = new MaterialDTO();
				
				m.setMaterials_id(rs.getInt("materials_id"));
				m.setMaterials_name(rs.getString("materials_name"));
				m.setMaterials_proc(rs.getString("materials_proc"));
				m.setMaterials_type(rs.getString("materials_type"));
				m.setSafety_stock(rs.getInt("safety_stock"));
				m.setStock(rs.getInt("stock"));
				m.setUnit_price(rs.getInt("unit_price"));
				
				list.add(m);
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
	
	public List<MaterialDTO> getList2(int pagenum, String condition){
		List<MaterialDTO> list = new ArrayList<MaterialDTO>();
		int nextnum = -1;
		
		String sql = "SELECT * FROM materials" + condition + " and materials_id<? ORDER BY materials_id DESC LIMIT 10";
		String sql2 = "SELECT materials_id from materials" + condition + " order by materials_id desc";

		try {
			con = db.getCon();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql2);
			if(rs.next()) {
				nextnum = rs.getInt(1) + 1;
			}
			else {
				nextnum = 1;
			}
			
			rs.close();
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		try {			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nextnum-(pagenum-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				MaterialDTO m = new MaterialDTO();
				
				m.setMaterials_id(rs.getInt("materials_id"));
				m.setMaterials_name(rs.getString("materials_name"));
				m.setMaterials_proc(rs.getString("materials_proc"));
				m.setMaterials_type(rs.getString("materials_type"));
				m.setSafety_stock(rs.getInt("safety_stock"));
				m.setStock(rs.getInt("stock"));
				m.setUnit_price(rs.getInt("unit_price"));
				
				list.add(m);
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
	
	public List<String> getMtypeList(){
		List<String> list = new ArrayList<String>();
		
		try {
			String sql = "SELECT sub_code FROM mes.code_sub WHERE main_code=\'소재구분\'";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(rs.getString("sub_code"));
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
	
	public List<String> getMprocList(){
		List<String> list = new ArrayList<String>();
		
		try {
			String sql = "select distinct process_name from mes.process";
			
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(rs.getString("process_name"));
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
	
	public int insertMaterial(MaterialDTO dto) {
		
		int result = 0;
		
		try {
			String sql = "insert into materials values(?,?,?,?,?,?,?)";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getMaterials_id());
			pstmt.setString(2, dto.getMaterials_name());
			pstmt.setInt(3, dto.getUnit_price());
			pstmt.setString(4, dto.getMaterials_type());
			pstmt.setString(5, dto.getMaterials_proc());
			pstmt.setInt(6, dto.getStock());
			pstmt.setInt(7, dto.getSafety_stock());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		if(result == 0) {
			try {
				String sql = "update materials set materials_name = ?, unit_price = ?, materials_type = ?, materials_proc = ?,"
						+ " stock = ?, safety_stock = ? where materials_id = ?";
				con = db.getCon();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getMaterials_name());
				pstmt.setInt(2, dto.getUnit_price());
				pstmt.setString(3, dto.getMaterials_type());
				pstmt.setString(4, dto.getMaterials_proc());
				pstmt.setInt(5, dto.getStock());
				pstmt.setInt(6, dto.getSafety_stock());
				pstmt.setInt(7, dto.getMaterials_id());
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				db.close();
			}
		}
		
		return result;
	}
	
	public int deleteMaterial(String bn) {
		int result = 0;
		
		try {
			String sql = "delete from materials where materials_id = " + bn;
			con = db.getCon();
			stmt = con.createStatement();
			
			result = stmt.executeUpdate(sql);
			
			sql = "{CALL decid("+ bn + ", \'mes.materials\', \'materials_id\') }";
			cstmt = con.prepareCall(sql);
			cstmt.execute();
			
			stmt.close();
			cstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return result;
	}
}

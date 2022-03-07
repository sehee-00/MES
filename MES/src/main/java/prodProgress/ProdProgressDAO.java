package prodProgress;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBconn;

public class ProdProgressDAO {
	private DBconn db;
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	
	public ProdProgressDAO() {
		db = new DBconn();
	}
	
	public List<String> getItemNO(){ //Order(수주) Table의 금형번호를 들고옴(콤보박스 용)
		List<String> list = new ArrayList<String>();
		
		try {
			String sql = "SELECT item_no FROM mes.order";
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(rs.getString("item_no"));
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
	
	public List<String> getProcess(){ //process(표준공정) Table의 공정명을 가져옴
		List<String> list = new ArrayList<String>();
		
		try {
			String sql = "SELECT process_name FROM mes.process";
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
	
	public List<OrderPartsDTO> getOrderParts(String itemno){ //선택한 수주의 부품 리스트를 가져옴
		List<OrderPartsDTO> list = new ArrayList<OrderPartsDTO>();
		
		try {
			String sql = "SELECT * FROM mes.parts_by_order WHERE mes.parts_by_order.order=?";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, itemno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderPartsDTO dto = new OrderPartsDTO();
				dto.setPbo_id(rs.getInt("pbo_id"));
				dto.setOrder(rs.getString("order"));
				dto.setPart(rs.getString("part"));
				dto.setQuantity(rs.getInt("quantity"));
				dto.setOrder_status(rs.getString("order_status"));
				dto.setLayer(rs.getString("layer"));
				
				list.add(dto);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list.isEmpty() ? null : list;
	}
	
	public ProdProgressOrderDTO getOrderInfo(String itemno) { //선택한 수주 정보를 가져옴
		ProdProgressOrderDTO result = null;
		
		try {
			String sql = "SELECT * FROM mes.order WHERE item_no=?";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, itemno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new ProdProgressOrderDTO();
				result.setItem_no(rs.getString("item_no"));
				result.setOrder_com_id(rs.getString("order_com_id"));
				result.setOrder_date(rs.getString("order_date"));
				result.setPart_status(rs.getString("part_status"));
				result.setCar_name(rs.getString("car_name"));
				result.setOrder_price(rs.getInt("order_price"));
				result.setDel_date(rs.getString("del_date"));
				result.setDue_date(rs.getString("due_date"));
				result.setProc_end_date(rs.getString("proc_end_date"));
				result.setOrder_note(rs.getString("order_note"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return result;
	}
}

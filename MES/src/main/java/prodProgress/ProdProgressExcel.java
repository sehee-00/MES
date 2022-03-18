package prodProgress;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.InetAddress;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import dbconn.DBconn;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;

public class ProdProgressExcel {
	
	private DBconn db;
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	
	public ProdProgressExcel() {
		db = new DBconn();
	}
	
	public XSSFWorkbook writeExcel(String realpath, String ordername, String partname) {
		File file = null;
		FileOutputStream fos= null;
		XSSFWorkbook workbook = null;
		
		int quantity = getQuantity(ordername, partname);
		String[] orderi = getComAndCar(ordername);
		String date = getCompDate(ordername, partname);
		List<String[]> pclist = getProcessInfo(ordername, partname);
		List<String[]> ftlist = getFaultyInfo(ordername, partname);
		
		try {
			String filepath = realpath + "\\작업공정표.xlsx";
			
			FileInputStream fileinput = new FileInputStream(filepath);
			workbook = new XSSFWorkbook(fileinput);
			XSSFRow xssfRow = null;
			XSSFCell xssfCell = null;
			
			XSSFSheet sheet = workbook.getSheetAt(0);
			
			xssfRow = sheet.getRow(5);
			xssfCell = xssfRow.getCell((short)2);
			xssfCell.setCellValue(ordername);
			
			xssfRow = sheet.getRow(5);
			xssfCell = xssfRow.getCell((short)7);
			xssfCell.setCellValue(partname);
			
			xssfRow = sheet.getRow(6);
			xssfCell = xssfRow.getCell((short)2);
			xssfCell.setCellValue(orderi[0]);
			
			xssfRow = sheet.getRow(6);
			xssfCell = xssfRow.getCell((short)7);
			xssfCell.setCellValue(orderi[1]);
			
			xssfRow = sheet.getRow(7);
			xssfCell = xssfRow.getCell((short)2);
			xssfCell.setCellValue(quantity);
			
			xssfRow = sheet.getRow(7);
			xssfCell = xssfRow.getCell((short)7);
			xssfCell.setCellValue(date);
			
			//공정
			int rowNo = 10;
			
			for(String[] pc : pclist) {
				xssfRow = sheet.getRow(rowNo);
				xssfCell = xssfRow.getCell((short)1);
				xssfCell.setCellValue(pc[0]);
				
				xssfCell = xssfRow.getCell((short)4);
				xssfCell.setCellValue(0);

				xssfCell = xssfRow.getCell((short)5);
				xssfCell.setCellValue(pc[1]);
				
				xssfCell = xssfRow.getCell((short)7);
				xssfCell.setCellValue(pc[2]);
				
				rowNo += 1;
			}
			
			//불량
			rowNo = 28;
			
			for(String[] ft : ftlist) {
				xssfRow = sheet.getRow(rowNo);
				xssfCell = xssfRow.getCell((short)1);
				xssfCell.setCellValue(ft[0]);
				
				xssfCell = xssfRow.getCell((short)4);
				xssfCell.setCellValue(0);

				xssfCell = xssfRow.getCell((short)5);
				xssfCell.setCellValue(ft[1]);
				
				xssfCell = xssfRow.getCell((short)7);
				xssfCell.setCellValue(ft[2]);
				
				rowNo += 1;
			}

			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return workbook;
	}
	
	public int getQuantity(String ordername, String partname){
		int quantity = 0;
		
		try {
			String sql = "SELECT * FROM mes.parts_by_order WHERE parts_by_order.order = ? AND part = ? AND order_status=\'내부\'";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordername);
			pstmt.setString(2, partname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				quantity = rs.getInt("quantity");
			}
			
			rs.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return quantity;
	}
	
	public String[] getComAndCar(String ordername) {
		String[] res = null;
		
		try {
			String sql = "SELECT order_com_id, car_name FROM mes.order WHERE item_no = ?";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordername);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = new String[2];
				res[0] = rs.getString("order_com_id");
				res[1] = rs.getString("car_name");
			}
			
			rs.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return res;
	}
	
	public String getCompDate(String ordername, String partname) {
		String date = null;
		
		try {
			String sql = "SELECT work_end FROM my_work "
					+ "WHERE order_name = ? AND part_name = ? "
					+ "AND work_start IS NOT NULL "
					+ "AND no_men_processing_time IS NOT NULL "
					+ "ORDER BY work_end";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, ordername);
			pstmt.setString(2, partname);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("work_end") != null) {
					if(rs.last()) {
						date = rs.getString("work_end");
					}
				}
			}
			
			rs.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return date;
	}
	
	public List<String[]> getProcessInfo(String ordername, String partname){
		List<String[]> list = new ArrayList<String[]>();
		
		try {
			String sql = "SELECT my_work.process, total_work_time, worker FROM my_work WHERE order_name = ? AND part_name = ?";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordername);
			pstmt.setString(2, partname);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String[] pc = {rs.getString("process"),Integer.toString(rs.getInt("total_work_time")), rs.getString("worker")};
				list.add(pc);
			}
			
			rs.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list;
	}
	
	public List<String[]> getFaultyInfo(String ordername, String partname){
		List<String[]> list = new ArrayList<String[]>();
		
		try {
			String sql = "SELECT my_work.process, total_work_time, worker FROM my_work WHERE order_name = ? AND part_name = ? AND faulty = \'Y\'";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordername);
			pstmt.setString(2, partname);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String[] ft = {rs.getString("process"),Integer.toString(rs.getInt("total_work_time")), rs.getString("worker")};
				list.add(ft);
			}
			
			rs.close();
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return list;
	}
	
	public void deletefile(String path) {
		File file = new File(path);
		if(file.exists()) {
			file.delete();
		}
	}
}

package defectivePerform;

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
import faulty.Faulty;
import faulty.Workday;

public class dPerformDAO {

	private DBconn db;
	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	private Connection con;
	
	public dPerformDAO() {
		DBconn();
	}
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://192.168.0.115:3306/mes?" + "useUnicode=true&characterEncoding=utf8"; 
	private String id = "Usera";
	private String pw = "1234";
	
	private void DBconn() {
		try {
			Class.forName(driver);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//불량 공정 비용의 공정 내용 가져오기
	public ArrayList<String> getProc(){
		ArrayList<String> list = new ArrayList<String>();
		String SQL="select process_name from process;";
		try {
			con = DriverManager.getConnection(url, id, pw);
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list.isEmpty() ? null : list;	//삼항 연산자 빈값이면 null 반환 빈값이 아니면 list 값 반환
	}
	
	// 불량비용 테이블 값 세팅
		 public ArrayList<String> getfCost(String y) {
			ArrayList<String> list = new ArrayList<String>();
			String SQL="SELECT sum(cost), MONTH(date_of_occurrence) as month from faulty "
					+ "where year(date_of_occurrence) = ? group by month order by month asc ;";
			try {
				con = DriverManager.getConnection(url, id, pw);
				PreparedStatement pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, y);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					list.add(rs.getString(1));
				}
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;	
			
		}
		 
	// 불량비용 합계 세팅
			 public ArrayList<String> getfCostSUM(String y) {
				ArrayList<String> list = new ArrayList<String>();
				String SQL="select sum(cost) from faulty where year(date_of_occurrence) = ?;";
				try {
					con = DriverManager.getConnection(url, id, pw);
					PreparedStatement pstmt = con.prepareStatement(SQL);
					pstmt.setString(1, y);
					rs=pstmt.executeQuery();
					while(rs.next()) {
						list.add(rs.getString(1));
					}
					rs.close();
					pstmt.close();
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				return list;	
				
			}
		 
		// 불량비용 월구하기
		 public ArrayList<String> getfmonth(String y) {
			ArrayList<String> list = new ArrayList<String>();
			String SQL="SELECT MONTH(date_of_occurrence) as month from faulty where year(date_of_occurrence) = ? "
					+ "group by month order by month asc ;";
			try {
				con = DriverManager.getConnection(url, id, pw);
				PreparedStatement pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, y);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					list.add(rs.getString(1));
				}
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;	
			
		}
		 
		 
		 
		 
		// 불량공정비용 합계 세팅
		 public ArrayList<String> getfpSUM(String y) {
			ArrayList<String> list = new ArrayList<String>();
			String SQL="select  sum(manufacturing_cost) as mcost from my_work, faulty "
					+ "where my_work.work_id = faulty.link_info and year(date_of_occurrence) = ? ;";
			try {
				con = DriverManager.getConnection(url, id, pw);
				PreparedStatement pstmt = con.prepareStatement(SQL);
				pstmt.setString(1, y);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					list.add(rs.getString(1));
				}
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;	
			
		}
	 
		 
		 
		// 불량 공정 비용 테이블 값 세팅
			
		public ArrayList<DefectivePerform> getfpCost(String y){
			ArrayList<DefectivePerform> list = new ArrayList<DefectivePerform>();
			
			try {
				String sql = "select  month(f.date_of_occurrence) as m , mw.process, sum(mw.manufacturing_cost) as mcost "
						+ "from faulty as f, my_work as mw "
						+ "where mw.work_id = f.link_info and year(date_of_occurrence) = ?"
						+ "group by m, mw.process "
						+ "order by mw.process, m;";
				
				con = DriverManager.getConnection(url, id, pw);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, y);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					DefectivePerform b = new DefectivePerform();
					
					b.setM(rs.getInt("m"));
					b.setMcost(rs.getInt("mcost"));
					b.setProcess(rs.getString("process"));

					list.add(b);
					
				}
				
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		// 불량 공정 비용 월별 합계

		public ArrayList<DefectivePerform> getmSum(String y){
			ArrayList<DefectivePerform> list = new ArrayList<DefectivePerform>();
			
			try {
				String sql = "select  month(f.date_of_occurrence) as m , mw.process, sum(mw.manufacturing_cost) as mcost "
						+ "from faulty as f, my_work as mw "
						+ "where mw.work_id = f.link_info and year(date_of_occurrence) = ? "
						+ "group by m "
						+ "order by m;";
				
				con = DriverManager.getConnection(url, id, pw);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, y);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					DefectivePerform b = new DefectivePerform();
					
					b.setM(rs.getInt("m"));
					b.setMcost(rs.getInt("mcost"));
					b.setProcess(rs.getString("process"));

					list.add(b);
					
				}
				
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
				
		// 불량 공정별 합계
		
		public ArrayList<DefectivePerform> getpCost(String y){
			ArrayList<DefectivePerform> list = new ArrayList<DefectivePerform>();
			
			try {
				String sql = "select p.process_name, sum(mw.manufacturing_cost) as mcost "
						+ "from faulty as f, my_work as mw, process as p "
						+ "where mw.work_id = f.link_info and p.process_name = mw.process "
						+ "and year(date_of_occurrence) = ? "
						+ "group by p.process_name "
						+ "order by p.process_name;";
				
				con = DriverManager.getConnection(url, id, pw);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, y);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					DefectivePerform b = new DefectivePerform();
					
					
					b.setMcost(rs.getInt("mcost"));
					b.setProcess(rs.getString("process_name"));

					list.add(b);
					
				}
				
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		//월별 불량/처리 건수 
		
		public List<DefectivePerform> getList(String y){
			
			List<DefectivePerform> list = new ArrayList<DefectivePerform>();
			
			for(int i=1; i<=12 ; i++) {
				DefectivePerform b = new DefectivePerform();
				b.setM(i);
				b.setNum(0);
				b.setSolution(0);
				list.add(b);
			}
			
			
			try {
				String sql = "select month(date_of_occurrence) as m, count(month(date_of_occurrence)) as o,\r\n"
						+ "	count(proc_date) as s from faulty where year(date_of_occurrence) = ? group by m order by m;";
				
				con = DriverManager.getConnection(url, id, pw);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, y);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					for(int i=0;i<12;i++) {
						if(list.get(i).getM() == rs.getInt("m")) {
							list.get(i).setNum(rs.getInt("o"));
							list.get(i).setSolution(rs.getInt("s"));
						}
					}
					
					
				}
				
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
	
		//유형별 불량 건수
		public List<DefectivePerform> getTList(String y){
			
			List<DefectivePerform> list = new ArrayList<DefectivePerform>();
			
			for(int i=1; i<=12 ; i++) {
				DefectivePerform b = new DefectivePerform();
				b.setM(i);
				b.setOm(0);	//수주
				b.setMm(0);	//자재입고
				b.setPm(0);	//공정
				list.add(b);
			}
			
			try {
				String sql = "select faulty_type, month(date_of_occurrence) as m, count(month(date_of_occurrence)) as num "
						+ "from faulty where year(date_of_occurrence) = ? group by faulty_type, m;";
				
				con = DriverManager.getConnection(url, id, pw);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, y);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					for(int i=0;i<12;i++) {
						if(list.get(i).getM() == rs.getInt("m")) {
							switch (rs.getString("faulty_type")) {
							case "수주": 
								list.get(i).setOm(rs.getInt("num"));
								break;
							case "자재 입고": 
								list.get(i).setMm(rs.getInt("num"));
								break;
							case "공정": 
								list.get(i).setPm(rs.getInt("num"));	
								break;
							}
							
						}
						
					}
					
					
				}
				
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return list;
		}
		
		
		
		// 불량연도 콤보박스 세팅
		 public ArrayList<String> getfdate() {
			ArrayList<String> list = new ArrayList<String>();
			String SQL="select year(date_of_occurrence) as y from faulty group by y;";
			try {
				con = DriverManager.getConnection(url, id, pw);
				PreparedStatement pstmt = con.prepareStatement(SQL);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					list.add(rs.getString(1));
				}
				rs.close();
				pstmt.close();
				con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list.isEmpty() ? null : list;	//삼항 연산자 빈값이면 null 반환 빈값이 아니면 list 값 반환
		}
		
}

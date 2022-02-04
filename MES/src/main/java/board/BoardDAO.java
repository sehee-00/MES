package board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dbconn.DBconn;

public class BoardDAO {
	private DBconn db;
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
	
	public BoardDAO(){
		db = new DBconn();
	}

	public String getfdate() {
		String sql = "select regdate from board order by regdate";
		String result = null;
		
		try {
			con = db.getCon();
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result = rs.getString(1);
			}
			else {
				result = "2022-01-01";
			}
			
			rs.close();
			stmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			db.close();
		}
		
		if(result != null) {
			String y = result.substring(2,4);
			String m = result.substring(5,7);
			String d = result.substring(8,10);
			result = y.concat("/" + m + "/" + d);
		}
		
		return result;
	}
	
	public int getNumNext() {
		String sql = "select board_num from board order by board_num desc";
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
	
	//다음 보드 번호 알아내기
	public int getNext() {
		String sql = "select board_id from board order by board_id desc";
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
	
	//검색결과 보드 총 수
	public int getSearchAmount(String condition) {
		String sql = "select count(*) as rownum from board" + condition;
		
		int nextnum = -1;
		
		try {
			con = db.getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				nextnum = rs.getInt("rownum");
			}
			
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		return nextnum;
	}
	
	//보드 기본 출력
	public List<BoardVO> getList(int pagenum){
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			String sql = "SELECT * FROM board WHERE board_id<? ORDER BY board_id DESC LIMIT 10";
			
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, getNext()-(pagenum-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardVO b = new BoardVO();
				
				b.setBoard_id(rs.getInt("board_id"));
				b.setBoard_num(rs.getInt("board_num"));
				b.setWriter(rs.getString("writer"));
				b.setRegdate(rs.getString("regdate"));
				
				String title = rs.getString("title");
				
				b.setTitle(title);
				b.setContents(rs.getString("contents"));
				list.add(b);
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
	
	//검색
	public List<BoardVO> getList2(int pagenum, String condition){
		List<BoardVO> list = new ArrayList<BoardVO>();
		int nextnum = -1;
		
		String sql = "select * from board" + condition + " and board_id<? order by board_id desc limit 10";
		String sql2 = "select board_id from board" + condition + " order by board_id desc";
		
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
		}finally{
			db.close();
		}
		
		try {
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nextnum-(pagenum-1)*10);
			rs = pstmt.executeQuery(); 
			
			while(rs.next()) {
				BoardVO b = new BoardVO();
				
				b.setBoard_id(rs.getInt("board_id"));
				b.setBoard_num(rs.getInt("board_num"));
				b.setWriter(rs.getString("writer"));
				b.setRegdate(rs.getString("regdate"));
				
				String title = rs.getString("title");
				
				b.setTitle(title);
				b.setContents(rs.getString("contents"));
				list.add(b);
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
	
	
	
	//보드 등록 및 수정
	public int insertBoard(BoardVO vo) {
		
		int result = 0;
		
		try {
			String sql = "insert into board values(?,?,?,?,?,?)";
			con = db.getCon();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, vo.getBoard_id());
			pstmt.setInt(2, vo.getBoard_num());
			pstmt.setString(3, vo.getRegdate());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getContents());
			pstmt.setString(6, vo.getWriter());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close();
		}
		
		if(result == 0) {
			try {
				String sql = "update board set board_num = ?, title = ?, contents = ?, regdate = ? where board_id = ?";
				con = db.getCon();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, vo.getBoard_num());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getContents());
				pstmt.setString(4, vo.getRegdate());
				pstmt.setInt(5, vo.getBoard_id());
				
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
	
	//보드 삭제
	public int deleteBoard(String bn) {
		int result = 0;
		
		try {
			String sql = "delete from board where board_id = " + bn;
			con = db.getCon();
			stmt = con.createStatement();
			
			result = stmt.executeUpdate(sql);
			
			sql = "{CALL decid("+ bn + ", \'mes.board\', \'board_id\') }";
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

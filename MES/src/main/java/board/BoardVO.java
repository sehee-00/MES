package board;

import java.util.Date;

public class BoardVO {
	//게시물 정보를 담을 틀
	
	private int board_id; //고유 pk인 id, 사용자에 보여지지 않음
	private int board_num; //게시물 번호
	private String writer; //작성자
	private String regdate; //등록일자
	private String title; //게시물 제목(이름)
	private String contents; //게시물 내용
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		if(regdate == null) {
			return null;
		}
		
		String rd = regdate.substring(0, 10);
		return rd;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	

}

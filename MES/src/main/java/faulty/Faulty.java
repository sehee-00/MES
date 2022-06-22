package faulty;


public class Faulty {

	private int faulty_no;		//불량번호
	private String link_info;	//링크정보
	private String faulty_type;	//불량유형
	private String cause_of_defect;	//불량원인
	private String date_of_occurrence;	//발생일자
	private int materials_cost;	//자재비용
	private int cost;		//비용
	private String faulty_title;	//불량제목
	private String faulty_content;	//불량내용
	private String solution;	//해결방안
	private String user_id;		//사용자아이디
	private String proc_date;	//공정날짜
	private String part_name;	//부품명
	private String process;		//공정명
	private String order_name;	//수주

	

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public int getFaulty_no() {
		return faulty_no;
	}
	
	public void setFaulty_no(int faulty_no) {
		this.faulty_no = faulty_no;
	}
	
	public String getLink_info() {
		return link_info;
	}
	
	public void setLink_info(String link_info) {
		this.link_info = link_info;
	}
	
	public String getFaulty_type() {
		return faulty_type;
	}
	
	public void setFaulty_type(String faulty_type) {
		this.faulty_type = faulty_type;
	}
	
	public String getCause_of_defect() {
		return cause_of_defect;
	}
	
	public void setCause_of_defect(String cause_of_defect) {
		this.cause_of_defect = cause_of_defect;
	}
	
	public String getDate_of_occurrence() {
		String gdoo = date_of_occurrence;
		if(gdoo != null) {
			gdoo = date_of_occurrence.substring(0,10);
		}
		
		return gdoo;
	}
	
	public void setDate_of_occurrence(String date_of_occurrence) {
		this.date_of_occurrence = date_of_occurrence;
	}
	
	public int getMaterials_cost() {
		return materials_cost;
	}
	
	public void setMaterials_cost(int materials_cost) {
		this.materials_cost = materials_cost;
	}
	
	public int getCost() {
		return cost;
	}
	
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	public String getFaulty_title() {
		return faulty_title;
	}
	
	public void setFaulty_title(String faulty_title) {
		this.faulty_title = faulty_title;
	}
	
	public String getFaulty_content() {
		return faulty_content;
	}
	
	public void setFaulty_content(String faulty_content) {
		this.faulty_content = faulty_content;
	}
	
	public String getSolution() {
		return solution;
	}
	
	public void setSolution(String solution) {
		this.solution = solution;
	}
	
	public String getUser_id() {
		return user_id;
	}
	
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getProc_date() {
		String gpd = proc_date;
		
		if(proc_date != null)
			gpd = proc_date.substring(0,10);
		
		return gpd;
	}
	
	public void setProc_date(String proc_date) {
		this.proc_date = proc_date;
	}

	public String getPart_name() {
		return part_name;
	}

	public void setPart_name(String part_name) {
		this.part_name = part_name;
	}

	public String getProcess() {
		return process;
	}

	public void setProcess(String process) {
		this.process = process;
	}
	

	
	
	
}

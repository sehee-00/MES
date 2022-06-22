package dailyWork;

//전체 작업일보 데이터 객체
public class DailyWorkDTO {
	private String worker; // 작업자
	private String dwtype; //유형
	private String order_name; //수주명
	private String regdate; //등록일자
	private String part_name; //부품명
	private String process; //공정
	private String start_date; //시작일
	private String end_date; //종료일
	private String faulty; //불량여부
	private String company; //외주사
	private int price; //금액
	private String warehousing_exp_date; //입고예정일
	private String facilities; //설비
	private String status; //상태
	private int work_id; //나의 작업일보 pk
	
	public String getWorker() {
		return worker;
	}
	public void setWorker(String worker) {
		this.worker = worker;
	}
	public String getDwtype() {
		return dwtype;
	}
	public void setDwtype(String dwtype) {
		this.dwtype = dwtype;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPart_name() {
		if(part_name == null) {
			return "";
		}else {
			if(part_name.equals("null")) {
				return "";
			}
		}
		
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
	public String getStart_date() {
		if(start_date == null) {
			return "";
		}else {
			if(start_date.equals("null")) {
				return "";
			}
		}
		
		if(dwtype.equals("외주")) {
			return start_date.substring(0,10);
		}
		
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		if(end_date == null) {
			return "";
		}else {
			if(end_date.equals("null")) {
				return "";
			}
		}
		
		if(dwtype.equals("외주")) {
			return end_date.substring(0,10);
		}
		
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getFaulty() {
		return faulty;
	}
	public void setFaulty(String faulty) {
		this.faulty = faulty;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getWarehousing_exp_date() {
		return warehousing_exp_date;
	}
	public void setWarehousing_exp_date(String warehousing_exp_date) {
		this.warehousing_exp_date = warehousing_exp_date;
	}
	public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getWork_id() {
		return work_id;
	}
	public void setWork_id(int work_id) {
		this.work_id = work_id;
	}
	
	
}

package faulty;

public class Workday {

	private int work_id;		//작업번호
	private String order_name;	//수주명
	private String part_name;	//부품명
	private String process;		//공정
	private String facilities;	//설비
	private String work_start;	//작업시작날짜
	private String work_end;	//작업종료날짜
	private String client;		//고객사
	private String worker;		//작업자
	private String pdate;		//납기예정일
	private int pay;		//임률
	private String remarks;		//비고
	
	
	public int getWork_id() {
		return work_id;
	}
	public void setWork_id(int work_id) {
		this.work_id = work_id;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
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
	public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public String getWork_start() {
		return work_start;
	}
	public void setWork_start(String work_start) {
		this.work_start = work_start;
	}
	public String getWork_end() {
		return work_end;
	}
	public void setWork_end(String work_end) {
		this.work_end = work_end;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public String getWorker() {
		return worker;
	}
	public void setWorker(String worker) {
		this.worker = worker;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}

package standardProcess;

public class StandardProcessPDTO {
	private String process_name; //공정명
	private String facilites_name; //설비명
	private String type; //유형
	private int pay; //임률
	private int load_factor; //부하율
	private boolean using; //사용유무
	private String[] process_manager; //공정담당자
	private String work_start; //시작시간
	private String work_end; //끝난시간
	private boolean lowerlevel; //하위레벨 유무
	
	
	public String getProcess_name() {
		return process_name;
	}
	public void setProcess_name(String process_name) {
		this.process_name = process_name;
	}
	public String getFacilites_name() {
		return facilites_name;
	}
	public void setFacilites_name(String facilites_name) {
		this.facilites_name = facilites_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getLoad_factor() {
		return load_factor;
	}
	public void setLoad_factor(int load_factor) {
		this.load_factor = load_factor;
	}
	public String isUsing() {
		if(using) {
			return "Y";
		}
		else {
			return "N";
		}
	}
	public boolean getUsing() {
		return using;
	}
	public void setUsing(boolean using) {
		this.using = using;
	}
	public String[] getProcess_manager() {
		return process_manager;
	}
	public void setProcess_manager(String[] process_manager) {
		this.process_manager = process_manager;
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
	public boolean isLowerlevel() {
		return lowerlevel;
	}
	public void setLowerlevel(boolean lowerlevel) {
		this.lowerlevel = lowerlevel;
	}
	
	
}

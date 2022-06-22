package standardProcess;

//공정과 공정 혹은 공정과 설비의 연결 관계에 대한 데이터 객체
public class StandardProcessPMDTO {
	private String proc_name; //상위 공정명
	private String sortation; //구분(P, F)
	private String sub_proc; //하위 공정/설비명
	
	public String getProc_name() {
		return proc_name;
	}
	public void setProc_name(String proc_name) {
		this.proc_name = proc_name;
	}
	public String getSortation() {
		return sortation;
	}
	public void setSortation(String sortation) {
		this.sortation = sortation;
	}
	public String getSub_proc() {
		return sub_proc;
	}
	public void setSub_proc(String sub_proc) {
		this.sub_proc = sub_proc;
	}
	
	

}

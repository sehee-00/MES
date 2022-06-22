package standardProcess;

//공정 속 설비 데이터 객체
public class StandardProcessFDTO {
	private String facility_name; //설비명
	private String using; //사용여부
	
	public String getFacility_name() {
		return facility_name;
	}
	public void setFacility_name(String facility_name) {
		this.facility_name = facility_name;
	}
	public String isUsing() {
		return using;
	}
	public void setUsing(String using) {
		this.using = using;
	}

	
}

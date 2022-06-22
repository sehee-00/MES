package defectivePerform;

public class DefectivePerform {

	private int m;		//날짜 '월'
	private String process;	//공정
	private int mcost;	//자재비용(manufacturing_cost)의 합계  
	private int num;	//월별 불량 건수
	private int solution;	//해결 방안
	private String ftype;	//불량 유형
	private int om;		//수주 갯수
	private int pm;		//자재입고 갯수
	private int mm;		//공정 갯수
	
	public int getOm() {
		return om;
	}
	public void setOm(int om) {
		this.om = om;
	}
	public int getPm() {
		return pm;
	}
	public void setPm(int pm) {
		this.pm = pm;
	}
	public int getMm() {
		return mm;
	}
	public void setMm(int mm) {
		this.mm = mm;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public int getSolution() {
		return solution;
	}
	public void setSolution(int solution) {
		this.solution = solution;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getM() {
		return m;
	}
	public void setM(int m) {
		this.m = m;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public int getMcost() {
		return mcost;
	}
	public void setMcost(int mcost) {
		this.mcost = mcost;
	}
	

}

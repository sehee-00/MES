package prodProgress;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;

//수주별 부품 세부 정보 데이터 객체
public class OrderPartDetailDTO {
	
	private String order; //수주명
	private String part; //부품명
	private int total_work_time = 0; //WT
	private int price = 0; //제조원가
	private int quantity = 0; //수량
	private String standard; //규격
	private String order_status; //발주여부
	private List<JSONObject> process = new ArrayList<JSONObject>(); //공정
	private String status_color = "background-color: rgb(70, 211, 191)"; //진행 상태 배경 색
	private String type; //유형
	
	
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getTotal_work_time() {
		return total_work_time;
	}
	public void setTotal_work_time(int total_work_time) {
		this.total_work_time = total_work_time;
	}
	public int getPrice() {
		return price;
	}
	public String getPrice_comma() {
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		
		String com_price=formatter.format(price);
		return com_price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public List<JSONObject> getProcess() {
		return process != null ? process : new ArrayList<JSONObject>();
	}
	public void addProcess(JSONObject process) {
		this.process.add(process);
	}
	public String getStatus_color() {
		return status_color;
	}
	public void setStatus_color(String status_color) {
		this.status_color = status_color;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	

}

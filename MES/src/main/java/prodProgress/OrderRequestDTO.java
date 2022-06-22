package prodProgress;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

//발주 요청 데이터 객체
public class OrderRequestDTO {
	private int porder_no; //발주 no
	private String order_name; //수주명
	private String part_name; //부품명
	private String type; //유형
	private int number_of_request; //발주 수량
	private String porder_company; //발주사
	private String exp_date; //입고예정일
	private String p_date; //발주일
	private int unit_price; //단가
	
	public OrderRequestDTO(int nextnum) {
		this.porder_no = nextnum;
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String dateToStr = dateFormat.format(date);
		this.p_date = dateToStr;
	}

	public int getPorder_no() {
		return porder_no;
	}
	public String p_date() {
		return p_date;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getNumber_of_request() {
		return number_of_request;
	}

	public void setNumber_of_request(int number_of_request) {
		this.number_of_request = number_of_request;
	}

	public String getPorder_company() {
		return porder_company;
	}

	public void setPorder_company(String porder_company) {
		this.porder_company = porder_company;
	}

	public String getExp_date() {
		return exp_date;
	}

	public void setExp_date(String exp_date) {
		this.exp_date = exp_date;
	}

	public int getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}
	
	
}

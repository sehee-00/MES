package prodProgress;

//수주별 부품 정보 데이터 객체
public class OrderPartsDTO {
	private int pbo_id; //수주별 부품 id
	private String order; //수주명
	private String part; //부품명
	private int quantity; //수량
	private String order_status; //발주여부
	private String layer; //layer
	
	public int getPbo_id() {
		return pbo_id;
	}
	public void setPbo_id(int pbo_id) {
		this.pbo_id = pbo_id;
	}
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getLayer() {
		return layer;
	}
	public void setLayer(String layer) {
		this.layer = layer;
	}
	
}

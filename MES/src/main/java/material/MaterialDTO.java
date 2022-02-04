package material;

public class MaterialDTO {
	private int materials_id;
	private String materials_name;
	private int unit_price;
	private String materials_type;
	private String materials_proc;
	private int stock;
	private int safety_stock;
	
	
	public int getMaterials_id() {
		return materials_id;
	}
	public void setMaterials_id(int materials_id) {
		this.materials_id = materials_id;
	}
	public String getMaterials_name() {
		return materials_name;
	}
	public void setMaterials_name(String materials_name) {
		this.materials_name = materials_name;
	}
	public int getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}
	public String getMaterials_type() {
		return materials_type;
	}
	public void setMaterials_type(String materials_type) {
		this.materials_type = materials_type;
	}
	public String getMaterials_proc() {
		return materials_proc;
	}
	public void setMaterials_proc(String materials_proc) {
		this.materials_proc = materials_proc;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getSafety_stock() {
		return safety_stock;
	}
	public void setSafety_stock(int safety_stock) {
		this.safety_stock = safety_stock;
	}
	
	
}

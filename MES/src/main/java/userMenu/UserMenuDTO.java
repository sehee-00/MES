package userMenu;

//사용자 메뉴 데이터 객체
public class UserMenuDTO {
	private String user_id; //사용자 id
	private String user_name; //사용자 이름
	private String sales; //영업 관리 메뉴
	private String prod; //생산 관리 메뉴
	private String work; //작업 관리 메뉴
	private String material_prod; //자재 제품 관리 메뉴
	private String order_warehousing; //발주입고 관리 메뉴
	private String dashboard; //dashboard 메뉴
	private String info_manage; //기준 정보 관리 메뉴
	private String admin; //사용자 관리 메뉴
	private String facilitiesmenu; //설비 관리 메뉴
	
	
	public String getFacilitiesmenu() {
		return facilitiesmenu;
	}
	public void setFacilitiesmenu(String facilitiesmenu) {
		this.facilitiesmenu = facilitiesmenu;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getProd() {
		return prod;
	}
	public void setProd(String prod) {
		this.prod = prod;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getMaterial_prod() {
		return material_prod;
	}
	public void setMaterial_prod(String material_prod) {
		this.material_prod = material_prod;
	}
	public String getOrder_warehousing() {
		return order_warehousing;
	}
	public void setOrder_warehousing(String order_warehousing) {
		this.order_warehousing = order_warehousing;
	}
	public String getDashboard() {
		return dashboard;
	}
	public void setDashboard(String dashboard) {
		this.dashboard = dashboard;
	}
	public String getInfo_manage() {
		return info_manage;
	}
	public void setInfo_manage(String info_manage) {
		this.info_manage = info_manage;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	

}

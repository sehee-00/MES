package ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.orderproc_cost;
import dbcon.ordercosts;
import dbcon.ordertooldb;

/**
 * Servlet implementation class ordertable
 */
public class ordertable extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String orderid = request.getParameter("orderid");
		response.getWriter().write("{");
		response.getWriter().write(getproc_cost(orderid)); 
		response.getWriter().write(getprocorder(orderid));
		response.getWriter().write(getcompanyorder(orderid));
		response.getWriter().write(getordertool(orderid));
		response.getWriter().write(getorderprice(orderid));
		response.getWriter().write("}");
	}
	
	
	public String getproc_cost(String order_name) {
		if(order_name == null) order_name = "";
		StringBuffer result = new StringBuffer("");
		result.append("\"proc_costresult\":[");
		dbcon db = new dbcon();
		Vector<orderproc_cost> v = db.proctable(order_name);
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getProc_name() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getTime() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getPay() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getTotalpay() + "\"}],");
		}
		result.append("],");
		return result.toString();
	}
	
	public String getprocorder(String order_name) {
		if(order_name == null) order_name = "";
		StringBuffer result = new StringBuffer("");
		result.append("\"procorderresult\":[");
		dbcon db = new dbcon();
		Vector<ordercosts> v = db.procordertable(order_name);
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getName() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getPay() + "\"}],");
		}
		result.append("],");
		return result.toString();
	}
	
	public String getcompanyorder(String order_name) {
		if(order_name == null) order_name = "";
		StringBuffer result = new StringBuffer("");
		result.append("\"companyorderresult\":[");
		dbcon db = new dbcon();
		Vector<ordercosts> v = db.companyordertable(order_name);
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getName() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getPay() + "\"}],");
		}
		result.append("],");
		return result.toString();
	}
	
	public String getordertool(String order_name) {
		if(order_name == null) order_name = "";
		StringBuffer result = new StringBuffer("");
		result.append("\"ordertoolresult\":[");
		dbcon db = new dbcon();
		Vector<ordertooldb> v = db.materialtable(order_name);
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getTool_name() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getPrice() + "\"}],");
		}
		result.append("],");
		return result.toString();
	}
	
	public String getorderprice(String order_name) {
		if(order_name == null) order_name = "";
		StringBuffer result = new StringBuffer("");
		dbcon db = new dbcon();
		String price = db.orderprice(order_name);
		result.append("\"orderpriceresult\":");
		result.append("{\"price\":\"" + price + "\"}");
		return result.toString();
	}
	
}

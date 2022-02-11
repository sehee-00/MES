package ajax;

import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.material_etdb;
import dbcon.other_costdb;
import dbcon.proc_costdb;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ajaxtest
 */
public class estimatesearchajax extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String et_id = request.getParameter("et_id");
		String degree = request.getParameter("degree");
		response.getWriter().write("{");
		response.getWriter().write(getmaterial(et_id, degree)); 
		response.getWriter().write(getproc_cost(et_id, degree));
		response.getWriter().write(getother_cost(et_id, degree));
		response.getWriter().write("}");
	}
	
	public String getmaterial(String et_id, String degree) {
		if(et_id == null) et_id = "";
		if(degree == null) degree = "";	
		StringBuffer result = new StringBuffer("");
		result.append("\"materialresult\":[");
		dbcon db = new dbcon();
		Vector<material_etdb> v = db.getmaterial_etdb(et_id, degree); 
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getMaterials_no() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getQuantity() + "\"}],");
		}
		result.append("],");
		return result.toString();
	}
	
	public String getproc_cost(String et_id, String degree) {
		if(et_id == null) et_id = "";
		if(degree == null) degree = "";
		StringBuffer result = new StringBuffer("");
		result.append("\"proc_costresult\":[");
		dbcon db = new dbcon();
		Vector<proc_costdb> v = db.getproc_costdb(et_id, degree); 
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getStandard_proc() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getEt_start() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getEt_end() + "\"},");
			result.append("{\"value\": \"" + Integer.toString(v.get(i).getMd()) + "\"},");
			result.append("{\"value\": \"" + Integer.toString(v.get(i).getCost()) + "\"}],");
		}
		result.append("],");
		return result.toString();
	}
	
	public String getother_cost(String et_id, String degree) {
		if(et_id == null) et_id ="";
		if(degree == null) degree = "";
		StringBuffer result = new StringBuffer("");
		result.append("\"other_costresult\":[");
		dbcon db = new dbcon();
		Vector<other_costdb> v = db.getother_cost(et_id, degree);
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getOther_et_id() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getCost() + "\"}],");
		}
		result.append("],");
		return result.toString();
	}
}

package ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.pmdb;

/**
 * Servlet implementation class searchpm
 */
public class searchpm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String searchtype = request.getParameter("searchtype");	
		String searchpmname = request.getParameter("searchpmname");
		String check = request.getParameter("check");
		response.getWriter().write("{"); 
		response.getWriter().write(search(searchtype, searchpmname, check)); 
		response.getWriter().write("}");
	}
	public String search(String searchtype, String searchpmname, String check) {
		if(searchtype == null) searchtype = "";
		if(searchpmname == null) searchpmname = "";
		if(check == null) check = "0";
		StringBuffer result = new StringBuffer("");
		result.append("\"result\":[");
		dbcon db = new dbcon();
		Vector<pmdb> v = new Vector<pmdb>();
		v = db.searchpm(searchtype, searchpmname, check);
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getType() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getPm_name() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getPrice() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getStock() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getSafety_stock() + "\"}],");
		}
		result.append("]");
		return result.toString();
	}
}

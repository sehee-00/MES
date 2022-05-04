package ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.facilitiesdb;


/**
 * Servlet implementation class serachtableajax
 */
public class searchfacilities extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String searchword = request.getParameter("searchword");	
		response.getWriter().write("{");
		response.getWriter().write(search(searchword)); 
		response.getWriter().write("}");
	}
	public String search(String searchword) {
		if(searchword == null) searchword = "";	
		StringBuffer result = new StringBuffer("");
		result.append("\"result\":[");
		dbcon db = new dbcon();
		Vector<facilitiesdb> v = db.searchfacilities(searchword);
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getFacilities_name() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getUsing() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getFacilities_status() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getPay() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getUsing_all_day() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getFacilities_start() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getFacilities_end() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getFacilities_date() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getFacilities_priority() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getFacilities_img() + "\"}],");
		}
		result.append("]");
		return result.toString();
	}

}

package ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.manage_porderdb;

/**
 * Servlet implementation class searchmanage_porder
 */
public class searchmanage_porder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String searchpartname = request.getParameter("searchpartname");	
		String searchorder = request.getParameter("searchorder");
		System.out.println(searchpartname + " " + searchorder);
		response.getWriter().write("{"); 
		response.getWriter().write(search(searchpartname, searchorder)); 
		response.getWriter().write("}");
	}
	public String search(String searchpartname, String searchorder) {
		if(searchpartname == null) searchpartname = "";
		if(searchorder == null) searchorder = "";
		StringBuffer result = new StringBuffer("");
		result.append("\"result\":[");
		dbcon db = new dbcon();
		Vector<manage_porderdb> v = new Vector<manage_porderdb>();
		if(searchorder == "") {
			System.out.println("aa");
			v = db.searchmanage_porder(searchpartname);
		}
		else {
			v = db.searchmanage_porder2(searchpartname, searchorder);
		}
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getPart_name() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getOrder_name() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getNumber_of_request() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getType() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getM_no() + "\"}],");
		}
		result.append("]");
		return result.toString();
	}
}

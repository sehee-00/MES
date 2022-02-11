package ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.estimatedb;


/**
 * Servlet implementation class searchtableajax
 */
public class searchtableajax extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String searchword = request.getParameter("searchword");
		String mode = request.getParameter("mode");		
		String dates = request.getParameter("dates");
		String startdate = null;
		String enddate = null;
		if(dates != "" && dates != null){
			int index = dates.indexOf(" ");
			startdate = dates.substring(0,index);
			enddate = dates.substring(index+3);
		}
	
		response.getWriter().write("{");
		response.getWriter().write(search(searchword, Integer.parseInt(mode), startdate, enddate)); 
		response.getWriter().write("}");
	}
	public String search(String searchword, int mode, String startdate, String enddate) {
		if(searchword == null) searchword = "";	
		StringBuffer result = new StringBuffer("");
		result.append("\"result\":[");
		dbcon db = new dbcon();
		Vector<estimatedb> v = new Vector<estimatedb>();
		if(mode == 0) {
			v = db.degreesearchestimatetable(searchword, startdate, enddate);
		}
		else {
			v = db.searchestimatetable(searchword, startdate, enddate);
		}
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getEt_id() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getDegree() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getEt_com_name() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getEt_price() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getEt_date() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getEt_explain() + "\"}],");
		}
		result.append("]");
		return result.toString();
	}

}
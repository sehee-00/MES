package ajax;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.ordercosts;
/**
 * Servlet implementation class searchoutsourcing
 */
public class searchoutsourcing extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String start_day = request.getParameter("start_day");
		String end_day = request.getParameter("end_day");
		response.getWriter().write("{");
		response.getWriter().write(getdoccom(start_day, end_day));
		response.getWriter().write(getdocproc(start_day, end_day));
		response.getWriter().write(getsum(start_day, end_day));
		response.getWriter().write("}");
	}
	public String getdoccom(String start_day, String end_day) {
		StringBuffer result = new StringBuffer("");
		result.append("\"comresult\":[");
		dbcon db = new dbcon();
		Vector<String> v = db.doscompany();
		Vector<ordercosts> v2 = db.searchcompanyordertable(start_day, end_day);
		for(int i=0; i<v.size(); i++) 
		{	
			int check = 0;
			for(int j=0; j<v2.size(); j++) {
				if(v.get(i).equals(v2.get(j).getName())) {
					result.append("['" + v.get(i) + "'," +  v2.get(j).getPay() + "], ");
					check = 1;
					break;
				}
			}
			if(check == 0) {
				result.append("['" + v.get(i) + "', 0], ");
			}
			check = 0;
		}
		result.append("], ");
		return result.toString();
	}
	
	public String getdocproc(String start_day, String end_day) {
		StringBuffer result = new StringBuffer("");
		result.append("\"procresult\":[");
		dbcon db = new dbcon();
		Vector<String> v = db.dosprocess();
		Vector<ordercosts> v2 = db.searchprocordertable(start_day, end_day);
		for(int i=0; i<v.size(); i++) {
			int check = 0;
			for(int j=0; j<v2.size(); j++) {
				if(v.get(i).equals(v2.get(j).getName())) {
					result.append("['" + v.get(i) + "'," +  v2.get(j).getPay() + "], ");
					check = 1;
					break;
				}
			}
			if(check == 0) {
				result.append("['" + v.get(i) + "', 0], ");
			}
			check = 0;
		}
		result.append("], ");
		return result.toString();
	}
	
	public String getsum(String start_day, String end_day) {
		StringBuffer result = new StringBuffer("");
		dbcon db = new dbcon();
		result.append("\"sumresult\":" + db.searchsum(start_day, end_day));
		return result.toString();
	}
}

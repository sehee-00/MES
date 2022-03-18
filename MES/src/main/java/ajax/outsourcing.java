package ajax;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;


/**
 * Servlet implementation class outsourcing
 */
public class outsourcing extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("{");
		response.getWriter().write(getdoccom());
		response.getWriter().write(getdocproc());
		response.getWriter().write("}");
	}
	public String getdoccom() {
		StringBuffer result = new StringBuffer("");
		result.append("\"comresult\":[");
		dbcon db = new dbcon();
		Vector<String> v = db.doscompany();
		for(int i=0; i<v.size(); i++) {
			result.append("['" + v.get(i) + "', 0], ");
		}
		result.append("], ");
		return result.toString();
	}
	
	public String getdocproc() {
		StringBuffer result = new StringBuffer("");
		result.append("\"procresult\":[");
		dbcon db = new dbcon();
		Vector<String> v = db.dosprocess();
		for(int i=0; i<v.size(); i++) {
			result.append("['" + v.get(i) + "', 0], ");
		}
		result.append("]");
		return result.toString();
	}
	
}

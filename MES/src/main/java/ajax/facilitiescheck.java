package ajax;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.facilitiescheckdb;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class facilitiescheck
 */
@WebServlet("/facilitiescheck")
public class facilitiescheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String facilities_name = request.getParameter("facilities_name");
		response.getWriter().write("{");
		response.getWriter().write(getfacilitiescheck(facilities_name)); 
		response.getWriter().write("}");
	}
	
	public String getfacilitiescheck(String facilities_name) {
		if(facilities_name == null) facilities_name = "";
		StringBuffer result = new StringBuffer("");
		result.append("\"result\":[");
		dbcon db = new dbcon();
		Vector<facilitiescheckdb> v = db.getcontent(facilities_name);
		for(int i=0; i<v.size(); i++) {
			result.append("[{\"value\": \"" + v.get(i).getNo() + "\"},");
			result.append("{\"value\": \"" + v.get(i).getContent() + "\"}],");
		}
		result.append("],");
		return result.toString();
	}

}

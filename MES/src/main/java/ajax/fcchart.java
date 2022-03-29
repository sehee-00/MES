package ajax;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.Vector;

import dbcon.dbcon;
import dbcon.mainwork;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class fcchart
 */
@WebServlet("/fcchart")
public class fcchart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fcchart() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("{");
		response.getWriter().write(getwt());
		response.getWriter().write(getfc());
		response.getWriter().write("}");
	}
	public String getwt() {
		StringBuffer result = new StringBuffer("");
		result.append("\"wtresult\":[");
		dbcon db = new dbcon();
		Vector<mainwork> v = db.mainwt();
		for(int i=0; i<v.size(); i++) {
			result.append("['" + v.get(i).getMonth() + "'," + v.get(i).getWt() + "], ");
		}
		result.append("], ");
		return result.toString();
	}
	
	public String getfc() {
		StringBuffer result = new StringBuffer("");
		result.append("\"fcresult\":[");
		dbcon db = new dbcon();
		String[][] s = db.mainfc();
		for(int i=0; i<s.length; i++) {
			result.append("['" + s[i][0] + "', " + s[i][1] + ", " + s[i][2] + "], ");
		}
		result.append("]");
		return result.toString();
	}
	

}

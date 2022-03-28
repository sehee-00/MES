package consumables;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import defectivePerform.DefectivePerform;
import defectivePerform.dPerformDAO;

@WebServlet("/consumables/Csurvlet")
public class Csurvlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String cstart = request.getParameter("cdate");
		String cend = request.getParameter("cedate");
		response.getWriter().write("{");
		response.getWriter().write(getcom(cstart, cend));
		response.getWriter().write("}");
		
	}
	public String getcom(String cstart, String cend) {
		StringBuffer result = new StringBuffer("");
		result.append("\"cresult\":[");
		CDAO dao = new CDAO();
		List<Consumables> v = dao.getCList(cstart, cend);
		for(int i=0; i<v.size(); i++) {
			result.append("['" + v.get(i).getTool_name() + "' , "+ v.get(i).getPrice() +"], ");
		}
		result.append("], ");
		return result.toString();
	}
	

}

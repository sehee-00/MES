package defectivePerform;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/defectivePerform/dServlet")
public class dServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String year = request.getParameter("year");
		response.getWriter().write("{");
		response.getWriter().write(getdoccom(year));
		response.getWriter().write(getdocproc(year));
		response.getWriter().write("}");
	}
	//월별 불량/처리 건수 연도별 조회 
	public String getdoccom(String year) {
		StringBuffer result = new StringBuffer("");
		result.append("\"comresult\":[");
		dPerformDAO db = new dPerformDAO();
		List<DefectivePerform> v = db.getList(year);
		for(int i=0; i<v.size(); i++) {
			result.append("['" + v.get(i).getM() + '월'+ "' , "+ v.get(i).getNum() + ", " +v.get(i).getSolution() +"], ");
		}
		result.append("], ");
		return result.toString();
	}
	
	//유형별 불량 건수 연도별 조회
	public String getdocproc(String year) {
		StringBuffer result = new StringBuffer("");
		result.append("\"procresult\":[");
		dPerformDAO db = new dPerformDAO();
		List<DefectivePerform> v = db.getTList(year);
		for(int i=0; i<v.size(); i++) {
			result.append("['"+ v.get(i).getM() + '월'+ "', "+ v.get(i).getOm() + ", "+ v.get(i).getMm() +", "+ v.get(i).getPm() +" ], ");
		}
		result.append("]");
		return result.toString();
	}
}

package standardProcess;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import org.json.simple.JSONObject;
@WebServlet("/standardProcess/SearchWorkTime")
public class SearchWorkTime extends HttpServlet {
    public SearchWorkTime() {
        super();
    }
	
	//표준 작업 시간 검색 Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		PrintWriter writer = response.getWriter();

		StandardProcessDAO dao = new StandardProcessDAO();
		
		String procname = request.getParameter("proc_name");
		JSONObject data = dao.getWorkTime(procname);
		writer.print(data);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

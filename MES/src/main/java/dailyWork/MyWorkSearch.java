package dailyWork;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import standardProcess.StandardProcessDAO;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.simple.JSONObject;

@WebServlet("/dailyWork/MyWorkSearch")
public class MyWorkSearch extends HttpServlet {
    public MyWorkSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();

		DailyWorkDAO dao = new DailyWorkDAO();
		
		String workid = request.getParameter("workid");
		JSONObject data = dao.getMyWorkInfo(workid);
		writer.print(data);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

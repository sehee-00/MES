package userMenu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import standardProcess.StandardProcessDAO;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.simple.JSONObject;

@WebServlet("/userMenu/userMenuinsert")
public class userMenuinsert extends HttpServlet {

    public userMenuinsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();

		UserMenuDAO dao = new UserMenuDAO();
		UserMenuDTO dto = new UserMenuDTO();
		
		dto.setUser_id(request.getParameter("userid"));
		dto.setSales(request.getParameter("sales"));
		dto.setProd(request.getParameter("prod"));
		dto.setWork(request.getParameter("work"));
		dto.setMaterial_prod(request.getParameter("material_prod"));
		dto.setOrder_warehousing(request.getParameter("order_warehousing"));
		dto.setDashboard(request.getParameter("dashboard"));
		dto.setInfo_manage(request.getParameter("info_manage"));
		dto.setAdmin(request.getParameter("admin"));
		dto.setFacilitiesmenu(request.getParameter("facilities"));;
		int result = dao.updateUserMenu(dto);
		JSONObject resobj = new JSONObject();
		resobj.put("result", result);
		
		writer.print(resobj);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

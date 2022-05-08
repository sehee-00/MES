package estimateExcel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONObject;

@WebServlet("/estimateExecl/Excel")
public class estimateExcel extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		JSONObject result = null;
      
		String mode = request.getParameter("mode");
		String ordername = null;
		String partsname = null;
		
		switch(mode) {
	      
	      case "excelinfo":
			  result = new JSONObject();
			  String excelformpath = request.getSession().getServletContext().getRealPath("excelforms");
			  ordername = request.getParameter("itemno");
			  partsname = request.getParameter("partname");
			  String et_com_name = (String) request.getParameter("net_com_name");
			  String et_price = (String) request.getParameter("net_price");
			  String et_explain = (String) request.getParameter("net_explain");
			  String et_id = (String) request.getParameter("net_id");
			  String et_degree = request.getParameter("net_degree");
			  String[] materialarray = request.getParameterValues("nmaterial_name");
			  String[] material_no = request.getParameterValues("nmaterial_no");
			  String[] standard_proc = request.getParameterValues("nstandard_proc");
			  String[] proc_startdaystr = request.getParameterValues("nproc_startday");
			  String[] proc_enddaystr = request.getParameterValues("nproc_endday");
			  String[] md = request.getParameterValues("nmd");
			  String[] cost = request.getParameterValues("ncost");
			  String[] other_et_id = request.getParameterValues("nother_et_id");
			  String[] other_cost = request.getParameterValues("nother_cost");
			  
			  estimateexcelwrite excel = new estimateexcelwrite();
			  XSSFWorkbook wb = excel.writeExcel(excelformpath, ordername, partsname);
			  
			//파일 저장
				
				Date from = new Date();

				SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");

				String to = transFormat.format(from);

				String localfile = "work_schedule_" + partsname + "_" + to +".xlsx";
				
				response.setContentType("application/vnd.ms-excel");
				response.setHeader("Content-Disposition", "attachment;filename=" + localfile);
				
				try{
					wb.write(response.getOutputStream());
					wb.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
	    	  
	    	  break;
	      }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

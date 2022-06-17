package prodProgress;

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

@WebServlet("/prodProgress/Excel")
public class Excel extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		JSONObject result = null;
      
		String mode = request.getParameter("mode");
		String ordername = null;
		String partsname = null;
		
		switch(mode) {
	      
	      case "excelinfo": // 엑셀을 만든 것을 받아와 사용자가 다운 받을 수 있도록 헤더에 포함
			  result = new JSONObject();
			  String excelformpath = request.getSession().getServletContext().getRealPath("excelforms");
			  ordername = request.getParameter("itemno");
			  partsname = request.getParameter("partname");
			  
			  ProdProgressExcel excel = new ProdProgressExcel();
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

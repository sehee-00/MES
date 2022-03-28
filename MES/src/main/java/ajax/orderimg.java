package ajax;

import jakarta.servlet.http.HttpServlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.PrintWriter;

import order.orderDAO;
import order.orderDTO;

/**
 * Servlet implementation class test
 */
@WebServlet("/orderimg")
@MultipartConfig(
		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)

public class orderimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderimg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		orderDTO od = new orderDTO();
		orderDAO oda = new orderDAO();
		String itemno = request.getParameter("itemno");
		String company = request.getParameter("company");
		String orderday = request.getParameter("orderday");
		String classification = request.getParameter("classification");
		String parts = request.getParameter("parts");
		String car = request.getParameter("car");
		String productname = request.getParameter("productname");
		String amount = request.getParameter("amount");
		String negotiate = request.getParameter("negotiate");
		String expectedday = request.getParameter("expectedday");
		String processcompletionday = request.getParameter("processcompletionday");
		String dueday = request.getParameter("dueday");
		String remarks = request.getParameter("remarks");
		String quotation = request.getParameter("quotation");
		
		od.setItem_no(itemno);
		od.setO_com_id(company);
		od.setO_date(orderday);
		od.setO_status(classification);
		od.setP_status(parts);
		od.setC_name(car);
		od.setP_name(productname);
		if(!amount.equals("")) {
			System.out.println("aa");
			od.setO_price(Integer.parseInt(amount));
		}
		if(!negotiate.equals("")) {
			od.setN_price(Integer.parseInt(negotiate));
		}
		if(!expectedday.equals("")) {
			od.setDel_date(expectedday);
		}
		if(!processcompletionday.equals("")) {
			od.setP_e_date(processcompletionday);
		}
		if(!dueday.equals("")) {
			od.setDue_date(dueday);
		}
		od.setO_note(remarks);
		od.setO_et_id(quotation);
		od.setO_num(oda.getNext());
	
		String filename = itemno + ".JPG";
		Part filePart = request.getPart("img");
		String realfileName = filePart.getSubmittedFileName();
		InputStream fis = filePart.getInputStream();
		String realPath = request.getServletContext().getRealPath("/upload");
		String filePath = realPath + File.separator + filename;
		FileOutputStream fos = new FileOutputStream(filePath);
		byte[] buf = new byte[1024];
		int size = 0;
		while((size = fis.read(buf)) != -1) {
			fos.write(buf, 0, size);
		}
		fos.close();
		fis.close();
		od.setImg(filename);
		
		PrintWriter writer = response.getWriter();
		writer.println("<script>");
		if(oda.write(od)>0){
			writer.println("alert('완료');"); 
			writer.println("location.href='/MES/Order/Order.jsp';");
		}
		else {
			writer.println("alert('실패');"); 
			writer.println("history.back();");
		}        
		writer.println("</script>");
	}
}

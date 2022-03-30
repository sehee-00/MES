package part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("/partimg")
@MultipartConfig(
		fileSizeThreshold = 1024*1024,
		maxFileSize = 1024*1024*50,
		maxRequestSize = 1024*1024*50*5
)

public class image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public image() {
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
		String submitcheck = request.getParameter("submitcheck");

		String part_name = request.getParameter("part_name");
		String part_type = request.getParameter("part_type");
		String core = request.getParameter("core");
		String unit_price = request.getParameter("unit_price");
		String stock = request.getParameter("stock");
		String safety_stock = request.getParameter("safety_stock");
		String standard = request.getParameter("standard");
		String unit = request.getParameter("unit");
		
		String filename = part_name + ".JPG";
		Part filePart = request.getPart("img");
		String realfileName = filePart.getSubmittedFileName();
		InputStream fis = filePart.getInputStream();
		String realPath = request.getServletContext().getRealPath("/mtupload");
		String filePath = realPath + File.separator + filename;
		FileOutputStream fos = new FileOutputStream(filePath);
		byte[] buf = new byte[1024];
		int size = 0;
		while((size = fis.read(buf)) != -1) {
			fos.write(buf, 0, size);
		}
		fos.close();
		fis.close();
		PrintWriter writer = response.getWriter();
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				String query= null;

				String jdbcDriver = "jdbc:mysql://192.168.0.115:3306/mes?" + "useUnicode=true&characterEncoding=utf8";
				String dbUser = "Usera";
				String dbPass = "1234";
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				if(part_name.equals("")){
					writer.println("<script>");
					writer.println("history.back();");
					writer.println("</script>");
				}
				else{
					if(submitcheck.equals("1")){
						query = "update part set part_name='"+part_name+"', part_type='"+part_type+"', core='"+core+"', unit_price="+unit_price+", stock="+stock+", safety_stock="+safety_stock+", standard='"+standard+"', unit='"+unit+"', part_img='"+filename+"' where part_name='"+part_name+"'";
						
					}
					else {
						query = "insert into part values('"+part_name+"','"+part_type+"','"+core+"',"+unit_price+","+stock+","+safety_stock+",'"+standard+"','"+unit+"','"+filename+"')";
					}
					
				stmt = conn.createStatement();
				stmt.executeUpdate(query);
				writer.println("<script>");
				writer.println("history.back();");
				writer.println("</script>");
				}
			}
			catch(Exception e){
				
				writer.println("<script>alert('�̹��ִ� ��ǰ�� �Դϴ�.'); history.back();</script>");
			}

	}
}

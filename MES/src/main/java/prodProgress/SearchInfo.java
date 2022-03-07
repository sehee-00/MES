package prodProgress;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.simple.JSONObject;

@WebServlet("/prodProgress/SearchInfo")
public class SearchInfo extends HttpServlet {
    public SearchInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		JSONObject result = null;
		
		String mode = request.getParameter("mode");
		ProdProgressDAO dao = new ProdProgressDAO();
		
		
		switch(mode) {
		
		case "partinfo":
			String ordername = request.getParameter("itemno");
			List<OrderPartsDTO> partlist = null;
			result = new JSONObject();
			
			if(ordername != null){
				partlist = dao.getOrderParts(ordername);
			}
			if(partlist != null) {
				int index = 0;
				for(OrderPartsDTO dto : partlist) {
					JSONObject data = new JSONObject();
					
					data.put("pbo_id", dto.getPbo_id());
					data.put("order", dto.getOrder());
					data.put("part", dto.getPart());
					data.put("quantity", dto.getQuantity());
					data.put("order_status", dto.getOrder_status());
					data.put("layer", dto.getLayer());
					
					result.put(index, data);
					index += 1;
				}
			}
			break;
		
		}
		
		writer.print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

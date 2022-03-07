<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="faulty.FaultyDAO"/>
		<%
    		request.setCharacterEncoding("UTF-8");
    		String id = request.getParameter("bn");
    		int result = 0;
			if(id != null){
				result = dao.deletefaulty(id);
		    }
	    %>
{"result": <%=result%>}
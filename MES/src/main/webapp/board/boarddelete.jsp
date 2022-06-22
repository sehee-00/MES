<!-- 게시물 삭제 후 삭제 결과 반환 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="board.BoardDAO"/>
		<%
    		request.setCharacterEncoding("UTF-8");
    		String id = request.getParameter("bn");
    		int result = 0;

		if(id != null){
			result = dao.deleteBoard(id);
	    }%>
{"result": <%=result%>}

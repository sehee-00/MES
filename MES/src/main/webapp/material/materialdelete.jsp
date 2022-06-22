<!-- 자재 삭제 후 결과 반환 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="material.MaterialDAO"/>
<%

	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("bn");
	int result = 0;
	
	if(id != null){
		result = dao.deleteMaterial(id);
	}
%>
{"result" : <%=result %>}

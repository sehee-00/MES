<!-- 공정 혹은 하위 레벨 삭제 후 결과 반환  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="standardProcess.StandardProcessDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String mode = request.getParameter("mode");
	
	int result = 0;
	
	if(mode.equals("processmulti")){
		String proc_name = request.getParameter("proc_name");
		String sub_proc = request.getParameter("sub_proc");
		
		if(proc_name != null && sub_proc != null){
			result = dao.deleteProcessMulti(proc_name, sub_proc);
		}
	}else if(mode.equals("process")){
		String proc_name = request.getParameter("proc_name");
		if(proc_name != null){
			result = dao.deleteProcess(proc_name);
		}
	}
	
	dao.updatelowerlevelafterdelete();
%>
{"result" : <%=result %>}

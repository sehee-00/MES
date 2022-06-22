<!-- 공정 혹은 하위레벨 등록 후 결과 반환 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dao" class="standardProcess.StandardProcessDAO"/>
<jsp:useBean id="pmdto" class="standardProcess.StandardProcessPMDTO"/>
<jsp:useBean id="pdto" class="standardProcess.StandardProcessPDTO"/>
    
<%
request.setCharacterEncoding("UTF-8"); 
String mode = request.getParameter("mode");
int result = 0;
if(mode.equals("processmulti")){	
%>
<jsp:setProperty name="pmdto" property="proc_name" param="proc_name"/>
<jsp:setProperty name="pmdto" property="sortation" param="sortation"/>
<jsp:setProperty name="pmdto" property="sub_proc" param="sub_proc"/>
<% 
	result = dao.insertProcessMulti(pmdto);

}else if(mode.equals("topprocess")){ %>
<jsp:setProperty name="pdto" property="process_name" param="process_name"/>
<jsp:setProperty name="pdto" property="pay" param="pay"/>
<jsp:setProperty name="pdto" property="load_factor" param="load_factor"/>
<%
	if(request.getParameter("using").equals("1")){
		pdto.setUsing(true);
	}else{
		pdto.setUsing(false);
	}

	result = dao.insertProcess(pdto);

}else if(mode.equals("lowerprocess")){%>
<jsp:setProperty name="pmdto" property="proc_name" param="proc_name"/>
<jsp:setProperty name="pmdto" property="sortation" param="sortation"/>
<jsp:setProperty name="pmdto" property="sub_proc" param="process_name"/>

<jsp:setProperty name="pdto" property="process_name" param="process_name"/>
<jsp:setProperty name="pdto" property="pay" param="pay"/>
<jsp:setProperty name="pdto" property="load_factor" param="load_factor"/>
<jsp:setProperty name="pdto" property="using" param="using"/>
<%
	result = dao.insertProcess(pdto);
	if(result == 1){
		result = dao.insertProcessMulti(pmdto);
	}
}else if(mode.equals("procmanager")){
	String process_name = request.getParameter("process_name");
	String proc_manager = request.getParameter("process_manager");
	result = dao.insertProcessManager(process_name, proc_manager);
}else if(mode.equals("worktime")){
	String[] wt = request.getParameterValues("wtinput");
	String p_name = request.getParameter("process_name");
	result = dao.insertWorkTime(p_name, wt);
}%>
{"result":<%=result%>}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="faulty.Workday" %>
<%@ page import="faulty.WorkdayDAO" %>
<%@ page import="java.util.List" %>

<%
	WorkdayDAO wdo = new WorkdayDAO();
	String ln = request.getParameter("linknum");
	Workday	wd = wdo.getWork(ln);
	String[] wow = wdo.getpdate(wd.getOrder_name());
	String p = wdo.getPay(wd.getProcess());
	String T = wdo.getTotaltime(ln);
	String M = wdo.getMcost(ln);
%>
{"proc":"<%=wd.getProcess() %>", "or":"<%=wd.getOrder_name()%>","cl":"<%= wd.getClient()%>", "wo":"<%=wd.getWorker()%>", "fac":"<%=wd.getFacilities()%>",
"ws":"<%=wd.getWork_start() %>", "we":"<%=wd.getWork_end() %>", "pd":"<%=wow[0]%>", "re":"<%=wow[1] %>", "pay":"<%=p%>", "totalT":"<%=T %>", "mc":"<%=M%>"}


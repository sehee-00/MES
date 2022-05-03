<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="dbcon.dbcon" %>
<%@ page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<%
	dbcon dbc = new dbcon();

	String facilities_name = request.getParameter("nfacilities_name");
	String facilities_status = request.getParameter("nfacilities_status");
	String pay = request.getParameter("npay");
	String using = request.getParameter("nusing");
	String using_all_day = request.getParameter("nusing_all_day");
	String facilities_start = request.getParameter("nfacilities_start");
	String facilities_end = request.getParameter("nfacilities_end");
	String facilities_date = request.getParameter("nfacilities_date");
	String facilities_priority = request.getParameter("nfacilities_priority");
	String[] num = request.getParameterValues("num");
	String[] content = request.getParameterValues("content");
	String[] deletenum = request.getParameterValues("deletenum");
	
	dbc.insertfacilities(facilities_name, facilities_status, pay, using, using_all_day, facilities_start, facilities_end, facilities_date, facilities_priority);
	dbc.insertcheck(facilities_name, content, num, deletenum);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('성공');");
	//script.println("alert(" + sf.format(proc_startday) + ");");
	script.println("location.href = document.referrer;");
	//script.println("history.back();");
	script.println("</script>");
	script.close();
%>


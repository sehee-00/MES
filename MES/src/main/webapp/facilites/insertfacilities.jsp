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

	dbc.insertfacilities(facilities_name, facilities_status, pay, using, using_all_day, facilities_start, facilities_end);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('성공');");
	//script.println("alert(" + sf.format(proc_startday) + ");");
	script.println("location.href = document.referrer;");
	//script.println("history.back();");
	script.println("</script>");
	script.close();
%>


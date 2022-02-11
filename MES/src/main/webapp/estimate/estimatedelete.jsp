<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="dbcon.dbcon" %>
<%@ page import ="java.io.PrintWriter" %>
<!DOCTYPE html>
<%
	dbcon dbc = new dbcon();
	String et_id = null;
	String et_degree = null;
	et_id = (String) request.getParameter("net_id");
	et_degree = (String) request.getParameter("net_degree");
	dbc.deleteestimate(et_id, et_degree);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('성공');");
	script.println("location.href = document.referrer;");
	//script.println("history.back();");
	script.println("</script>");
	script.close();
%>
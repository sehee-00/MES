<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="dbcon.dbcon" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date" %>
<!DOCTYPE html>
<%
	dbcon dbc = new dbcon();
	String et_com_name = null;
	String et_price = null;
	String et_explain = null;
	String et_id = null;
	String et_degree = null;
	String [] materialarray = null;
	String [] material_no = null;
	String [] standard_proc = null;
	String [] proc_startdaystr = null;
	String [] proc_enddaystr = null;
	String [] md = null;
	String [] cost = null;
	String [] other_et_id = null;
	String [] other_cost = null;
	
	et_com_name = (String) request.getParameter("net_com_name");
	et_price = (String) request.getParameter("net_price");
	et_explain = (String) request.getParameter("net_explain");
	et_id = (String) request.getParameter("net_id");
	et_degree = request.getParameter("net_degree");
	materialarray = request.getParameterValues("nmaterial_name");
	material_no = request.getParameterValues("nmaterial_no");
	standard_proc = request.getParameterValues("nstandard_proc");
	proc_startdaystr = request.getParameterValues("nproc_startday");
	proc_enddaystr = request.getParameterValues("nproc_endday");
	md = request.getParameterValues("nmd");
	cost = request.getParameterValues("ncost");
	other_et_id = request.getParameterValues("nother_et_id");
	other_cost = request.getParameterValues("nother_cost");
	//SimpleDateFormat sf  = new SimpleDateFormat("yyyyMMdd");
	//Date proc_startday = sf.parse(proc_startdaystr); 
	dbc.insertestimate(et_id, et_com_name, Integer.parseInt(et_price), et_explain, materialarray, material_no);
	dbc.insertproc_cost(standard_proc, proc_startdaystr, proc_enddaystr, md, cost);
	dbc.insertother_cost(other_et_id, other_cost);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('성공');");
	//script.println("alert(" + sf.format(proc_startday) + ");");
	script.println("location.href = document.referrer;");
	//script.println("history.back();");
	script.println("</script>");
	script.close();
%>


<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="faulty.Faulty"%>
<%@ page import="faulty.FaultyDAO"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

	<jsp:useBean id="vo" class="faulty.Faulty"/>
	<jsp:useBean id="dao" class="faulty.FaultyDAO"/>
	
	<jsp:setProperty name="vo" property="faulty_no" param="faulty_no"/>
	<jsp:setProperty name="vo" property="link_info" param="link_info"/>
	<jsp:setProperty name="vo" property="faulty_type" param="faulty_type"/>
	<jsp:setProperty name="vo" property="cause_of_defect" param="cause_of_defect"/>
	<jsp:setProperty name="vo" property="date_of_occurrence" param="date_of_occurrence"/>
	<jsp:setProperty name="vo" property="materials_cost" param="materials_cost"/>
	<jsp:setProperty name="vo" property="cost" param="cost"/>
	<jsp:setProperty name="vo" property="faulty_title" param="faulty_title"/>
	<jsp:setProperty name="vo" property="faulty_content" param="faulty_content"/>
	<jsp:setProperty name="vo" property="solution" param="solution"/>
	<jsp:setProperty name="vo" property="user_id" param="user_id"/>
	<jsp:setProperty name="vo" property="proc_date" param = "proc_date"/>

<% int result = dao.updatefaulty(vo); %>
{"result":"<%=result%>"}
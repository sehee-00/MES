<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>


<!-- 데이터베이스 연결 -->
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String query= null;

String jdbcDriver = "jdbc:mysql://192.168.0.115:3306/mes?" + "useUnicode=true&characterEncoding=utf8";
String dbUser = "Usera";
String dbPass = "1234";
conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
String part_name = request.getParameter("part_name");
String part_type = request.getParameter("part_type");
String core = request.getParameter("core");
String unit_price = request.getParameter("unit_price");
String stock = request.getParameter("stock");
String safety_stock = request.getParameter("safety_stock");
String standard = request.getParameter("standard");
String unit = request.getParameter("unit");


if(part_name.equals("")){
	response.sendRedirect("part_management.jsp");
}
else{
	query = "insert into part values('"+part_name+"','"+part_type+"','"+core+"',"+unit_price+","+stock+","+safety_stock+",'"+standard+"','"+unit+"','')";

	stmt = conn.createStatement();
	stmt.executeUpdate(query);

	response.sendRedirect("part_management.jsp");
}



%>
</body>
</html>
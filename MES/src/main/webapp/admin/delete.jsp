<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	
	String adminid = request.getParameter("p1");
	
	if(adminid.equals("")){
		response.sendRedirect("user_management.jsp");
	}
	else{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String jdbcDriver = "jdbc:mysql://192.168.0.115:3306/mes?" + "useUnicode=true&characterEncoding=utf8";
		String dbUser = "Usera";
		String dbPass = "1234";
		String query = "delete from user where user_id='" + adminid + "';";
		
		// Create DB Connection 
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		// Create Statement 
		stmt = conn.createStatement();
		// Run Qeury 
		stmt.executeUpdate(query);
		query = "delete from user_menu where user_id='"+adminid+"'";
		stmt.executeUpdate(query);
		
		response.sendRedirect("user_management.jsp");
	}
	
	%>
</body>
</html>
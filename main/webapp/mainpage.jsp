<!-- main page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>


<!-- index페이지에서 넘어온 id,pw 받기 -->
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
%>

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

<!-- index페이지에서 넘어온 아이디 값 비교해서 맞으면 session저장, 아니면 index로 -->
<%
query = "select * from user where user_id='"+id+"'";
stmt = conn.createStatement();
// Run Qeury 
rs = stmt.executeQuery(query);

if(rs.next()){
	if(pw.equals(rs.getString("user_pw"))){
		session.setAttribute("id", id);
	}
	else{
		response.sendRedirect("index.jsp");
	}
}
else{
	response.sendRedirect("index.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MES</title>

<style>
	#pframe{
		margin-left: 310px;
		width: 1610px;
		height: 1000px;
		
		overflow: scroll;
	}
</style>

</head>
<body>
	<iframe id="pframe" src="board/board.jsp" frameborder="0px"></iframe>
</body>
</html>
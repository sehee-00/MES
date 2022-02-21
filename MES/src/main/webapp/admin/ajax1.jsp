<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
// 	데이터베이스 연결
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String query= null;
	
	String jdbcDriver = "jdbc:mysql://192.168.0.115:3306/mes?" + "useUnicode=true&characterEncoding=utf8";
	String dbUser = "Usera";
	String dbPass = "1234";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	String user_id = request.getParameter("input");
	query = "select * from user where user_id = '"+user_id+"'";
	rs=stmt.executeQuery(query);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="textbox2">
<div id="ordert2"></div>
<script>
$("#textbox2").on("keydown",function(e){   // 검색 창에 값이 입력됨에 따른 이벤트 처리
    if(e.keyCode==13){   // 엔터가 입력 됐을 때 
       input2=$("#textbox2").val(); 
    
       $.ajax({
          type:"GET",
            url:"./ajax2.jsp",
            data:{input2:input2},
            dataType:"html",
            success:function(data){
                $("#ordert2").html(data);
          }
       });
    }
});
</script>
</body>
</html>
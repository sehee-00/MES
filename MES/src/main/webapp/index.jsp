<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="dbconn.DBconn"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MES</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<link href="index.css?ver05" rel="stylesheet">
	
	 <%
     HttpSession sessions = request.getSession(false);
     if(sessions != null){
          sessions.invalidate();
     }
     %>
	
</head>
<body class="text-center">
	<form class="form-signin" action="mainpage.jsp" method="post">
	<div class="inputformdiv">
		<div class="form-floating">
		    <input type="text" class="form-control" name="id" placeholder="ID">
            <label for="floatingInput">ID</label>
        </div>
		<div class="form-floating">
            <input type="password" class="form-control" name="pw" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>
		<button class="btn btn-lg btn-primary" type="submit">로그인</button>
		<div id="popbtn"></div>
	</div>
	</form>
</body>
</html>

<!-- pop 화면 권한설정 -->
<script>
	$(document).ready(function(){
		<%
		DBconn db = new DBconn();
		Connection con = db.getCon();
		String sql = "SELECT * FROM user_auth";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		int idx = 0, status = 0;
		
		while(rs.next()){
			idx = rs.getInt("idx");
			status = rs.getInt("status");
		}
		
		if(status == 1){
		%>
		window.location.href='./POP/DASHBOARD.jsp';
		<%	
		}
		%>
		
	})
</script>
<!-- main page -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
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
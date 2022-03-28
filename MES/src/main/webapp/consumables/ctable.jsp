<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"%>
<%@ page import= "consumables.Consumables"%>
<html>
<head>
<meta charset="UTF-8">
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>


<!--bootstrap-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="consumables.css?ver003">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
<jsp:useBean id="dao" class="consumables.CDAO" />
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<%
	request.setCharacterEncoding("UTF-8"); 
	String cs = request.getParameter("start");
	String ce = request.getParameter("end");
	
	
%>

</head>
<body>
<div class="row">
<h1 class="title border" style="font-weight: bold"></h1>
	<table id="faultyProcCost" class="table table-bordered table-hover">
			<tbody>
			<%int csum = dao.getCsum(cs,ce);
			int cavg = dao.getCavg(cs, ce);
			%>
				<tr>
					<td style="width: 7.1%;text-align: center; background-color: #e3f2fd;">합계</th>
					<td style="width: 7.1%;text-align: center;"><%= csum %>원</th>
					<td style="width: 7.1%;text-align: center; background-color: #e3f2fd;">평균(원)</th>
					<td style="width: 7.1%;text-align: center;"><%= cavg %>원</th>
				</tr>
			</tbody>
	</table>
</div>
</body>
</html>
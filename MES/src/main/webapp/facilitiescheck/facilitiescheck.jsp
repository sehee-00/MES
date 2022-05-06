<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="dbcon.dbcon"%>
<%@ page import="dbcon.manage_porderdb"%>
<%@ page import="java.util.Vector"%>
<%@ page import="dbcon.facilitiesdb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%
dbcon dbc = new dbcon();
Vector<String> fn = dbc.getfacilities_name();
//int lastpage = (mp.size() - 1) / 10 + 1;
Vector<facilitiesdb> fc = dbc.facilitiestable();
Vector<String> facilities_status = dbc.selectfacilities_status();
int lastpage = (fc.size()-1)/10 + 1;
Vector<String> code = dbc.getcode_sub();
%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!--bootstrap-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
<link rel="stylesheet" href="facilitiescheck.css?ver02">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
var request = new XMLHttpRequest();
var hlastpage = <%=lastpage%>;
var paging = 1;
var now = new Date();
var year = now.getFullYear();
var month = now.getMonth();


function dateoption(){
	for(var i=-7; i<12; i++){
		if(i == 0){
			var oyear = year + i;
			var option = $('<option selected>' + oyear + "</option>")
			$('#year').append(option);
		}
		else{
			var oyear = year + i;
			var option = $('<option>' + oyear + "</option>")
			$('#year').append(option);
		}
	}	
	for(var i=1; i<=12; i++){
		if(i == month){
			var option = $('<option selected>' + i + '</option>');
			$('#month').append(option);
		}
		else{
			var option = $('<option>' + i + '</option>');
			$('#month').append(option);
		}
	}
}

function uptable(){
	var facilities_name = document.getElementById("facilities_name").value;
	alert(facilities_name);
	var vyear = document.getElementById("year").value;
	var vmonth = document.getElementById("month").value;
	var lastday = new Date(vyear, vmonth, 0).getDate();
	var tablehead = document.getElementById("checkthead");
	var checktbody = document.getElementById("checktbody");
	var ths = '<th style="width:100px;">날짜</th>';
	var tbs = '<tr><td>담당자</td>';
	for(var i=1; i<=lastday; i++){
		ths += '<th>' + vmonth + '/' + i + '</th>';
		tbs += '<td></td>';
	}
	tbs += '</tr>';
	tablehead.innerHTML = ths;
	checktbody.innerHTML = tbs;
	request.open("Post", "../facilitiesph?facilities_name=" + facilities_name + "&year=" + vyear + "&month=" + vmonth ", true);
	request.onreadystatechange = getph;
	request.send(null);
}
</script>
</head>
<body>
	<div class="title">설비 관리 / 설비일상점검</div>
	<div class="panel panel-default border searchbox">
		<div class="panel-body">
			설비명&nbsp;&nbsp;&nbsp;
			<select id="facilities_name" name="nfacilities_name" class="form-control searchtitle">
			<%for(int i=0; i<fn.size(); i++){
				%>
				<option><%=fn.get(i) %></option>
				<%
			}
				%>
			</select>
			&nbsp;&nbsp;&nbsp; 날짜:
			<select id="year" name="nyear" class="form-control searchtitle" style="width:5%;"></select>
			<select id="month" name="nmonth" class="form-control searchtitle" style="width:3%;"></select>
			<script>
			dateoption();
			</script>
			&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="선택" onclick="uptable()"> 
		</div>
	</div>
	<div class="row">
		<div class="panel panel-default border boardlistbox col-md-6">
			<div class="panel-heading" style="height: 60px;">
				<div style="height: 40px;">
					<h5 class="panel-title" style="float: left; margin-top: 10px;">설비일상점검 항목</h5>
					&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="작성" style="margin-top:2px;"> 
				</div>
			</div>
			<div class="panel-body">
				<div style="overflow-x:scroll;">
				<table class="table table-bordered table-hover" id="checktable" style="width:5000px; max-width:none;">
					<thead class="tablehead" id ="checkthead">
						
					</thead>
					<tbody id="checktbody">
						
					</tbody>
				</table>	
				</div>
				<script>
				uptable();
				</script>	
			</div>
		</div>
	</div>
</body>
</html>
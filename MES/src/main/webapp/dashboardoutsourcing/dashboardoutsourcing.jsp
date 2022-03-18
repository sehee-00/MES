<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://www.gstatic.com/charts/loader.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://www.gstatic.com/charts/loader.js"></script>

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
<link rel="stylesheet" href="dashboardoutsourcing.css">
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
var request = new XMLHttpRequest();
var comresult = "";
var procresult = "";
var sumresult = 0;
var diff = 0;
google.load('visualization', '1.0', {'packages':['corechart']});


function comdrawChart() {
	var data = new google.visualization.DataTable;
	data.addColumn('string', '인물 ');
	data.addColumn('number', ' 취득수 ');
	data.addRows(comresult);
	var opt = {
		width: '100%',
		height:'100%',
		vAxis:{maxValue:100, title:'비용(원)'},
		hAxis:{viewWindowMode:'max',
				maxValue:30,}
	};

	var chart = new google.visualization.ColumnChart(
			document.getElementById('comchart_div'));
	chart.draw(data, opt);
}

function procdrawChart() {
	var data = new google.visualization.DataTable;
	data.addColumn('string', '인물 ');
	data.addColumn('number', ' 취득수 ');
	data.addRows(procresult);
	var opt = {
		width: '100%',
		height:'100%',
		vAxis:{maxValue:100,},
		hAxis:{viewWindowMode:'max',
				maxValue:30,}
	};

	var chart = new google.visualization.ColumnChart(
			document.getElementById('procchart_div'));
	chart.draw(data, opt);
}

function orderchange(){
	start_day = document.getElementById("start_day").value;
	end_day = document.getElementById("end_day").value;
	if(start_day != "" && end_day != ""){
		request.open("Post", "http://localhost:8080/MES/searchoutsourcing?start_day=" + start_day + "&end_day=" + end_day , true);
		request.onreadystatechange = orderresult;
		request.send(null);
	}
}

function fisrtchart(){
	request.open("Post", "http://localhost:8080/MES/outsourcing", true);
	request.onreadystatechange = fisrtresult;
	request.send(null);
}

function orderresult(){
	if(request.readyState == 4 && request.status == 200){
		var object = eval('(' + request.responseText + ')');
		comresult = object.comresult;
		procresult = object.procresult;
		sumresult = object.sumresult;
		var startday = document.getElementById("start_day").value;
		var endday = document.getElementById("end_day").value;
		startday = startday.split('-');
		endday = endday.split('-');
		sd = new Date(startday[0], startday[1], startday[2]);
		ed = new Date(endday[0], endday[1], endday[2]);
		diff = ed - sd
		diff /= 24 * 60 * 60 * 1000;
		var avg = sumresult/diff
		draw();
		document.getElementById("sum").innerHTML = Number(sumresult).toLocaleString('ko-KR') + "원";
		document.getElementById("avg").innerHTML = parseInt(avg).toLocaleString('ko-KR') + "원";
	}
}

function fisrtresult(){
	if(request.readyState == 4 && request.status == 200){
		var object = eval('(' + request.responseText + ')');
		comresult = object.comresult;
		procresult = object.procresult;
		draw();
	}
}

function draw(){
	google.setOnLoadCallback(comdrawChart);
	google.setOnLoadCallback(procdrawChart);
	
}
</script>
</head>
<body>
	<div class="title">Dashboard / 계획대비 실적원가 분석</div>
	<div class="panel panel-default border searchbox">
		<div class="panel-body">
			기간:&nbsp;
			<input type="date" id="start_day">
			&nbsp; ~ &nbsp;
			<input type="date" id="end_day">
			&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="조회" onclick="orderchange();">
		</div>
	</div>   
	<div class="panel panel-default border box1" style="border:0px;">
		<div class="panel-body">
			<div id="comchart_div" style="height:20vw"></div>   
		</div>
	</div>	
	<div class="panel panel-default border box2" style="border:0px;">
		<div class="panel-body">
			<div id="procchart_div" style="height:20vw"></div>   
		</div>
	</div>	
	<div class="panel panel-default border box3" style="border:0px;">
		<div class="panel-body">
			<table class="table table-bordered table-hover" id="sumavg">
				<tr>
					<th style="background:rgb(23, 162, 184); color:white; width:25%;">합계</th>
					<td id="sum" style="text-align:right; width:25%;">0원</td>
					<th style="background:rgb(23, 162, 184); color:white; width:25%;">평균(원)</th>
					<td id="avg" style="text-align:right; width:25%;">0원</td>
				</tr>
			</table>  
		</div>
	</div>	
	<script>
		fisrtchart();
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="dbcon.dbcon"%>
<%@ page import="dbcon.estimatedb"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%
dbcon dbc = new dbcon();
Vector<String> selectorder = dbc.selectorder();
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
<link rel="stylesheet" href="dashboardorder.css?ver02">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
var request = new XMLHttpRequest();
var orderprice = 0;
var ctsorderprice = 0;
var pctimesum = 0;
var pccostsum = 0;
var pocostsum = 0;
var cocostsum = 0;
var ctspmsum = 0;
var pmsum = 0;
var mcsum = 0;

$(document).ready(function() {
    $('select[id="orderid"]').select2();
    $('select[id="orderid"]').val("").select2();
});

function orderchange(){
	var orderidem = document.getElementById("orderid");
	var selectorderid = orderidem.options[orderidem.selectedIndex].text;
	request.open("Post", "../ordertable?orderid=" + selectorderid, true);
	request.onreadystatechange = tableupdate;
	request.send(null);
}


function tableupdate(){
	var proc_costtable = document.getElementById("proc_costtbody");
	var procordertable = document.getElementById("procordertbody")
	var companyordertable = document.getElementById("companyordertbody");
	var materialordertable = document.getElementById("materialordertbody");
	
	if(request.readyState == 4 && request.status == 200){
		var object = eval('(' + request.responseText + ')');
		var proc_costresult = object.proc_costresult
		var procorderresult = object.procorderresult;
		var companyorderresult = object.companyorderresult;
		var orderpriceresult = object.orderpriceresult;
		var ordertoolresult = object.ordertoolresult;
		
		orderprice = orderpriceresult.price	
		ctsorderprice = Math.round(Number(orderprice) * Number(document.getElementById("cts").value) / 100);
		document.getElementById("orderprice").innerHTML = Number(orderprice).toLocaleString('ko-KR') + "원";
		document.getElementById("ctsvalue").innerHTML = ctsorderprice.toLocaleString('ko-KR') + "원";
		var pccnt = 0;
		var pocnt = 0;
		var cocnt = 0;
		var mccnt = 0;
		
		pctimesum = 0;
		pccostsum = 0;
		pocostsum = 0;
		cocostsum = 0;
		mcsum = 0;
		
		proc_costtable.innerHTML = "";
		procordertable.innerHTML = "";
		companyordertable.innerHTML = "";
		materialordertable.innerHTML = "";
		
		for(var i=0; i < proc_costresult.length; i++){
			var proc_costrow= proc_costtable.insertRow(proc_costtable.rows.length);
			var cell1 = proc_costrow.insertCell(0);
			var cell2 = proc_costrow.insertCell(1);
			var cell3 = proc_costrow.insertCell(2);
			var cell4 = proc_costrow.insertCell(3);
			var cell5 = proc_costrow.insertCell(4);
			
			cell1.innerHTML = pccnt;
			cell2.innerHTML = proc_costresult[i][0].value;
			cell3.innerHTML = proc_costresult[i][1].value;
			cell4.innerHTML = Number(proc_costresult[i][2].value).toLocaleString('ko-KR') + "원"; 
			cell5.innerHTML = Number(proc_costresult[i][3].value).toLocaleString('ko-KR') + "원"; 
			
			pctimesum += Number(proc_costresult[i][1].value);
			pccostsum += Number(proc_costresult[i][3].value);
			cell1.style.textAlign = 'center';
			cell3.style.textAlign = 'center';
			cell4.style.textAlign = 'right';
			cell5.style.textAlign = 'right';
			
			pccnt++;	
		}
		document.getElementById("proc_costtimesum").innerHTML = pctimesum;
		document.getElementById("proc_costcostsum").innerHTML = pccostsum.toLocaleString('ko-KR') + "원";
		
		for(var i=0; i < procorderresult.length; i++){
			var procorderrow= procordertable.insertRow(procordertable.rows.length);
			var cell1 = procorderrow.insertCell(0);
			var cell2 = procorderrow.insertCell(1);
			var cell3 = procorderrow.insertCell(2);
			
			cell1.innerHTML = pocnt;
			cell2.innerHTML = procorderresult[i][0].value;
			cell3.innerHTML = Number(procorderresult[i][1].value).toLocaleString('ko-KR') + "원";
			
			pocostsum += Number(procorderresult[i][1].value);
			cell1.style.textAlign = 'center';
			cell2.style.textAlign = 'center';
			cell3.style.textAlign = 'right';
			pocnt++;	
		}
		
		document.getElementById("procordercostsum").innerHTML = pocostsum.toLocaleString('ko-KR') + "원";
		
		for(var i=0; i < companyorderresult.length; i++){
			var companyorderrow= companyordertable.insertRow(companyordertable.rows.length);
			var cell1 = companyorderrow.insertCell(0);
			var cell2 = companyorderrow.insertCell(1);
			var cell3 = companyorderrow.insertCell(2);
			
			cell1.innerHTML = cocnt;
			cell2.innerHTML = companyorderresult[i][0].value;
			cell3.innerHTML = Number(companyorderresult[i][1].value).toLocaleString('ko-KR') + "원";
	
			cocostsum += Number(companyorderresult[i][1].value);
			cell1.style.textAlign = 'center';
			cell2.style.textAlign = 'center';
			cell3.style.textAlign = 'right';
			cocnt++;	
		}
		document.getElementById("companyordercostsum").innerHTML = cocostsum.toLocaleString('ko-KR') + "원";
		
		for(var i=0; i < ordertoolresult.length; i++){
			var materialorderrow= materialordertable.insertRow(materialordertable.rows.length);
			var cell1 = materialorderrow.insertCell(0);
			var cell2 = materialorderrow.insertCell(1);
			var cell3 = materialorderrow.insertCell(2);
			
			cell1.innerHTML = mccnt;
			cell2.innerHTML = ordertoolresult[i][0].value;
			cell3.innerHTML = Number(ordertoolresult[i][1].value).toLocaleString('ko-KR') + "원";
	
			mcsum += Number(ordertoolresult[i][1].value);
			cell1.style.textAlign = 'center';
			cell2.style.textAlign = 'center';
			cell3.style.textAlign = 'right';
			cocnt++;	
		}
		document.getElementById("materialcostsum").innerHTML = mcsum.toLocaleString('ko-KR') + "원";
		
		document.getElementById("ordercost").innerHTML = pocostsum.toLocaleString('ko-KR') + "원";
		document.getElementById("workcost").innerHTML = pccostsum.toLocaleString('ko-KR') + "원";
		document.getElementById("materialcost").innerHTML = mcsum.toLocaleString('ko-KR') + "원";
		ctspmsum = ctsorderprice - mcsum - pccostsum - pocostsum;
		pmsum = orderprice - mcsum - pccostsum - pocostsum;
		document.getElementById("ctspmsum").innerHTML = ctspmsum.toLocaleString('ko-KR') + "원";
		document.getElementById("pmsum").innerHTML = pmsum.toLocaleString('ko-KR') + "원";
		
	}
}

function cts(){
	ctsorderprice = Math.round(Number(orderprice) * Number(document.getElementById("cts").value) / 100);
	ctspmsum = ctsorderprice - mcsum - pccostsum - pocostsum;
	document.getElementById("ctsvalue").innerHTML = ctsorderprice.toLocaleString('ko-KR') + "원";
	document.getElementById("ctspmsum").innerHTML = ctspmsum.toLocaleString('ko-KR') + "원";
}
</script>
</head>
<body>
	<div class="title">Dashboard / 계획대비 실적원가 분석</div>
	<div class="panel panel-default border box1">
		<div class="panel-body">
			수주정보&nbsp;&nbsp;&nbsp;
			<select id="orderid" class="form-control searchtitle" onchange="orderchange()">
				<option value="" selected="selected" hidden="hidden"></option>
				<%
				for(int i=0; i<selectorder.size(); i++){
				%>
				<option><%=selectorder.get(i)%></option>
				<%} %>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 제조원가율:&nbsp;&nbsp;&nbsp;
			<input type="text" id="cts" name="ncts" class="form-control searchtitle" style="width:80px;" value="80">&nbsp;&nbsp;%
			<input class="btn btn-primary" type="button" value="원가율 계산" style="position:relative; bottom:2px;" onclick="cts()">
		</div>
	</div>
	<div class="panel panel-default border box2" style="border:0px;">
		<div class="panel-body">
			<table class="table table-bordered table-hover" id="maintable">
				<tr>
					<th scope="row" style="background:gray; color:white;">제조원가</th>
					<td style="color:red;">제조원가%</td>
					<td id="ctsvalue" style="text-align:right">0원</td>
					<td rowspan="2" style="color:red;">소재비</td>
					<td id="materialcost" rowspan="2" style="text-align:right">0원</td>
					<td rowspan="2" style="color:red;">가공비</td>
					<td id="workcost" rowspan="2" style="text-align:right">0원</td>
					<td rowspan="2" style="color:red;">외주비</td>
					<td id="ordercost" rowspan="2" style="text-align:right">0원</td>
					<td rowspan="2" style="color:red;">합계</td>
					<td rowspan="2" style="text-align:right">0원</td>
					<td style="color:red">손익합계</td>
					<td id="ctspmsum" style="text-align:right">0원</td>
				</tr>
				<tr>
					<th scope="row" style="background:gray; color:white">수주</th>
					<td style="color:red;">수주가</td>
					<td id="orderprice" style="text-align:right">0원</td>
					<td style="color:red;">손익합계</td>
					<td id="pmsum" style="text-align:right">0원</td>
				</tr>
			</table>
		</div>
	</div>	
	<div class="panel panel-default border box3" style="border:0px;">
		<div class="panel-body">
			<h2>가공비</h2>
			<table class="table table-bordered table-hover" id="proc_costtable">
				<thead>
					<tr>
						<td rowspan="2" style="text-align:center;"><br><br>No.</td>
						<td rowspan="2" style="text-align:center;"><br><br>가공명</td>	
						<td colspan="3" style="text-align:center;">WT</td>
					</tr>
					<tr>
						<td style="text-align:center;">공수</td>
						<td style="text-align:center;">가공임률</td>
						<td style="text-align:center;">금액</td>	
					</tr>
				</thead>
				<tbody id="proc_costtbody">
				</tbody>
				<tr>
					<th scope="row" colspan="2" style="background:gray; color:white;">합계</th>
					<td id="proc_costtimesum" style="text-align:center; background:gray; color:white;">0</td>
					<td id="proc_costcostsum" style="text-align:right; background:gray; color:white;" colspan="2">0원</td>
				</tr>
			</table>
		</div>
	</div>	
	<div class="row">
		<div class="panel panel-default border processbox" style="border:0px;">
		<div class="panel-body">
			<h2>공정별 외주비</h2>
			<table class="table table-bordered table-hover" id="procordertable">
				<thead>
					<tr>
						<th style="text-align:center;">No.</th>
						<th style="text-align:center;">가공명</th>	
						<th style="text-align:center;">금액</th>
					</tr>
				</thead>
				<tbody id="procordertbody">
				</tbody>
				<tr>
					<th scope="row" colspan="2" style="background:gray; color:white;">합계</th>
					<td id="procordercostsum" style="text-align:right; background:gray; color:white;">0원</td>
				</tr>
			</table>
		</div>
		</div>
		<div class="panel panel-default border companybox" style="border:0px;">
		<div class="panel-body">
			<h2>업체별 외주비</h2>
			<table class="table table-bordered table-hover" id="companyordertable">
				<thead>
					<tr>
						<th style="text-align:center;">No.</th>
						<th style="text-align:center;">회사명</th>	
						<th style="text-align:center;">금액</th>
					</tr>
				</thead>
				<tbody id="companyordertbody">
					
				</tbody>
				<tr>
					<th scope="row" colspan="2" style="background:gray; color:white;">합계</th>
					<td id="companyordercostsum" style="text-align:right; background:gray; color:white;">0원</td>
				</tr>
			</table>
		</div>
	</div>
	</div>
	<div class="panel panel-default border box4" style="border:0px;">
		<div class="panel-body">
			<h2>소재비</h2>
			<table class="table table-bordered table-hover" id="materialordertable">
				<thead>
					<tr>
						<th style="text-align:center;">No.</th>
						<th style="text-align:center;">가공명</th>	
						<th style="text-align:center;">금액</th>
					</tr>
				</thead>
				<tbody id="materialordertbody">
				</tbody>
				<tr>
					<th scope="row" colspan="2" style="background:gray; color:white;">합계</th>
					<td id="materialcostsum" style="text-align:right; background:gray; color:white;">0원</td>
				</tr>
			</table>
		</div>
	</div>
</body>	
</html>
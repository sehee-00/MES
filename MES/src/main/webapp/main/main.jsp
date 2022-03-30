<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="dbcon.dbcon"%>
<%@ page import="dbcon.mainorder"%>
<%@ page import="java.util.Vector"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<link rel="stylesheet" href="maincss.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
  <script src="https://www.gstatic.com/charts/loader.js"></script>


<%	
	dbcon dbc = new dbcon();
	Vector<mainorder> v = dbc.mainorder();
	Vector<String> main = dbc.mainnumber();
%>
<script>
var request = new XMLHttpRequest();
var fcresult = "";
var wtresult = "";
google.load('visualization', '1.0', {'packages':['corechart']});
function fcChart() {
	var data = new google.visualization.DataTable;
	data.addColumn('string', '설비');
	data.addColumn('number', '가동');
	data.addColumn('number', '비가동');
	data.addRows(fcresult);
	var opt = {
		width: '100%',
		height:'100%',
		vAxis:{maxValue:100},
		hAxis:{viewWindowMode:'max',
				maxValue:30,}
	};

	var chart = new google.visualization.ColumnChart(
			document.getElementById('fcdiv'));
	chart.draw(data, opt);
}

function wtChart() {
	var data = new google.visualization.DataTable;
	data.addColumn('string', '월');
	data.addColumn('number', 'WT');
	data.addRows(wtresult)
    var options = {
    };

    var chart = new google.visualization.LineChart(document.getElementById('wtdiv'));
    chart.draw(data, options);
  }


function fisrtchart(){
	request.open("Post", "../fcchart", true);
	request.onreadystatechange = fisrtresult;
	request.send(null);
}

function fisrtresult(){
	if(request.readyState == 4 && request.status == 200){
		var object = eval('(' + request.responseText + ')');
		fcresult = object.fcresult;
		wtresult = object.wtresult;
		draw();
	}
}
function draw(){
	google.setOnLoadCallback(fcChart);
	google.setOnLoadCallback(wtChart);
	
}
</script>
</head>
<body style="background:rgb(238, 237, 237);">
	<div class="panel panel-default orderbox"  style="border:0px; display:flex; height:150px; background:rgb(238, 237, 237); box-shadow:none;">
	<div class="small-box bg-info" style="flex:1; margin-bottom:0px; margin-right:15px;">
              <div class="inner">
                <h3><%=main.get(0)%></h3>

                <p style="font-size:12pt">진행중인 수주</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a class="small-box-footer" style="position:absolute; bottom:0; width:100%;" id="orderinfo">More info <i class="fas fa-arrow-circle-right" style="bottom:0;"></i></a> 
              
              <script>
              	$("#orderinfo").on("click",function(){
              		window.open("../statusProgress/statusProgress.jsp");
              	})
              </script>
    </div>
  	<div class="small-box bg-success" style="flex:1; margin-bottom:0px; margin-left:15px; margin-right:15px;">
              <div class="inner">
                <h3><%=main.get(1)%></h3>

                <p style="font-size:12pt">진행중인 외주공정</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="../Outsourcing/outsourcing.jsp" class="small-box-footer" style="position:absolute; bottom:0; width:100%;">More info <i class="fas fa-arrow-circle-right"></i></a>
    </div>	
	<div class="small-box bg-warning" style="flex:1; margin-bottom:0px; margin-left:15px; margin-right:15px;">
              <div class="inner">
                <h3><%=main.get(2)%></h3>
                <p style="font-size:12pt">설비 상태</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="../performance_by_facility/performance_by_facility.jsp" class="small-box-footer" style="position:absolute; bottom:0; width:100%;">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
	<div class="small-box bg-danger" style="flex:1; margin-bottom:0px; margin-left:15px;">
              <div class="inner">
                <h3><%=main.get(3) %></h3>
                <p style="font-size:12pt">불량</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="../faulty/faulty.jsp" class="small-box-footer" style="position:absolute; bottom:0; width:100%;">More info <i class="fas fa-arrow-circle-right"></i></a>
    </div>			
</div>
	<div class="panel panel-default border orderbox"  style="border:0px">
			<div class="panel-heading">
				<div style="height: 40px;">
					<h5 class="panel-title" style="float: left; margin-top: 10px;">금월 진행 수주</h5>
				</div>
			</div>
			<div class="panel-body">
				<iframe id="pframe" src="../statusProgress/statusProgress.jsp" frameborder="0px" style="width: -webkit-fill-available; height: 300px;"></iframe>
			</div>
	</div>
	<div class = "row" style="margin-left: 1em; margin-right: 1em; display:flex;">
		<div class="panel panel-default border wtbox" style="flex:1;">
			<div class="panel-heading" style="border:3px solid rgb(25, 30, 65);; border-bottom: 0px; border-right: 0px; border-left: 0px;">
				<div style="height: 40px;">
					<h5 class="panel-title" style="float: left; margin-top: 10px;">월별 WT</h5>
				</div>
			</div>
			<div class="panel-body" id="wtdiv">
				
			</div>
		</div>
		<div class="panel panel-default border facilitybox" style="flex:1;">
			<div class="panel-heading" style="border:3px solid rgb(25, 30, 65);; border-bottom: 0px; border-right: 0px; border-left: 0px;">
				<div style="height: 40px;">
					<h5 class="panel-title" style="float: left; margin-top: 10px;">설비 가공 실적 현황</h5>
				</div>
			</div>
			<div class="panel-body" id="fcdiv">
				
			</div>
		</div>
	</div>
	<div class="panel panel-default border ordertablebox" style="margin-top:1em;">
			<div class="panel-heading" style="border:3px solid rgb(25, 30, 65);; border-bottom: 0px; border-right: 0px; border-left: 0px;">
				<div style="height: 40px;">
					<h5 class="panel-title" style="float: left; margin-top: 10px;">설비 가공 실적 현황</h5>
				</div>
			</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover" id="ordertable" style="font-size:14px">
					<thead class="tablehead">
						<th style="width: 22%;">수주명</th>
						<th style="width: 17%;">수주구분</th>
						<th style="width: 17%;">수주제품</th>
						<th style="width: 17%;">고객사명</th>
						<th style="width: 17%;">수주일</th>
					</thead>
					<tbody id = "ordertbody">
						<%
						for(int i=0; i<v.size(); i++){%>
							<tr>
								<td><%=v.get(i).getOrdername()%></td>	
								<td><%=v.get(i).getOrderstatus()%></td>	
								<td><%=v.get(i).getCar_name()%></td>	
								<td><%=v.get(i).getOrder_com_id()%></td>	
								<td><%=v.get(i).getOrder_date().substring(0,10)%></td>	
							</tr>
						<%} %>
					</tbody>
				</table>
			</div>
		</div>
	<script>
		fisrtchart();
	</script>
</body>
</html>
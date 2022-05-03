<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"%>
<%@ page import= "defectivePerform.DefectivePerform"%>
<!DOCTYPE html>
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
<link rel="stylesheet" href="defecivePcontent.css?ver012">
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

<title>불량현황</title>
<jsp:useBean id="dao" class="defectivePerform.dPerformDAO" />
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
var request = new XMLHttpRequest();
var comresult ="";
google.charts.load('current', {
	'packages' : [ 'bar' ]
});

<!-- 테이블 셋팅 -->
$(document).ready(function(){
	tsetting();
});

function drawChart() {
	
	var data = new google.visualization.DataTable();
	   
	   data.addColumn('string', '월');
	   data.addColumn('number', '발생');
	   data.addColumn('number', '해결');
	   data.addRows(comresult);
	   
	   var options = {
	      chart : {
	         title : '',
	      }
	   };
	   var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	 
	   chart.draw(data, google.charts.Bar.convertOptions(options));
}

function drawChart2() {
	
	var data = new google.visualization.DataTable();
	   
	   data.addColumn('string', '월');
	   data.addColumn('number', '수주');
	   data.addColumn('number', '자재 입고');
	   data.addColumn('number', '공정');
	   data.addRows(procresult);
	   
	   var options = {
	      chart : {
	         title : '',
	      }
	   };

	  
	  	var chart2 = new google.charts.Bar(document.getElementById('columnchart_material2'));

	   	chart2.draw(data, google.charts.Bar.convertOptions(options));

	   
}

function fisrtchart(){
	var year = document.getElementById("inputsearch").value;
	request.open("Post", "./dServlet?year="+year, true);
	request.onreadystatechange = fisrtresult;
	request.send(null);
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
	google.setOnLoadCallback(drawChart);
	google.setOnLoadCallback(drawChart2);
	//google.charts.setOnLoadCallback(drawChart);
	//google.charts.setOnLoadCallback(drawChart2);

}
function yclick(){
	var year = document.getElementById("inputsearch").value;
	request.open("Post", "./dServlet?year="+year, true);
	request.onreadystatechange = fisrtresult;
	request.send(null);
	tsetting();
}

function tsetting(){
	d=$("#inputsearch").val();
	$.ajax({
        type:"GET",
        url:"./dtable.jsp",
        data:{date:d},
        dataType:"html",
        success:function(data){
            $("#dtable").html(data);
        }
    });
}
</script>


</head>
<body>
	<div class="panel panel-default border searchbox">
		<div class="panel-body">
			조회년도 
			<select id="inputsearch" name="searchyear" onchange="yclick()">
				<%
					ArrayList<String> u=dao.getfdate();
					if(u != null){
						for(int i=0; i<u.size(); i++){
					%>
				<option value="<%= u.get(i) %>"><%= u.get(i) %></option>
				<%
						}
					}
				%>
			</select>
		</div>
		
	</div>

	<div class="row">
		<h1 class="panel panel-body title searchbox gtitle">월별 불량/처리 건수</h1>
		<div class="graph" id="columnchart_material"></div>

	</div>

	<div class="row">
		<h1 class="panel panel-body title searchbox gtitle">유형별 불량 건수</h1>
		<div class="graph" id="columnchart_material2"></div>
	</div>

	<div class="row">
		<div id = "dtable"></div>
	</div>


<script>
		fisrtchart();
</script>
</body>
</html>

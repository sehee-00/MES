<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"%>
<%@ page import= "consumables.Consumables"%>
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
<link rel="stylesheet" href="consumables.css?ver005">
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


<title>소모품 현황</title>

<jsp:useBean id="dao" class="consumables.CDAO" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
		
	<!-- 테이블 셋팅 -->
	$(document).ready(function(){
		tsetting();
	});

	var request = new XMLHttpRequest();
	var cresult ="";
	google.charts.load('current', {'packages':['bar']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = new google.visualization.DataTable();

		   data.addColumn('string', '');
		   data.addColumn('number', '금액');
		   console.log(cresult);
		   data.addRows(cresult);

		var options = {
		  chart: {
		    title: '',
		  }
		};

		var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
     	}
      
	//초기 기간에 맞는 데이터 조회
	function fisrtchart(){
		var cdate = document.getElementById("Cdate").value;
		var cedate = document.getElementById("CEdate").value;
		request.open("Post", "./Csurvlet?cdate=" + cdate + "&cedate=" + cedate, true);
		request.onreadystatechange = fisrtresult;
		request.send(null);
	}
	
	//그래프에 그릴 데이터 받아오기
	function fisrtresult(){
		if(request.readyState == 4 && request.status == 200){
			var object = eval('(' + request.responseText + ')');
			cresult = object.cresult;
			draw();  
		}
	}
	//그래프 그리기
	function draw(){
		google.setOnLoadCallback(drawChart);
	}
	//기간을 변경하여 검색하였을 때 
	function yclick(){
		var cdate = document.getElementById("Cdate").value;
		var cedate = document.getElementById("CEdate").value;
		request.open("Post", "./Csurvlet?cdate=" + cdate + "&cedate=" + cedate, true);
		request.onreadystatechange = fisrtresult;
		request.send(null);
		tsetting();
	}
	
	//초기 테이블 세팅
	function tsetting(){
		d=$("#Cdate").val();
		e=$("#CEdate").val();
		$.ajax({
		type:"GET",
		url:"./ctable.jsp",
		data:{start:d, end:e},
		dataType:"html",
		success:function(data){
		    $("#ctable").html(data);
		}
	    });
	}
	</script>
</head>
<body>
	<div class="title">Dashboard/소모품 현황</div>
	<div class="panel row ">
		<div class="panel-body">
			<div>
				기간 : 
				<input type="date" name="dates" id="Cdate" class="form-control dateT" onchange="yclick();" style="width:10%"/>
				
				-
				<input type="date" name="dates" id="CEdate" class="form-control dateT" onchange="yclick();" style="width:10%"/>
				
				
			</div>
		</div>
	</div>

	<div class="panel row">
		<div class="graph" id="columnchart_material"></div>
	</div>
	
	<div class="panel row">
		<div id = "ctable"></div>
	</div>
<script>
		fisrtchart();
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="dbcon.dbcon"%>
<%@ page import="dbcon.facilitiesdb"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%
dbcon db = new dbcon();
Vector<facilitiesdb> fc = db.facilitiestable();
Vector<String> facilities_status = db.selectfacilities_status();
int lastpage = (fc.size()-1)/10 + 1;
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
<link rel="stylesheet" href="facilites.css">

<title>Insert title here</title>
<script>
var request = new XMLHttpRequest();
var hlastpage = <%=lastpage%>;
var paging = 1;
$(function(){
    $("#facilitiestabletbody tr").click(function(){
    	var tr = $(this);
    	var td = tr.children();
        $("#facilities_name").val(td.eq(0).text());
        $("#facilities_status").val(td.eq(3).text());
        $("#pay").val(td.eq(4).text());
        $("#using").val(td.eq(1).text());
        $("#using_all_day").val(td.eq(5).text());
        $("#facilities_start").val(td.eq(6).text());
        $("#facilities_end").val(td.eq(7).text());      
        
        if(td.eq(5).text() == "Y"){
        	document.getElementById("facilities_time").style.display = 'none';
        }
        else{
    		document.getElementById("facilities_time").style.display = 'flex';
    	}
    });
});

function selectalldayY(){
	var selectoptions = document.getElementById("using_all_day");
	var selectval = selectoptions.options[selectoptions.selectedIndex].text;
	if(selectval == "Y"){
		document.getElementById("facilities_time").style.display = 'none';
	}
	else{
		document.getElementById("facilities_time").style.display = 'flex';
	}
}

function pagenation(page){
	var pagetable = document.getElementsByName("page" + page);

	for(var i=1; i<=hlastpage; i++){
		var nopagetable = document.getElementsByName("page" + i);
		for(var j=0; j<nopagetable.length; j++){
			nopagetable[j].style.display = "none";
		}
	}
	for(var i=0; i<pagetable.length; i++){
		pagetable[i].style.display = "";	
	}
	paging = page;
}

function previous(){
	if(paging > 1){
		paging -= 1;
		pagenation(paging);
	}
}

function next(){
	if(paging < hlastpage){
		paging += 1;
		pagenation(paging);
	}
}

function uladd(lastpage){
	var ul_list = $('#pageul');
	ul_list.empty();
	ul_list.append('<li class="page-item pages" id="previous"' + i +'" onclick="previous()"><a class="page-link">Previous</a></li>')
	for(var i=1; i<=lastpage; i++){
		ul_list.append('<li class="page-item pages" id="page"' + i +'" onclick="pagenation(' + i + ')"><a class="page-link">' + i + '</a></li>')	
	}
	ul_list.append('<li class="page-item pages" id="next"' + i +'" onclick="next()"><a class="page-link">Next</a></li>')
}

function search(){
	var searchword = document.getElementById("search").value;
	request.open("Post", "http://localhost:8080/MES/searchfacilities?searchword=" + searchword, true);
	request.onreadystatechange = searchfacilities;
	request.send(null);
}

function searchfacilities(){
	var facilitiestable = document.getElementById("facilitiestabletbody");
	var resultpage = 0;
	if(request.readyState == 4 && request.status == 200){
		facilitiestable.innerHTML = "";
		var object = eval('(' + request.responseText + ')');
		var result = object.result;
		for(var i=0; i<result.length; i++){
			var row = facilitiestable.insertRow(facilitiestable.rows.length);
			var resultpage = parseInt(i/10) + 1;
			$(row).attr('name', 'page' + resultpage);
			for(var j=0; j < result[i].length; j++){				
				var cell = row.insertCell(j);
				if(j > 2){
					cell.innerHTML = result[i][j].value;
					cell.style.display = 'none';
				}
				if(j == 2){
					cell.innerHTML = '<input type="button" class="btn" value="인쇄" style="background: gray; color: white;">'
				}
				else{
					cell.innerHTML = result[i][j].value;
				}
			}
		}
		hlastpage = parseInt((result.length-1)/10)+1
		pagenation(1);
		uladd(hlastpage);
		paging = 1;
	}
	$(function(){
	    $("#facilitiestabletbody tr").click(function(){
	    	var tr = $(this);
	    	var td = tr.children();
	        $("#facilities_name").val(td.eq(0).text());
	        $("#facilities_status").val(td.eq(3).text());
	        $("#pay").val(td.eq(4).text());
	        $("#using").val(td.eq(1).text());
	        $("#using_all_day").val(td.eq(5).text());
	        $("#facilities_start").val(td.eq(6).text());
	        $("#facilities_end").val(td.eq(7).text());      
	        
	        if(td.eq(5).text() == "Y"){
	        	document.getElementById("facilities_time").style.display = 'none';
	        }
	        else{
	    		document.getElementById("facilities_time").style.display = 'flex';
	    	}
	    });
	});
}

function resetevent(){
	document.getElementById("facilities_time").style.display = 'flex';
}

</script>
</head>
<body>
	<div class="title">기준정보 관리 / 설비 관리</div>
	<div class="row">
		<div class="panel panel-default border boardlistbox col-md-6">
			<div class="panel-heading" style="height: 60px;">
				<div style="height: 40px;">
					<h5 class="panel-title" style="float: left; margin-top: 10px;">설비
						관리</h5>
				</div>
			</div>
			<div class="panel-body">
				<div style="margin-bottom: 20px;">
					<h5 style="float: left; margin-right: 10px;">검색 :</h5>
					<input id="search" type="text" onkeyup="search()">
				</div>
				<table class="table table-bordered table-hover" id="facilitiestable">
					<thead class="tablehead">
						<th style="width: 50%;">설명</th>
						<th style="width: 40%;">사용여부</th>
						<th style="width: 10%;"></th>
					</thead>
					<tbody id="facilitiestabletbody">
						<%
						for (int i = 0; i < fc.size(); i++) {
							int pageid = i/10 + 1;
						%>
						<tr name="page<%=pageid%>">
							<td><%=fc.get(i).getFacilities_name()%></td>
							<td><%=fc.get(i).getUsing()%></td>
							<td><input type="button" class="btn" value="인쇄"
								style="background: gray; color: white;"></td>
							<td style="display:none"><%=fc.get(i).getFacilities_status()%></td>
							<td style="display:none"><%=fc.get(i).getPay()%></td>
							<td style="display:none"><%=fc.get(i).getUsing_all_day()%></td>
							<td style="display:none"><%=fc.get(i).getFacilities_start()%></td>
							<td style="display:none"><%=fc.get(i).getFacilities_end() %></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<ul class="pagination justify-content-end" id="pageul">

				</ul>
				<script>
					pagenation(1);
					uladd(hlastpage);
				</script>
			</div>
		</div>
		<div class="panel panel-default border boardinputbox col-md-6">
			<div class="panel-heading" style="height: 60px;">
				<h5 class="panel-title" style="float: left; margin-top: 10px;">설비
					등록/수정</h5>
			</div>
			<div class="panel-body">
				<form>
				<table style="border: 0; width: 98%; margin-left: 10px;">
					<tr>
						<td>
							<div style="display: flex">
								<div style="flex: 1; margin-right: 30px;">
									<label for="boardnuminput">설비명<span style="color: red;">*</span></label>
									<input type="text" id="facilities_name" name="nfacilities_name" class="form-control">
								</div>
								<div style="flex: 1;">
									<label for="writedayinput">설비상태 <span
										style="color: red;">*</span></label> 
									<select id="facilities_status" name="nfacilities_status" class="form-control">
										<option value="" selected="selected" hidden="hidden"></option>
										<%
										for(int i=0; i<facilities_status.size(); i++){ %>
											<option value=<%=facilities_status.get(i)%>><%=facilities_status.get(i)%></option>
										<%}%>
									</select>
								</div>
								<div style="flex: 1; margin-left: 30px;">
									<label>설비대금(원)</label> 
									<input type="text" id="pay" name="npay" class="form-control">
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div style="margin-top: 10px; display: flex;">
								<div style="flex: 1">
									<label for="boardtitleinput">사용여부 <span
										style="color: red;">*</span></label> 
									<select id="using" name="nusing" class="form-control">
										<option value="" selected="selected" hidden="hidden"></option>
										<option value="Y">Y</option>
										<option value="N">N</option>
									</select>
								</div>
								<div style="flex: 1; margin-left: 30px;">
									<label>24시간여부 <span style="color: red;">*</span></label> 
									<select id="using_all_day" name="nusing_all_day" class="form-control" onchange="selectalldayY()">
										<option value="" selected="selected" hidden="hidden"></option>
										<option value="Y">Y</option>
										<option value="N">N</option>
									</select>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group " id="facilities_time" style="margin-top: 10px; display:flex;">
								<div style="flex: 1">
									<label for="boardtitleinput">설비가동 시작 시간 <span
										style="color: red;">*</span></label> 
										<input type="time" id="facilities_start" name="nfacilities_start" class="form-control">
								</div>
								<div style="flex: 1; margin-left: 30px;">
									<label>설비가동 종료 시간  <span style="color: red;">*</span></label> 
									<input type="time" id="facilities_end" name="nfacilities_end" class="form-control">
								</div> 
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="buttongruops">
				<input class="btn btn-primary" type="reset" value="초기화"
					id="boardreset" onclick="resetevent()"/> 
					<input class="btn btn-primary" type="submit" value="등록" formaction="./insertfacilities.jsp"> 
					<input class="btn btn-danger" type="submit" value="삭제" formaction="./deletefacilities.jsp">
			</div>
			</form>
		</div>
	</div>
</body>
</html>
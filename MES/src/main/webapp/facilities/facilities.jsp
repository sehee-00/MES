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
<link rel="stylesheet" href="facilities.css?ver02">

<title>Insert title here</title>
<script>
var request = new XMLHttpRequest();
var hlastpage = <%=lastpage%>;
var paging = 1;
var deletearr = new Array();
deletearr.push("aa");
deletearr.push("bb");
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
        $("#facilities_date").val(td.eq(8).text());
        var facilities_name = td.eq(0).text();
        
        var imgname = td.eq(10).text();
		if(imgname != 'null'){
			document.getElementById("img_div").innerHTML = '<img style="width: 150px;" src="../facilitiesupload/' + imgname + '">'
		}
		else{
			document.getElementById("img_div").innerHTML = "";
		}
        
        if(td.eq(5).text() == "Y"){
        	document.getElementById("facilities_time").style.display = 'none';
        }
        else{
    		document.getElementById("facilities_time").style.display = 'flex';
    	}
        request.open("Post", "../facilitiescheck?facilities_name=" + facilities_name, true);
    	request.onreadystatechange = getcontent;
    	request.send(null);
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
	for(var i=1; i<=hlastpage; i++){
		document.getElementById('a' + i).style.color = 'rgb(51,122,183)';
		document.getElementById('a' + i).style.background = 'white';	
		document.getElementById('aprevious').style.color = 'rgb(51,122,183)';
		document.getElementById('anext').style.color = 'rgb(51,122,183)';
	}
	document.getElementById('a' + page).style.background = 'rgb(51,122,183)';
	document.getElementById('a' + page).style.color = 'white';
	if(page == 1){
		document.getElementById('aprevious').style.color = 'gray';
	}
	if(page == hlastpage){
		document.getElementById('anext').style.color = 'gray';
	}
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
	ul_list.append('<li class="page-item pages" id="previous"' + i +'" onclick="previous()"><a id="aprevious" class="page-link" style="color:rgb(51,122,183);">Previous</a></li>')
	for(var i=1; i<=lastpage; i++){
		ul_list.append('<li class="page-item pages" id="page"' + i +'" onclick="pagenation(' + i + ')"><a id="a' + i + '" class="page-link" style="color:rgb(51,122,183);">' + i + '</a></li>')	
	}
	ul_list.append('<li class="page-item pages" id="next"' + i +'" onclick="next()"><a id="anext" class="page-link" style="color:rgb(51,122,183);">Next</a></li>')
}

function search(){
	var searchword = document.getElementById("search").value;
	request.open("Post", "../searchfacilities?searchword=" + searchword, true);
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
			for(var j=0; j < result[i].length + 1; j++){				
				if(j > 2){
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j-1].value;
					cell.style.display = 'none';
				}
				else if(j == 2){
					var cell = row.insertCell(j);
					cell.innerHTML = '<input type="button" class="btn" value="인쇄" style="background: gray; color: white;">'
				}
				else{
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
		hlastpage = parseInt((result.length-1)/10)+1
		uladd(hlastpage);
		pagenation(1);
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
	        $("#facilities_date").val(td.eq(8).text());
	        var facilities_name = td.eq(0).text();
	        
	        var imgname = td.eq(10).text();
			if(imgname != 'null'){
				document.getElementById("img_div").innerHTML = '<img style="width: 150px;" src="../facilitiesupload/' + imgname + '">'
			}
			else{
				document.getElementById("img_div").innerHTML = "";
			}
	        if(td.eq(5).text() == "Y"){
	        	document.getElementById("facilities_time").style.display = 'none';
	        }
	        else{
	    		document.getElementById("facilities_time").style.display = 'flex';
	    	}
	        request.open("Post", "../facilitiescheck?facilities_name=" + facilities_name, true);
	    	request.onreadystatechange = getcontent;
	    	request.send(null);
	    });
	});
}

function getcontent(){
	var table = document.getElementById("facilitieschecktbody");
	if(request.readyState == 4 && request.status == 200){
		table.innerHTML = "";
		var object = eval('(' + request.responseText + ')');
		var result = object.result;
		for(var i=0; i<result.length; i++){
			var row = table.insertRow(table.rows.length);
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);

			cell1.innerHTML = '<input type="button" id="' + result[i][0].value + '" value="삭제" onclick="deleterow(this)">';
			cell2.innerHTML = '<input type="text" style="width:95%" name="content" value = "' + result[i][1].value + '">';
			cell3.innerHTML = '<input type="text" value="' + result[i][0].value + '" name="num">';
			
			cell1.style.textAlign = 'center';
			cell2.style.textAlign = 'center';
			cell3.style.display = 'none';			
		}
	}
}

function resetevent(){
	document.getElementById("facilities_time").style.display = 'flex';
}

function insertform(frm){
	var facilities_name = document.getElementById("facilities_name");
	var facilities_status = document.getElementById("facilities_status");
	var pay = document.getElementById("pay");
	var using = document.getElementById("using");
	var using_all_day = document.getElementById("using_all_day");
	var facilities_start = document.getElementById("facilities_start");
	var facilities_end = document.getElementById("facilities_end");
	var facilities_date = document.getElementById("facilities_date");
	
	var check = 0
	if (check == 0 && facilities_name.value == ""){
		alert("확인");
		check = 1;
	}
	
	if (check == 0 && facilities_status.value == ""){
		alert("확인");
		check = 1;
	}
	
	if (check == 0 && pay.value == ""){
		alert("확인");
		check = 1;
	}
	
	if (check == 0 && using.value == ""){
		alert("확인");
		check = 1;
	}
	
	if (check == 0 && using_all_day.value == ""){
		alert("확인");
		check = 1;
	}
	if (using_all_day.value == 'N'){
		if (check == 0 && facilities_start.value == ""){
			alert("확인");
			check = 1;
		}
		if (check == 0 && facilities_end.value == ""){ 
			alert("확인");
			check = 1;
		}
	}
	if(facilities_date.value == ""){
		alert("확인");
		check = 1;
	}
	var filecheck = document.getElementById("item_img").value;
	if(check == 0 && !filecheck){
		frm.action = './insertfacilities.jsp';
		frm.submit();
	}
	
	if(check == 0 && filecheck){
		frm.action = '../facilitiesimg'
		frm.enctype = 'multipart/form-data';
		frm.method = 'post';
		frm.submit();
	}	
	
}

function deleteform(frm){
	var facilities_name = document.getElementById("facilities_name");
	var check = 0 
	if(facilities_name == ""){
		alert("확인");
		check = 1;
	}
	if(check == 0){
		frm.action = './deletefacilities.jsp';
		frm.submit();
	}
}

function addcheck(){
	var table = document.getElementById("facilitieschecktbody");
	var row = table.insertRow(table.rows.lenght);
	var cell1 = row.insertCell(0);
	var cell2 = row.insertCell(1);
	var cell3 = row.insertCell(2);

	cell1.innerHTML = '<input type="button" id="0" value="삭제" onclick="deleterow(this)">';
	cell2.innerHTML = '<input type="text" style="width:95%" name="content">';
	cell3.innerHTML = '<input type="text" value="0" name="num">';
	cell1.style.textAlign = 'center';
	cell2.style.textAlign = 'center';
	cell3.style.display = 'none';
	
}

function deleterow(obj){
	var row = obj.parentElement.parentElement;
	var table = document.getElementById("deletetable");
	var row1 = table.insertRow(table.rows.lenght);
	var cell = row1.insertCell(0);
	cell.innerHTML = '<input type="text" value="' + obj.id + '" name="deletenum">';
	row.remove();
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
							<td style="display:none"><%=fc.get(i).getFacilities_date() %></td>
							<td style="display:none"><%=fc.get(i).getFacilities_priority() %></td>
							<td style="display:none"><%=fc.get(i).getFacilities_img() %></td>
							
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<ul class="pagination justify-content-end" id="pageul">

				</ul>
				<script>
					uladd(hlastpage);
					pagenation(1);
				</script>
			</div>
		</div>
		<div class="panel panel-default border boardinputbox col-md-6">
			<div class="panel-heading" style="height: 60px;">
				<h5 class="panel-title" style="float: left; margin-top: 10px;">설비
					등록/수정</h5>
			</div>
			<div class="panel-body">
				<form action="./insertfacilities.jsp" onsubmit="return insertcheck()">
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
					<tr>
						<td>
							<div class="form-group " id="facilities_time" style="margin-top: 1px; display:flex;">
								<div style="flex: 1">
									<label for="boardtitleinput">설비 구매 날짜 <span
										style="color: red;">*</span></label> 
										<input type="date" id="facilities_date" name="nfacilities_date" class="form-control">
								</div>
								<div style="flex: 1; margin-left: 30px;">
									<label>우선순위 </label> 
									<input type="number" id="facilities_priority" name="nfacilities_priority" class="form-control">
								</div> 
							</div>
						</td>
					</tr>
					<tr>
                     <td>
                        <div class="form-group image">
                           <label for="facilities_image">도면이미지</label>
                           <input type="file" id="item_img" name="img" value="파일 선택" accept="image/gif, image/jpeg, image/png" />
                        </div>
                     </td>
                  </tr>
                  <tr>
                  	<td>
                  		<div id="img_div" style="margin-top:10px"></div>
                  	</td>
                  </tr>
                  <tr>
                  	<td>
                  		<label for="facilities_image" style="margin-top:10px;">설비일상점검 항목</label>
                  		<input type="button" value="항목추가" onclick="addcheck()">
                  	</td>
                  </tr>
				  <tr>
				  	<table class="table table-bordered table-hover" id="facilitieschecktable">
					<thead class="tablehead">
						<th style="width: 10%;"></th>
						<th style="width: 90%;">내용</th>
					</thead>
					<tbody id="facilitieschecktbody">
						<td style="display:none">
						</td>
					</tbody>
				</table>
				  </tr>
			</table>
			<table id="deletetable">
				<tr>
					<td>
					</td>
				</tr>
			</table>
			</div>
			<div class="buttongruops">
				<input class="btn btn-primary" type="reset" value="초기화"
					id="boardreset" onclick="resetevent()"/> 
					<input class="btn btn-primary" type="button" value="등록" onclick="insertform(this.form)"> 
					<input class="btn btn-danger" type="button" value="삭제" onclick="deleteform(this.form)">
			</div>
			</form>
		</div>
	</div>
</body>
</html>
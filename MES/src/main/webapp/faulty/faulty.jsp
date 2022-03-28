<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="faulty.Faulty"%>
<%@ page import="faulty.FaultyDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="dao" class="faulty.FaultyDAO" />
<%
request.setCharacterEncoding("UTF-8");
%>
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
<link rel="stylesheet" href="faultycontent.css?ver04">
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

<meta charset="UTF-8">
<title>불량관리</title>
</head>

<body id=faultyp>

	<div class="title">작업 관리/불량 관리</div>
	<div class="panel panel-default border searchbox">
		<div class="panel-body">
			
			검색:&nbsp;&nbsp;&nbsp;
			<input type="text" name="searchinput" class="form-control searchtitle" id="searchinput"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			발생일자:&nbsp;&nbsp;&nbsp;
			<input type="text" name="dates" class="form-control searchtitle"/>
		</div>
	</div>

	<script>
		
		$('input[name="dates"]').daterangepicker({
			timePicker : false,
			locale : {
				format : 'YY/MM/DD'
			},
            "startDate": "<%=dao.getstartdate()%>",   
            "endDate": new Date()
		});
	</script>

	<div class="row">
		<div class="panel panel-default border boardlistbox col-md-6">
			<div class="panel-heading">
				<h5 class="panel-title">불량 리스트</h5>
			</div>

			<div class="panel-body">
			<div id="faultyt"></div>
			</div>
		</div>
		
		<div class="panel panel-default border boardinputbox col-md-6">
		<div class="panel-heading">
			<h5 class="panel-title">불량 등록/수정</h5>
		</div>

		<div class="panel-body">
			
			<form method="post" id="faultyform">
					<input type="text" id="faultynoinput" style="display: none;" />
				<table style="border: 0; width: 98%;">
					<tr>
						<td>
							<div class="form-group ">
								<label for="linkinfoinput">링크 정보 <span style="color: red;">*</span></label> 
								<input type="text" name="link_info" class="form-control"  id="linkinfoinput" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group faulty-type">
								<label for="faulty_type">불량 유형</label>  
								<select id="faultytypeinput" name="faulty_type" class="form-control">
										<%
											ArrayList<String> t_list=dao.getftype();
											for(int i=0; i<t_list.size(); i++){
										%>
										<option value="<%= t_list.get(i) %>"><%= t_list.get(i) %></option>
										<%
											}
										%>
								</select>
							</div>

							<div class="form-group faulty-type">
								<label for="cause_of_defect">불량 원인 </label> 
								<select id="faultydefectinput" name="cause_of_defect" class="form-control">
										<%
											ArrayList<String> c_list=dao.getfcause();
											for(int i=0; i<c_list.size(); i++){
										%>
										<option value="<%= c_list.get(i) %>"><%= c_list.get(i) %></option>
										<%
											}
										%>
								</select>
							</div>

							<div class="form-group faulty-type">
								<label for="date_of_occurrence">발생 일자 </label> 
								<input type="date" id="faultydateinput" class="form-control" 
								name="date_of_occurrence" >
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group left">
								<label for="materials_cost">자재비용(원) </label> 
								<input type="text"
									id="faultymcostinput" class="form-control" name="materials_cost">
							</div>
							<div class="form-group right">
								<label for="cost">비용(원) </label> 
								<input type="text"
									id="faultycostinput" class="form-control" name="cost">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group boardtitle">
								<label for="faluty_title">불량 제목</label> 
								<input type="text" id="faultytitleinput" class="form-control" name="faluty_title">
							</div>
						</td>
					</tr>

					<tr>
						<td>
							<div class="form-group boardcontents">
								<label for="faulty_content">불량 내용</label>
								<textarea id="faultycontinput" style="resize: none;"
									class="form-control" rows="3" name="faulty_content"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group boardtitle">
								<label for="solution">해결방안</label> <input type="text"
									id="faultysoluinput" class="form-control" name="solution">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group left">
								<label for="user_id">담당자 </label>
								<select id="faultyidinput" name="user_id" class="form-control">
										<%
											ArrayList<String> u_list=dao.getfuser();
											for(int i=0; i<u_list.size(); i++){
										%>
										<option value="<%= u_list.get(i) %>"><%= u_list.get(i) %></option>
										<%
											}
										%>
								</select>
							</div>
							<div class="form-group right">
								<label for="proc_date">처리일자 </label><input type="date"
									id="faultypdateinput" class="form-control" name="proc_date">
							</div>
							<div class="form-group right" style = "display:none">
								<input type="text" id="linknum" class="form-control" name="proc_date" style = "display:none">
							</div>
							<div class="form-group right" style = "display:none">
								<input type="text" id="order_name" class="form-control" name="proc_date" style = "display:none">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="buttongruops">
								<input class="btn btn-primary" type="reset" value="초기화" id="faultyreset" /> 
								<input class="btn btn-primary" type="button" value="저장" id="faultyinsert" /> 
								<input class="btn btn-danger" type="button" value="삭제" id="deletefaulty">
							</div> 
							<script>
								
							</script>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">작업실적</h4>
	      </div>
	      <div class="modal-body" id="modalbody">
	        <table style="border: 0; width: 98%;">
        		<tr>
					<td>
						<div class="form-group one">
							<label for="process">공정</label> <input type="text"
								id="procinput" class="form-control" name="f_proc" readonly>
						</div>
						<div class="form-group two">
							<label for="order">수주제품</label> <input type="text"
								id="orderinput" class="form-control" name="f_order" readonly>
						</div>
						<div class="form-group three">
							<label for="client">고객사</label> <input type="text"
								id="clientinput" class="form-control" name="f_client" readonly>
						</div>
						<div class="form-group four">
							<label for="proc_date">납기예정일</label> <input type="text"
								id="pdateinput" class="form-control" name="f_pdate" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group one">	
							<label for="user_id">작업자</label>
							<select id="userinput" name="f_user" class="form-control" disabled>
									<%
										u_list=dao.getfuser();
										for(int i=0; i<u_list.size(); i++){
									%>
									<option value="<%= u_list.get(i) %>"><%= u_list.get(i) %></option>
									<%
										}
									%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group left">
							<label for="pay">임률</label> <input type="text"
								id="payinput" class="form-control" name="f_pay">
						</div>
						<div class="form-group right">
							<label for="facilities">설비</label>
							<select id="facilityinput" name="f_facility" class="form-control" disabled>
									<%
										ArrayList<String> faci_list=dao.getfacilities();
										for(int i=0; i<faci_list.size(); i++){
									%>
									<option value="<%= faci_list.get(i) %>"><%= faci_list.get(i) %></option>
									<%
										}
									%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group one">
							<label for="m_cost">제조원가</label> <input type="text"
								id="mcostinput" class="form-control" name="f_mcost" readonly>
						</div>
						<div class="form-group work">
							<label for="workstart">작업시작</label>
							<input type="datetime" id="wstartinput" class="form-control" name="f_wstart">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group one">
							<label for="worktotal">작업시간합계</label> <input type="text"
								id="wtotalinput" class="form-control" name="f_wtotal">
						</div>
						<div class="form-group work">
							<label for="workend">작업종료</label>
							<input type="datetime" id="wendinput" class="form-control" name="f_wend">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group ">
							<label for="remarks">비고</label> <input type="text"
								id="remarksinput" class="form-control" name="f_remarks">
						</div>
					</td>
				</tr>
	        </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
		
	<button type="button" id="modalBtn" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="display:none;"></button>


	</body>
</html>
<script>

	$('#linkinfoinput').on("click",function(e){
		let linkinfo = $("#linknum").val();
		let link = $("#linkinfoinput").val();
		
		if(link.length > 0){
			$("#modalBtn").click();		
		}
		
		$.ajax({
	        type:"GET",
	          url:"./mywork.jsp",
	          data:{linknum:linkinfo},  
	          dataType:"html",
	          success:function(data){
	              let d = JSON.parse(data);
	              if(d.proc != "null"){
	            	  $("#procinput").val(d.proc);
	              }else{
	            	  $("#procinput").val(null);
	              }
	              if(d.or != "null"){
	            	  $("#orderinput").val(d.or);
	              }else{
	            	  $("#orderinput").val(null);
	              }
	              if(d.cl != "null"){
	            	  $("#clientinput").val(d.cl);
	              }else{
	            	  $("#clientinput").val(null);
	              }
	              if(d.wo != "null"){
	            	  $("#userinput").val(d.wo);
	              }else{
	            	  $("#userinput").val(null);
	              }
	              if(d.fac != "null"){
	            	  $("#facilityinput").val(d.fac);
	              }else{
	            	  $("#facilityinput").val(null);
	              }
	              if(d.ws != "null"){
	            	  $("#wstartinput").val(d.ws);
	              }else{
	            	  $("#wstartinput").val(null);
	              }
	              if(d.we != "null"){
	            	  $("#wendinput").val(d.we);
	              }else{
	            	  $("#wendinput").val(null);
	              }
	              if(d.pd.substring(0,10) != "null"){
	            	  $("#pdateinput").val(d.pd.substring(0,10));
	              }else{
	            	  $("#pdateinput").val(null);
	              } 
	              if(d.re != "null"){
	            	  $("#remarksinput").val(d.re);
	              }else{
	            	  $("#remarksinput").val(null);
	              } 
	              if(d.pay != "null"){
	            	  $("#payinput").val(d.pay);
	              }else{
	            	  $("#payinput").val(null);
	              }
	
	              if(d.totalT != "null" && d.we != "null"){
	              	$("#wtotalinput").val(d.totalT);
	              }else{
	            	  $("#payinput").val(null);
	              }
	              if(d.mc != "null"){
		              	$("#mcostinput").val(d.mc);
	              }else{
	            	  $("#payinput").val(null);
	              }
	          }
		});
	});
	          


	
	var pnum = "1";
	
	$("#faultyreset").click(function() {
		$(".tablecontent").css({
			"background" : "white"
		});
	});
	
	
	<!-- 게시판 테이블 셋팅 -->
	$(document).ready(function(){
		tsetting();
	});
	
	<!-- 등록 -->
	$("#faultyinsert").on("click",function(){
		let fn = $("#faultynoinput").val();
		let li = $("#linkinfoinput").val();
		let ft = $("#faultytypeinput").val();
		let co = $("#faultydefectinput").val();
		let di= $("#faultydateinput").val();
		let pdi = $("#faultypdateinput").val();
		let mc = $("#faultymcostinput").val();
		let cs = $("#faultycostinput").val();
		let fti = $("#faultytitleinput").val();
		let fc = $("#faultycontinput").val();
		let so = $("#faultysoluinput").val();
		let ui = $("#faultyidinput").val();
	

		$.ajax({
			type:"POST",
			url:"./faultyinsert.jsp",
			data:{faulty_no:fn, link_info:li ,faulty_type:ft, cause_of_defect:co, date_of_occurrence:di, 
				proc_date:pdi, materials_cost:mc, cost:cs, faulty_title:fti, faulty_content:fc, solution:so, user_id:ui},
			dataType:"html",
			success:function(data){
				var d = JSON.parse(data);
				if(d.result == 1){
					alert('등록되었습니다!');
					tsetting();
					$('form').each(function(){
						this.reset();
					});
				}
				else{
					alert('실패하였습니다!');
				}
			},
			error:function(){
				alert('error');
			}
		})
	})


	
	<!-- 삭제 -->
	$('#deletefaulty').on("click",function(){
		let bnn = $("#faultynoinput").val();
		
		if(bnn != 0){
			$.ajax({
				type:"GET",
				url:"./faultydelete.jsp",
				data:{bn:bnn},
				dataType:"html",
				success:function(data){
					var d = JSON.parse(data);
					if(d.result == 1){
						alert("삭제하였습니다");
						tsetting();
						$('form').each(function(){
							this.reset();
						});
					}
					else{
						alert("실패하였습니다");
					}
				},
				error:function(){
					alert("error");
				
				}
			});
		}
	});
	
	function tsetting(){
		$.ajax({
	        type:"GET",
	        url:"./faultysearch.jsp",
	        data:{page:"1"},
	        dataType:"html",
	        success:function(data){
	            $("#faultyt").html(data);
	            
	        }
	    });
	}
	
	// 검색과 수주일 처리
    $('input[name="dates"]').on("change",function(){   // 날짜 변경에 대한 이벤트 처리 
        dates=$('input[name="dates"]').val();   // 입력한 날짜 값 저장
        input=$("#searchinput").val();   // 검색 창에 입력한 값 저장
        
        $.ajax({
           type:"GET",
             url:"./faultysearch.jsp",
             data:{page:"1", date:dates, input:input},   // 페이지=1, 입력한 날짜 및 검색 조건 넘김
             dataType:"html",
             success:function(data){
                 $("#faultyt").html(data);
           }   
        });
     });
     
     // 검색 처리
     $("#searchinput").on("keydown",function(e){   // 검색 창에 값이 입력됨에 따른 이벤트 처리
        if(e.keyCode==13){   // 엔터가 입력 됐을 때 
           input=$("#searchinput").val();
           dates=$('input[name="dates"]').val();   
        
           $.ajax({
              type:"GET",
                url:"./faultysearch.jsp",
                data:{page:"1", input:input, date:dates},
                dataType:"html",
                success:function(data){
                    $("#faultyt").html(data);
              }   
           });
        }
     });
 

	
</script>
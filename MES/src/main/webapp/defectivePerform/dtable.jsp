<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List"%>
<%@ page import= "defectivePerform.DefectivePerform"%>
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
	
<jsp:useBean id="dao" class="defectivePerform.dPerformDAO" />
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<%
	request.setCharacterEncoding("UTF-8"); 
	String d = request.getParameter("date"); 

%>
</head>
<body>
<div class="panel row">
<h1 class="title border" style="font-weight: bold">불량 공정 비용</h1>
	<table id="faultyProcCost" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th style="width: 7.1%;text-align: center;">공정</th>
					<th style="width: 7.1%;text-align: center;">1월</th>
					<th style="width: 7.1%;text-align: center;">2월</th>
					<th style="width: 7.1%;text-align: center;">3월</th>
					<th style="width: 7.1%;text-align: center;">4월</th>
					<th style="width: 7.1%;text-align: center;">5월</th>
					<th style="width: 7.1%;text-align: center;">6월</th>
					<th style="width: 7.1%;text-align: center;">7월</th>
					<th style="width: 7.1%;text-align: center;">8월</th>
					<th style="width: 7.1%;text-align: center;">9월</th>
					<th style="width: 7.1%;text-align: center;">10월</th>
					<th style="width: 7.1%;text-align: center;">11월</th>
					<th style="width: 7.1%;text-align: center;">12월</th>
					<th style="width: 7.1%;text-align: center; font-weight: bold; background-color: #e3f2fd;">합계</th>
				</tr>
			</thead>
			<tbody>
				<%ArrayList<String>p_list = dao.getProc();
				ArrayList<DefectivePerform>fp_list = dao.getfpCost(d);
				ArrayList<DefectivePerform>pc = dao.getpCost(d);
				//DefectivePerform z = dao.getMfaulty();
				//System.out.println(z.size());
				int x = 0, s = 0; 
				for(int j=0; j < p_list.size(); j++) {
				%>
				<tr>
					<td style="text-align: center;"><%= p_list.get(j) %></td>
					<%
						for(int i=1; i<=12; i++){
							if(x < fp_list.size()){
								if(p_list.get(j).equals(fp_list.get(x).getProcess()) && fp_list.get(x).getM() == i){%>
									<td style="text-align: center;"><%= fp_list.get(x).getMcost() %>원</td>
								<% 		x++; 
								}else{%>
								<td style="text-align: center;">0원</td>
							<% 	}
							}else{%>
								<td style="text-align: center;">0원</td>
							<% 	}
							
						}
					
					while(s < pc.size()){
						if(pc.get(s).getProcess().equals(p_list.get(j))){%>
							<td style="text-align: center; background-color: #e3f2fd;"><%= pc.get(s).getMcost() %>원</td>
							<% break;
						 }else{
						 	if(s+1 == pc.size()){
						 	%>
							<td style="text-align: center; background-color: #e3f2fd;">0원</td>
						<%} }
						s++;
					}
					s=0;
					%>
					
					<%
				};%>
				</tr>

				<tr style="background-color: #e3f2fd;">
					<td style="text-align: center; font-weight: bold;">합계 </td>
					<% ArrayList<DefectivePerform>ms = dao.getmSum(d);
					ArrayList<String>fps = dao.getfpSUM(d);
					int y = 0;
					for(int i=1; i<=12; i++){
						if(y < ms.size() && ms.get(y).getM() == i ){%>
							<td style="text-align: center;"><%= ms.get(y).getMcost() %>원</td>
					<% 		y++;
						}else{%>
							<td style="text-align: center;">0원</td>
					<% 	}
					};
					if (fps.get(0) != null){%>
						<td style="text-align: center;"><%= fps.get(0)%>원</td>
					<%}else{ %>
						<td style="text-align: center;">0원</td>
					<% }%>
				</tr>
			</tbody>
			
			
	</table>
</div>
<div class="panel row">
<h1 class="title border" style="font-weight: bold">불량 비용</h1>
	<table id="faultyProcCost" class="table table-bordered table-hover">
			<thead>
				<tr>
					<th style="width: 7.1%;text-align: center;">1월</th>
					<th style="width: 7.1%;text-align: center;">2월</th>
					<th style="width: 7.1%;text-align: center;">3월</th>
					<th style="width: 7.1%;text-align: center;">4월</th>
					<th style="width: 7.1%;text-align: center;">5월</th>
					<th style="width: 7.1%;text-align: center;">6월</th>
					<th style="width: 7.1%;text-align: center;">7월</th>
					<th style="width: 7.1%;text-align: center;">8월</th>
					<th style="width: 7.1%;text-align: center;">9월</th>
					<th style="width: 7.1%;text-align: center;">10월</th>
					<th style="width: 7.1%;text-align: center;">11월</th>
					<th style="width: 7.1%;text-align: center;">12월</th>
					<th style="width: 7.1%;text-align: center;">합계</th>
					
				</tr>
			</thead>
			<tbody>
			  	<tr>
					<%ArrayList<String>c_list = dao.getfCost(d);
					ArrayList<String>m = dao.getfmonth(d);
					int cnt = 0;
						for(int j=1; j <= 12; j++) {
							if(cnt < m.size()){	
								if(String.valueOf(j).equals(m.get(cnt))){ 
									if(c_list.get(cnt) != null){%>
									<td style="text-align: right; font-weight: bold;"><%= c_list.get(cnt) %>원</td>
								<% 
									}else{%>
										<td style="text-align: right; font-weight: bold;">0원</td>
									<%}
									cnt++;}
								else{ %>
									<td style="text-align: right; font-weight: bold;">0원</td>
								<% 
								 }
							}else{ %>
									<td style="text-align: right; font-weight: bold;">0원</td>
							<% 	} 
						}; %>
					<%ArrayList<String>Csum = dao.getfCostSUM(d);
					for(int j=0; j < Csum.size(); j++) {
						if(Csum.get(j) != null){%>
						<td style="text-align: right; font-weight: bold; background-color: #e3f2fd;"><%= Csum.get(j) %>원</td>
					<%}else{%>
					<td style="text-align: right; font-weight: bold; background-color: #e3f2fd;">0원</td>
					<% }
					}; %>
				</tr>
			</tbody>	
	</table>
</div>
</body>
</html>
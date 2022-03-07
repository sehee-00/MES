<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="faulty.FaultyDAO" %>
<%@ page import="faulty.Faulty" %>
<%@ page import="java.util.List" %>
<%@ page import="faulty.Workday" %>
<%@ page import="faulty.WorkdayDAO" %>


<%
	request.setCharacterEncoding("UTF-8");
	int LastListNum = -1;
	String pagenum = request.getParameter("page");
	int p = 1;
	if(pagenum != null){
		p = Integer.parseInt(pagenum);
	}
	
	String duration = request.getParameter("date");
	String startdate = null, enddate = null;
	
	if(duration != "" && duration != null){
		int index = duration.indexOf(" ");
		startdate = duration.substring(0,index);
		enddate = duration.substring(index+3);
	}
	
	if(duration == ""){
		duration = null;
	}
	
	String input = request.getParameter("input");
	if(input == ""){
		input = null;
	}
		
%>

<jsp:useBean id="dao" class="faulty.FaultyDAO"/>


<%	
	List<Faulty> list = null;
	if(duration == null && input == null){
		list = dao.getList();
		LastListNum = dao.getNext() - 1;

		
	}
	else{
		String txt_where="";
		
		if(startdate!=null && enddate!=null){
			txt_where=txt_where+" WHERE date_of_occurrence >= \'"+startdate+"\' and date_of_occurrence <= \'" +enddate +"\'";
			
			if(input!=null){
				txt_where=txt_where+" and (faulty_type like \'%"+input+"%\' or part_name like \'%"+input+
						"%\' or process like \'%"+input+"%\')";
			}
		}
		
		else if(input!=null){
			txt_where=txt_where+" and (faulty_type like \'%"+input+"%\' or part_name like \'%"+input+
					"%\' or process like \'%"+input+"%\')";
		}
		LastListNum=dao.getSearchAmount(txt_where);
		list=dao.getFaultyList(p, txt_where);
	}
	System.out.println(LastListNum);
	
%>
<table class="table table-bordered table-hover">
		<thead class="tablehead">
			<th style="width: 10%;">유형</th>
			<th style="width: 30%;">발생일자</th>
			<th style="width: 30%;">부품명</th>
			<th style="width: 30%;">공정</th>
		</thead>
<%for(Faulty b: list) {%>
		<tr class="tablecontent" id='<%= b.getFaulty_no() %>'>      
			<td id="flink" style='display:none'><%=b.getLink_info() %></td>
			<td id="ftype"><%=b.getFaulty_type() %></td>
			<td id="fdefect" style='display:none'><%=b.getCause_of_defect() %></td>
			<td id="fdate"><%=b.getDate_of_occurrence() %></td>
			<td id="fmcost" style='display:none'><%=b.getMaterials_cost() %></td>
			<td id="fcost" style='display:none'><%=b.getCost() %></td>
			<td id="ftitle" style='display:none'><%=b.getFaulty_title() %></td>
			<td id="fcont" style='display:none'><%=b.getFaulty_content() %></td>
			<td id="fsolu" style='display:none'><%=b.getSolution() %></td>
			<td id="fid" style='display:none'><%=b.getUser_id() %></td>
			<td id="fpdate" style='display:none'><%=b.getProc_date() %></td>
			<td id="fpname"><%=b.getPart_name() %></td>
			<td id="fproc"><%=b.getProcess() %></td>
			<td id="forder" style='display:none'><%=b.getOrder_name() %></td>
		</tr>
<%}; %>
		
<% if(list.isEmpty()){ %>
		<tr>
			<td colspan="4" align="center"><div>불량이 없습니다.</div></td>
		</tr>
<%}; %>
	<script>
			$(".tablecontent").click(function(){
				$(".tablecontent").css("background","white");
				$(this).css("background","lightgray");
				$('#faultynoinput').val($(this).attr("id"));

				
				if($(this).children("#forder").text()!="null" && $(this).children("#fpname").text() && $(this).children("#fproc").text()){
					$('#linkinfoinput').val('수주명: '+$(this).children("#forder").text()+', 부품명: '+$(this).children("#fpname").text()
							+', 공정: '+$(this).children("#fproc").text());
				}else{
					$("#linkinfoinput").val(null);
				}
				
				$('#faultytypeinput').val($(this).children("#ftype").text());
				$('#faultydefectinput').val($(this).children("#fdefect").text());
				$('#faultydateinput').val($(this).children("#fdate").text());
				$('#faultymcostinput').val($(this).children("#fmcost").text());
				$('#faultycostinput').val($(this).children("#fcost").text());
				
				if($(this).children("#ftitle").text()!="null"){
					$('#faultytitleinput').val($(this).children("#ftitle").text());
				}else{
					$("#faultytitleinput").val(null);
				}
				
				if($(this).children("#fcont").text()!="null"){
					$('#faultycontinput').val($(this).children("#fcont").text());
				}else{
					$("#faultycontinput").val(null);
				}
				
				if($(this).children("#fsolu").text()!="null"){
					$('#faultysoluinput').val($(this).children("#fsolu").text());
				}else{
					$("#faultysoluinput").val(null);
				}
				
				$('#faultyidinput').val($(this).children("#fid").text());
				$('#faultypdateinput').val($(this).children("#fpdate").text());
				$('#faultypnameinput').val($(this).children("#fpname").text());
				$('#faultyprocinput').val($(this).children("#fproc").text());
				$('#linknum').val($(this).children("#flink").text());
			});
	
	
	</script>
</table>
	
<ul class="pagination">
	<li><a class="preanpage">Previous</a></li>
	<%
		// 페이지네이션
		int block = p / 5 + 1;
		if(p % 5 == 0){
			block = block -1;
		}
		
		int startpage = (block-1) * 5 + 1;
		int endpage = ((LastListNum-1)/10) + 1;
	
		int endexpage = endpage;
		
		if(endexpage > 4 + startpage){
			endexpage = startpage + 4;
		}
		
		for(; startpage<=endexpage; startpage++){
	%>
		<li id="p<%=startpage%>"><a class="anpage"><%=startpage %></a></li>
		<%} %>
		<li><a class="nextanpage">Next</a></li>
</ul>
<script>
// 페이지네이션
		var pdate=null;
		var pinput=null;
		$(".anpage").removeClass("active");
		$("#p" + <%=p%>).addClass("active");
		
		$(".anpage").click(function(){
			$("li").removeClass("active");
			$(this).parent().addClass("active");
			
			var pnum = $(this).text();
			pdate=$('input[name="dates"]').val();
			pinput=$("#searchinput").val();
			
			if(pdate == "null"){
				pdate = null;
			}
			if(pinput == "null"){
				pinput = null;
			}
			
			$.ajax({
				type:"GET",
				url:"./faultysearch.jsp",
				data:{page:pnum, date:pdate, input:pinput},
				dataType:"html",
				success:function(data){
		            $("#faultyt").html(data);
		        }
			});
		});
		
		$(".preanpage").click(function(){
			$("li").removeClass("active");
			
			var k = Number($(this).parent().next().text());
			if(k != 1){
				k = k - 5;
			}
			
			$("#p" + k).addClass("active");
			
			var pnum = k;
			pdate=$('input[name="dates"]').val();
			pinput=$("#searchinput").val();
			
			
			if(pdate == "null"){
				pdate = null;
			}
			if(pinput == "null"){
				pinput = null;
			}
			
			$.ajax({
				type:"GET",
				url:"./faultysearch.jsp",
				data:{page:pnum, date:pdate, input:pinput},
				dataType:"html",
				success:function(data){
		            $("#faultyt").html(data);
		        }
			});
			
		});
		
		$(document).ready(function(){
			var kp = Number($(".preanpage").parent().next().text());
			var kn = Number($(".nextanpage").parent().prev().text());
			
			if(kp == 1){
				$(".preanpage").parent().addClass("disabled");
				$(".preanpage").css({"cursor":"Default"});
			}
			
			else{
				$(".preanpage").css({"color":"#337ab7"});
			}
			
			if(kn == <%= endpage %>){
				$(".nextanpage").parent().addClass("disabled");
				$(".nextanpage").css({"cursor":"Default"});
			}
			
			else{
				$(".nextanpage").css({"color":"#337ab7"});
			}
		});
		
		$(".nextanpage").click(function(){
			$("li").removeClass("active");
			
			var k = Number($(this).parent().prev().text());
			if(k != <%=endpage %>){
				k = k + 1; 
			}
			
			$("#p" + k).addClass("active");
			
			var pnum = k;
			pdate=$('input[name="dates"]').val();
			pinput=$("#searchinput").val();
			
			if(pdate == "null"){
				pdate = null;
			}
			if(pinput == "null"){
				pinput = null;
			}
			
			$.ajax({
				type:"GET",
				url:"./faultysearch.jsp",
				data:{page:pnum, date:pdate, input:pinput},
				dataType:"html",
				success:function(data){
		            $("#faultyt").html(data);
		        }
			});
			
		});
		
	</script>

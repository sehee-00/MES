<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="material.MaterialDAO" %>
<%@page import="material.MaterialDTO" %>
<%@page import="java.util.List" %>

<%
request.setCharacterEncoding("UTF-8");
	
	int lastboardnum = -1;
	
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
	
	String sda = request.getParameter("sdata");
	if(sda == ""){
		sda = null;
	}
%>

<jsp:useBean id="dao" class="material.MaterialDAO"/>

<%
	List<MaterialDTO> list = null;
	if(duration == null && sda == null){
		list = dao.getList(p);
		lastboardnum = dao.getNext() - 1;
	}
	
	
%>

	<table class="table table-bordered table-hover">
		<thead class="tablehead">
			<th style="width: 25%;">자재명</th>
			<th style="width: 25%;">단가(원)</th>
			<th style="width: 25%;">수량</th>
			<th style="width: 25%;">안전재고수량</th>
		</thead>
		<%for(MaterialDTO m: list) {%>
		<tr class="tablecontent" id='<%= m.getMaterials_id() %>'>      
			<td id="mname"><%=m.getMaterials_name() %></td>
			<td id="mprice"><%=m.getUnit_price() %></td>
			<td id="mstock"><%=m.getStock() %></td>
			<td id="msstock"><%=m.getSafety_stock() %></td>
			<td style='display:none' id="mtype"><%=m.getMaterials_type() %></td>
			<td style='display:none' id="mproc"><%=m.getMaterials_proc() %></td>
		</tr>
		<%}; %>
	                    
		<% if(list.isEmpty()){ %>
		<tr>
			<td colspan="4" align="center"><div>등록된 자재가 없습니다.</div></td>
		</tr>
		<%}; %>
		
		<script>
			$(".tablecontent").click(function(){
				$(".tablecontent").css("background","white");
				$(this).css("background","lightgray");
				
				$('#materialidinput').val($(this).attr("id"));
				$('#materialname').val($(this).children("#mname").text());
				$('#materialprice').val($(this).children("#mprice").text());
				$('#tmrselect').val($(this).children("#mtype").text()).select2();
				$('#mpselect').val($(this).children("#mproc").text()).select2();
				$('#materialamo').val($(this).children("#mstock").text());
				$('#materialsafeamo').val($(this).children("#msstock").text());
				
				let bnn = $(this).attr("id");
				
				$('#inputdelete').click(function(){
					$.ajax({
						type:"GET",
						url:"./materialdelete.jsp",
						data:{bn:bnn},
						success:function(){
							alert('삭제하였습니다!');
							location.href = "./material.jsp";
						}
					});
				});
			});
		</script>
	</table>
	
	<ul class="pagination">
		<li><a class="preanpage">Previous</a></li>
		<%
		int block = p/5 + 1;
		
		if(p % 5 == 0){
			block = block -1;
		}
		
		int startpage = (block-1) * 5 + 1;
		int endpage = ((lastboardnum-1)/10);
		
		if((lastboardnum-1)%10 != 0 || endpage == 0){
			endpage += 1;
		}
		
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
		$(".anpage").removeClass("active");
		$("#p" + <%=p%>).addClass("active");
		
		$(".anpage").click(function(){
			$("li").removeClass("active");
			$(this).parent().addClass("active");
			
			var pnum = $(this).text();
			var datess = "<%=request.getParameter("date") %>";
			var sda = "<%=request.getParameter("sdata") %>";
			
			if(datess == "null"){
				datess = null;
			}
			if(sda == "null"){
				sda = null;
			}
			
			$.ajax({
				type:"GET",
				url:"./materialsearch.jsp",
				data:{page:pnum, date:datess, sdata:sda},
				dataType:"html",
				success:function(data){
		            $("#boardt").html(data);
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
			var datess = "<%=request.getParameter("date") %>";
			var sda = "<%=request.getParameter("sdata") %>";
			
			if(datess == "null"){
				datess = null;
			}
			if(sda == "null"){
				sda = null;
			}
			
			$.ajax({
				type:"GET",
				url:"./materialsearch.jsp",
				data:{page:pnum, date:datess, sdata:sda},
				dataType:"html",
				success:function(data){
		            $("#boardt").html(data);
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
		})
		
		$(".nextanpage").click(function(){
			$("li").removeClass("active");
			
			var k = Number($(this).parent().prev().text());
			if(k != <%=endpage %>){
				k = k + 1; 
			}
			
			$("#p" + k).addClass("active");
			
			var pnum = k;
			var datess = "<%=request.getParameter("date") %>";
			var sda = "<%=request.getParameter("sdata") %>";
			
			if(datess == "null"){
				datess = null;
			}
			if(sda == "null"){
				sda = null;
			}
			
			$.ajax({
				type:"GET",
				url:"./materialsearch.jsp",
				data:{page:pnum, date:datess, sdata:sda},
				dataType:"html",
				success:function(data){
		            $("#boardt").html(data);
		        }
			});
			
		})
		
	</script>
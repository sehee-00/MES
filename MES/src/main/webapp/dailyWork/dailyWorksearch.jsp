<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dailyWork.DailyWorkDTO" %>
<%@page import="java.util.List" %>
<jsp:useBean id="dao" class="dailyWork.DailyWorkDAO"/>
<%
	int lastnum = -1;
	String condition = "WHERE";
	
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
	
	String wk = request.getParameter("wk");
	if(wk == ""){
		wk = null;
	}
	
	List<DailyWorkDTO> dwlist = null;
	if(duration == null && wk == null){
		dwlist = dao.getDailyWorkList(p);
		lastnum = dwlist.size();
		
	}
	else{
		
		if(startdate != null && enddate != null) {
			condition = condition + " regdate >= \'" + startdate + "\' and regdate <= \'" + enddate + "\'";
			
			if(wk != null) {
				condition = condition + " and worker like \'%" + wk + "%\'";
			}
		}
		
		else if(wk != null) {
			condition = condition + " title worker \'%" + wk + "%\'";
		}
		
		lastnum = dao.getDailyWorkListSearchNext(condition);
		dwlist = dao.getDailyWorkListSearch(p, condition);
		
	}
%>
<table class="table table-bordered table-hover">
	<thead class="tablehead">
	    <th>작업자</th>
	    <th>유형</th>
	    <th>수주명</th>
	    <th>부품명</th>
	    <th>공정</th>
	    <th>시작일</th>
	    <th>종료일</th>
	</thead>
	
	<%
	if(dwlist != null){
		for(DailyWorkDTO dto : dwlist){
	%>
	<tr class="tablecontent dwtablecontent" id=""> 
	    <td id="dwmanager"><%=dto.getWorker() %></td>
	    <td id="dwtype"><%=dto.getDwtype() %></td>
	    <td id="dworder"><%=dto.getOrder_name() %></td>
	    <td id="dwpart"><%=dto.getPart_name() %></td>
	    <td id="dwproc"><%=dto.getProcess() %></td>
	    <td id="dwstart"><%=dto.getStart_date() %></td>
	    <td id="dwend"><%=dto.getEnd_date() %></td>
	    
	    <td id="dwregdate" style="display:none;"><%=dto.getRegdate() %></td>
	    <td id="dwfaulty" style="display:none;"><%=dto.getFaulty() %></td>
	    <td id="dwcom" style="display:none;"><%=dto.getCompany() %></td>
	    <td id="dwprice" style="display:none;"><%=dto.getPrice() %></td>
	    <td id="dwwed" style="display:none;"><%=dto.getWarehousing_exp_date() %></td>
	    <td id="dwfac" style="display:none;"><%=dto.getFacilities() %></td>
	    <td id="dwsta" style="display:none;"><%=dto.getStatus() %></td>
	</tr>
	<%
		}
	}else{
	%>
	    <tr>
	        <td colspan="7" align="center"><div>등록된 작업일보가 없습니다.</div></td>
	    </tr>
	<%
	}
	%>
</table>
<script>
//테이블 열 클릭 이벤트
$(".dwtablecontent").on("click",function(){
	if($(this).children("#dwtype").text() == "사내"){
		$("#worklogmodalbtn").click();
	}
	else if(($(this).children("#dwtype").text() == "외주"){
		$("#outsoumodalbtn").click();
	}   
});
</script>
<ul class="pagination">
	<li><a class="preanpage">Previous</a></li>
	<%
	int block = p/5 + 1;
	
	if(p % 5 == 0){
		block = block -1;
	}
	
	int startpage = (block-1) * 5 + 1;
	int endpage = ((lastnum-1)/10);
	
	if(lastnum%10 != 0 || endpage == 0){
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
		var wk = "<%=request.getParameter("wk") %>";
		var date = "<%=request.getParameter("date") %>";
		
		if(sUserid == "null"){
			sUserid = null;
		}
		if(sUsername == "null"){
			sUsername = null;
		}
		
		$.ajax({
			type:"GET",
			url:"./usersearch.jsp",
			data:{page:pnum, "sUserid":sUserid, "sUsername":sUsername},
			dataType:"html",
			success:function(data){
	            $("#usert").html(data);
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
		var sUserid = "<%=request.getParameter("sUserid") %>";
		var sUsername = "<%=request.getParameter("sUsername") %>";
		
		if(sUserid == "null"){
			sUserid = null;
		}
		if(sUsername == "null"){
			sUsername = null;
		}
		
		$.ajax({
			type:"GET",
			url:"./usersearch.jsp",
			data:{page:pnum, "sUserid":sUserid, "sUsername":sUsername},
			dataType:"html",
			success:function(data){
	            $("#usert").html(data);
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
		var sUserid = "<%=request.getParameter("sUserid") %>";
		var sUsername = "<%=request.getParameter("sUsername") %>";
		
		if(sUserid == "null"){
			sUserid = null;
		}
		if(sUsernane == "null"){
			sUsername = null;
		}
		
		$.ajax({
			type:"GET",
			url:"./usersearch.jsp",
			data:{page:pnum, "sUserid":sUserid, "sUsername":sUsername},
			dataType:"html",
			success:function(data){
	            $("#usert").html(data);
	        }
		});
		
	})
	
</script>
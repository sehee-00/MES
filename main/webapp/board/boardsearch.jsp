<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.util.List" %>

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

	<jsp:useBean id="dao" class="board.BoardDAO"/>

<%	
	List<BoardVO> list = null;
	if(duration == null && sda == null){
		list = dao.getList(p);
		lastboardnum = dao.getNext() - 1;
		
	}
	else{
		String condition = "";
		
		if(startdate != null && enddate != null) {
			condition = condition + " where regdate >= \'" + startdate + "\' and regdate <= \'" + enddate + "\'";
			
			if(sda != null) {
				condition = condition + " and title like \'%" + sda + "%\'";
			}
		}
		
		else if(sda != null) {
			condition = condition + " where title like \'%" + sda + "%\'";
		}
		
		lastboardnum = dao.getSearchAmount(condition);
		list = dao.getList2(p, condition);
		
	}
%>
	<table class="table table-bordered table-hover">
		<thead class="tablehead">
			<th style="width: 10%;">No.</th>
			<th style="width: 30%;">제목</th>
			<th style="width: 30%;">작성자</th>
			<th style="width: 30%;">작성일</th>
		</thead>
		<%for(BoardVO b: list) {%>
		<tr class="tablecontent" id='<%= b.getBoard_id() %>'>      
			<td id="bnum"><%=b.getBoard_num() %></td>
			<td id="btitle" style='display:none'><%=b.getTitle() %></td>
			<%if(b.getTitle().length() > 20) {
				String subt = b.getTitle().substring(0, 20);
				b.setTitle(subt.concat("..."));
			} %>
			<td id="btitlesummary"><%=b.getTitle() %></td>
			<td id="bwriter"><%=b.getWriter() %></td>
			<td id="bregdate"><%=b.getRegdate() %></td>
			<td style='display:none' id="bcontents"><%=b.getContents() %></td>
		</tr>
		<%}; %>
	                    
		<% if(list.isEmpty()){ %>
		<tr>
			<td colspan="4" align="center"><div>게시물이 없습니다.</div></td>
		</tr>
		<%}; %>
		
		<script>
			$(".tablecontent").click(function(){
				$(".tablecontent").css("background","white");
				$(this).css("background","lightgray");
				
				$('#boardidinput').val($(this).attr("id"));
				$('#boardnuminput').val($(this).children("#bnum").text());
				$('#writedayinput').val($(this).children("#bregdate").text());
				$('#boardtitleinput').val($(this).children("#btitle").text());
				$('#boardcontentsinput').val($(this).children("#bcontents").text());
				
				let bnn = $(this).attr("id");
				
				$('#deleteboard').click(function(){
					$.ajax({
						type:"GET",
						url:"./boarddelete.jsp",
						data:{bn:bnn},
						success:function(){
							alert('삭제하였습니다!');
							location.href = "./board.jsp";
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
				url:"./boardsearch.jsp",
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
				url:"./boardsearch.jsp",
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
				url:"./boardsearch.jsp",
				data:{page:pnum, date:datess, sdata:sda},
				dataType:"html",
				success:function(data){
		            $("#boardt").html(data);
		        }
			});
			
		})
		
	</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<jsp:useBean id="dao" class="userMenu.UserMenuDAO" />

<%
	// paging을 위한 변수 초기화 및 검색 내용(조건)을 
	int lastnum = -1;
	String condition = "WHERE";
	
	String pagenum = request.getParameter("page");
	String uname = request.getParameter("sUsername");
	String uid = request.getParameter("sUserid");
	int p = 1;
	if(pagenum != null){
		p = Integer.parseInt(pagenum);
	}
	
	// 사용자 조회
	List<String[]> users = null;
	
	if(uname != null){
		if(uname.length() == 0){
			uname = null;
		}
	}
	if(uid != null){
		if(uid.length() == 0){
			uid = null;
		}
	}
	
	if(uname == null && uid == null){ //검색 없을 때
		users = dao.getUsers(p);
		lastnum = dao.getUserNext() - 1;
	}
	else{ //검색 있을 때
		if(uname != null){
			condition = condition + " user_name LIKE \'%" + uname + "%\'";
			if(uid != null){
				condition = condition + " AND user_id LIKE \'%" + uid + "%\'";
			}
		}
		else{
			condition = condition + "  user_id LIKE \'%" + uid + "%\'";
		}
		users = dao.getSearchUsers(p, condition);
		lastnum = dao.getUserNext(condition) - 1;
	}
%>

<!-- 사용자 목록 화면 요소 설정 -->
<table class="table table-bordered table-hover">
	<thead class="tablehead">
		<th style="width:50%;">사번(아이디)</th>
		<th style="width:50%;">이름</th>
	</thead>
	
	<%
	if(users != null){
		for(String[] u : users){
	%>
	<tr class="tablecontent usercontent" id="<%=u[0] %>"> 
		<td id="userid"><%=u[0] %></td>
		<td id="username"><%=u[1] %></td>
	</tr>
	<%
		}
	}else{
	%>
	<tr>
	    <td colspan="2" align="center"><div>등록된 사용자가 없습니다.</div></td>
	</tr>
	<%
	}
	%>
</table>

<script>
//사용자 선택 이벤트
$(".usercontent").on("click",function(){
	$("#umUsermenuList").removeClass("displaynone");
	$(".usercontent").css("background","white");
	$(this).css("background","lightgray");
	
	$("#seluserid").val($(this).attr("id"));
	
	$.ajax({
		type:"GET",
		url:"./userMenusearch.jsp",
		data:{uid:$(this).attr("id")},
		dataType:"html",
		success:function(data){
			$("#usermenut").html(data)
		}
	});
});
</script>

<!-- paging -->
<ul class="pagination">
	<li><a class="preanpage">Previous</a></li>
	<%
	int block = p/5 + 1;
	
	if(p % 5 == 0){
		block = block -1;
	}
	
	int startpage = (block-1) * 5 + 1;
	int endpage = ((lastnum-1)/10) + 1;
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

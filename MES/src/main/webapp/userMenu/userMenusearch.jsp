<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.HashMap" %>
<%@ page import = "java.util.Map" %>
<%@ page import = "java.util.Map.Entry" %>
<!-- 사용자별 메뉴 조회 -->
<jsp:useBean id="dao" class="userMenu.UserMenuDAO" />
 <table class="table table-bordered table-hover table-striped" id="usermenutable">
     <thead class="tablehead">
         <th style="width: 5%;"></th>
         <th>메뉴 명</th>
     </thead>

	<%
	String id = request.getParameter("uid");
	Map<String,String[]> usermenu = dao.getUserMenu(id);
	if(usermenu != null){
		for(Entry<String,String[]> menus : usermenu.entrySet()){
	%>
    <tr class="tablecontent uppermenu" id="<%= menus.getKey() %>"> 
        <td id="spicon" style="text-align: center;"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></td>
        <td id="upmenuname"><%=menus.getKey() %></td>
    </tr>
    <%
    		for(String lowermenu : menus.getValue()){
    %>
    <tr class="tablecontent displaynone" id="<%= lowermenu %>" name="<%=menus.getKey() %>"> 
        <td></td>
        <td id="lowermeneuname">&nbsp&nbsp<%=lowermenu %></td>
    </tr>
    <%
        	}
		}
	}else{
    %>
     <tr>
         <td colspan="6" align="center"><div>해당 사용자의 이용할 수 있는 메뉴가 없습니다.</div></td>
     </tr>
	<%} %>
 </table>
 <script>
//사용자별 메뉴에서 하위메뉴 열기
 $("#usermenutable .uppermenu #spicon").on("click",function(){
 	let n = $(this).parent().attr("id");
 	$("#usermenutable tr[name='"+ n +"']").toggleClass("displaynone");
 });
 </script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="standardProcess.StandardProcessPDTO" %>
<%@page import="java.util.List" %>
<jsp:useBean id="dao" class="standardProcess.StandardProcessDAO"/>
<%
request.setCharacterEncoding("UTF-8"); 
String upperprocess = request.getParameter("upper");
String padding = request.getParameter("padding");
List<StandardProcessPDTO> spLowerProcessList = dao.getLowerStandardProcessProcesses(upperprocess);
if(spLowerProcessList != null){
	for(StandardProcessPDTO pdto : spLowerProcessList){
%>
<!-- 하위 공정 검색(화면 요소 설정) -->
<tr class="tablecontent processcontent" name="<%=upperprocess %>" id="<%=pdto.getProcess_name() %>"> 
<%		if(pdto.isLowerlevel()){ %>
    <td id="spicon" name="spopenicon" style="padding-left:<%=padding %>"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></td>
<%		}else{ %>
	<td id="spicon"></td>
<%		} %> 
    <td id="spnames" style="padding-left:<%=padding %>"><%=pdto.getProcess_name() %></td>
    <td id="sptype"><%=pdto.getType() %></td>
    <td id="sppay"><%=pdto.getPay() %></td>
    <td id="sploadfac"><%=pdto.getLoad_factor() %></td>
    <td id="spusing"><%=pdto.isUsing() %></td>

    <td id="spmanager" style="display:none;"><%=pdto.getProcess_manager() %></td>
    <td style='display:none' id="mtype"></td>
    <td style='display:none' id="mproc"></td>
</tr>
<%}}%>

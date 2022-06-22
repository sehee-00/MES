<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="standardProcess.StandardProcessFDTO" %>
<%@page import="java.util.List" %>
<jsp:useBean id="dao" class="standardProcess.StandardProcessDAO"/>
<%
request.setCharacterEncoding("UTF-8"); 
String upperprocess = request.getParameter("upper");
String padding = request.getParameter("padding");
List<StandardProcessFDTO> spLowerProcessList = dao.getLowerStandardProcessFacilities(upperprocess);
if(spLowerProcessList != null){
	for(StandardProcessFDTO pdto : spLowerProcessList){
%>
<!-- 하위 설비 검색 (화면 요소 설졍) -->
<tr class="tablecontent facilitycontent" style="color: #d9534f;" name="<%=upperprocess %>" id="<%=pdto.getFacility_name() %>"> 
	<td id="spicon"></td>
    <td id="spnames" style="padding-left:<%=padding %>"><%=pdto.getFacility_name() %></td>
    <td id="sptype">설비</td>
    <td id="sppay"></td>
    <td id="sploadfac"></td>
    <td id="spusing"><%=pdto.isUsing() %></td>
</tr>
<%}}%>

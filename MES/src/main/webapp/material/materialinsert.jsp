<!-- 자재 등록 및 수정 후 결과 반환 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="material.MaterialDAO"/>
<jsp:useBean id="dto" class="material.MaterialDTO"/>

<jsp:setProperty name="dto" property="materials_id" param="mid"/>

<%
	if(dto.getMaterials_id() == 0){
		dto.setMaterials_id(dao.getNext());
	}
%>

<jsp:setProperty name="dto" property="materials_name" param="mname"/>
<jsp:setProperty name="dto" property="unit_price" param="mprice"/>
<jsp:setProperty name="dto" property="materials_type" param="mtmr"/>
<jsp:setProperty name="dto" property="materials_proc" param="mmp"/>
<jsp:setProperty name="dto" property="stock" param="mamo"/>
<jsp:setProperty name="dto" property="safety_stock" param="msafeamo"/>

<%
	int result = dao.insertMaterial(dto);
%>
{"result":<%=result %>}

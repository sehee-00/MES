<!-- 받은 게시판 정보를 토대로 등록 및 수정 후 결과 반환 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

	<jsp:useBean id="vo" class="board.BoardVO"/>
	<jsp:useBean id="dao" class="board.BoardDAO"/>
	
	<jsp:setProperty name="vo" property="board_id" param="boardid"/>
	
	<%
		if(vo.getBoard_id() == 0){
			vo.setBoard_id(dao.getNext());
		}
	%>
	
	<jsp:setProperty name="vo" property="board_num" param="num"/>
	
	<%
		if(vo.getBoard_num() == 0){
			vo.setBoard_num(dao.getNumNext());
		}
	%>
	
	<%String id = (String)session.getAttribute("id");%>
	
	<jsp:setProperty name="vo" property="writer" value="<%=id %>"/>
	<jsp:setProperty name="vo" property="regdate" param="day"/>
	
	<%
		if(vo.getRegdate() == null){
			Date from = new Date();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String to = transFormat.format(from);

			vo.setRegdate(to);
		}
	%>
	
	<jsp:setProperty name="vo" property="title" param="title"/>
	<jsp:setProperty name="vo" property="contents" param="content"/>
		
	<%int result = dao.insertBoard(vo);%>
{"result":<%=result %>}

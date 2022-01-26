<!-- 게시판 삽입 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
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
	
	<%String id = (String)session.getAttribute("id"); %>
	
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
	
	<%if(dao.insertBoard(vo) > 0){ %>
		<script>alert('완료하였습니다!'); location.href="board.jsp"</script>
	<%}else{ %>
		<script>alert('실패하였습니다!'); history.back();</script>
		<%} %>
</body>
</html>

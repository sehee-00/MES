<!-- 게시판 메인 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
    	<jsp:useBean id="dao" class="board.BoardDAO"/>
    	<%
    		request.setCharacterEncoding("UTF-8");
    	%>
    
    	<meta charset="UTF-8">
	
        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="boardcontent.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        
    </head>
    <body id="boardp">
    
        <div class="title">작업 관리/게시판</div>
        <div class="panel panel-default border searchbox">
            <div class="panel-body">
                제목:&nbsp;&nbsp;&nbsp;<input type="text" class="form-control searchtitle" name="searchdata">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                작성일:&nbsp;&nbsp;&nbsp;<input type="text" name="dates" class="form-control searchtitle" id="searchdate">
            </div>
        </div>
        
        

		<div class="row">
        <div class="panel panel-default border boardlistbox col-md-6">
            <div class="panel-heading">
                <h5 class="panel-title">게시판 리스트</h5>
            </div>

            <div class="panel-body">
            <div id="boardt"></div>
            
           
            </div>
        </div>
        
        <div class="panel panel-default border boardinputbox col-md-6">
            <div class="panel-heading">
                <h5 class="panel-title">게시판 등록/수정</h5>
            </div>

            <div class="panel-body">
                <form action="boardinsert.jsp" method="post">
                	<input type="text" id="boardidinput" name="boardid" style="display:none"/>
                    <table style="border: 0; width: 98%;">
                        <tr>
                            <td>
                            	<div class="form-group boardnum">
                                    <label for="boardnuminput">게시판 번호 <span style="color: red;">*</span></label>
                                    <input type="text" id="boardnuminput" class="form-control" name="num">
                                </div>
                                <div class="form-group writeday">
                                    <label for="writedayinput">작성일자 <span style="color: red;">*</span></label>
                                    <input type="text" id="writedayinput" class="form-control" name="day" maxlength="10">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="form-group boardtitle">
                                    <label for="boardtitleinput">게시판 제목</label>
                                    <input type="text" id="boardtitleinput" class="form-control" name="title">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="form-group boardcontents">
                                    <label for="boardcontentsinput">게시판 내용</label>
                                    <textarea id="boardcontentsinput" style="resize:none;" class="form-control" rows="7" name="content"></textarea>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="buttongruops">
                                    <input class="btn btn-primary" type="reset" value="초기화" id="boardreset"/>
                                    <input class="btn btn-primary" type="submit" value="저장"/>
                                    <input class="btn btn-danger" id="deleteboard" type="button" value="삭제"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
		</div>
		</div>
    </body>
</html>

<script>
var pnum = "1";
var dates = "";
var sda = "";

<!-- 게시판 테이블 셋팅 -->
$(document).ready(function(){
	$.ajax({
        type:"GET",
        url:"./boardsearch.jsp",
        data:{page:pnum},
        dataType:"html",
        success:function(data){
            $("#boardt").html(data);
        }
    });
});

<!-- 검색 -->
$('input[name="dates"]').daterangepicker({
    timePicker: false,
    locale:{
        format: 'YY/MM/DD'
    },
    "startDate": "<%=dao.getfdate()%>",
    "endDate": new Date()
});

$('input[name="dates"]').on("change",function(){
	dates = $('input[name="dates"]').val();
	sda = $('input[name="searchdata"]').val();
	
	$.ajax({
		type:"GET",
		url:"./boardsearch.jsp",
		data:{page:"1", date:dates, sdata:sda},
		dataType:"html",
		success:function(data){
            $("#boardt").html(data);
        }
	});
});


$('input[name="searchdata"]').on("keydown",function(e){
	
	if(e.keyCode == 13){
		sda = $('input[name="searchdata"]').val();
		dates = $('input[name="dates"]').val();
	
		$.ajax({
			type:"GET",
			url:"./boardsearch.jsp",
			data:{page:"1", date:dates, sdata:sda},
			dataType:"html",
			success:function(data){
	            $("#boardt").html(data);
	        }
		});
	};
});

<!-- 그외 셋팅 -->
$("#boardreset").click(function(){
	$(".tablecontent").css({"background":"white"});
});

$(document).on("keyup", "input[name='num']", function(e) {
	$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
});

$(document).on("keyup", "input[name='day']", function(e) {
	$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
	
	$(this).val(date_mask($(this).val()));
});

function date_mask(objValue) {
	 var v = objValue.replace("--", "-");

	    if (v.match(/^\d{4}$/) !== null) {
	        v = v + '-';
	    } else if (v.match(/^\d{4}\-\d{2}$/) !== null) {
	        v = v + '-';
	    }
	 
	    return v;
	}
</script>
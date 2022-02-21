<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
    	<meta charset="UTF-8">
	
        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

        <!--daterangepicker-->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

        <link rel="stylesheet" href="dailyWork.css">
        
    </head>
    <body id="boardp">
    
        <div class="title">Admin / 조직도 관리 / 사용자 메뉴 관리</div>
        <div class="panel panel-default border searchbox">
            <div class="panel-body">
                <span>작업자:&nbsp;&nbsp;&nbsp;<input type="text" class="form-control searchtext" name="searchid"></span>
                &nbsp;&nbsp;&nbsp;
                <span>등록일:&nbsp;&nbsp;&nbsp;<input type="text" name="dates" class="form-control searchtext" id="searchdate"></span>
                <script>
                    $('input[name="dates"]').daterangepicker({
                        timePicker: false,
                        locale:{
                            format: 'YY/MM/DD'
                        }
                    });
    
                    $('input[name="dates"]').change(function(){
                        console.log($('input[name="dates"]').val());
                    });
                </script>
            </div>
        </div>
        
        

		<div class="row">
            <div class="panel panel-default border listbox col-md-6" id="dailyWorkList">
                <div class="panel-heading">
                    <h5 class="panel-title">전체작업일보</h5>
                </div>

                <div class="panel-body">
                    <div id="dailyWorkt"></div>
                </div>
            </div>
        </div>

        <!--작업실적등록 - 작업일보 조회 modal-->
        <div class="modal fade" id="worklogmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">작업실적등록</h4>
                </div>
                <div class="modal-body">
                    <h5 style="font-size: 16px;">작업일보 조회</h5><hr>
                    <table class="table" id="worklogtable">
                        <thead class="tablehead" style="background: rgb(83, 83, 83);">
                            <th style="width: 12.5%; text-align: center;">수주명</th>
                            <th style="width: 12.5%; text-align: center;">부품명</th>
                            <th style="width: 12.5%; text-align: center;">공정</th>
                            <th style="width: 12.5%; text-align: center;">설비</th>
                            <th style="width: 12.5%; text-align: center;">시작시간</th>
                            <th style="width: 12.5%; text-align: center;">종료시간</th>
                            <th style="width: 12.5%; text-align: center;">불량</th>
                            <th style="width: 12.5%; text-align: center;">상태</th>
                        </thead>
                        <tbody class="tablecontent">
                        	<tr>
	                            <div class="form-group">
	                                <td><input type="text" class="form-control" id="ordername" readonly></td>
	                                <td><input type="text" class="form-control" id="partname" readonly></td>
	                                <td><input type="text" class="form-control" id="processname" readonly></td>
	                                <td><input type="text" class="form-control" id="facilityname" readonly></td>
	                                <td><input type="datetime-local" class="form-control" id="startdtime"></td>
	                                <td><input type="datetime-local" class="form-control" id="enddtime"></td>
	                                <td style="text-align: center;"><input type="checkbox" id="faultycheck"></td>
	                                <td><div id="statusdiv"></div></td>
	                            </div>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">저장</button>
                    <button type="button" class="btn btn-danger">삭제</button>
                </div>
            </div>
            </div>
        </div>


        <!--작업실적등록 - 외부작업일보 조회 modal-->
        <div class="modal fade" id="outsoumodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">작업실적등록</h4>
                </div>
                <div class="modal-body">
                    <h5 style="font-size: 16px;">외부작업일보 조회</h5><hr>
                    <table class="table" id="outsoutable">
                        <thead class="tablehead" style="background: rgb(83, 83, 83);">
                            <th style="width: 11.1%; text-align: center;">수주명</th>
                            <th style="width: 11.1%; text-align: center;">부품명</th>
                            <th style="width: 11.1%; text-align: center;">공정</th>
                            <th style="width: 11.1%; text-align: center;">외주사</th>
                            <th style="width: 11.1%; text-align: center;">금액(원)</th>
                            <th style="width: 11.1%; text-align: center;">입고 예정일</th>
                            <th style="width: 11.1%; text-align: center;">외주시작시간</th>
                            <th style="width: 11.1%; text-align: center;">외주종료시간</th>
                            <th style="width: 11.1%; text-align: center;">불량</th>
                        </thead>
                        <tbody class="tablecontent">
                        	<tr>
	                            <div class="form-group">
	                                <td><input type="text" class="form-control" id="ordername" readonly></td>
	                                <td><input type="text" class="form-control" id="partname" readonly></td>
	                                <td><input type="text" class="form-control" id="processname" readonly></td>
	                                <td><input type="text" class="form-control" id="companyname" readonly></td>
	                                <td><input type="text" class="form-control" id="price"></td>
	                                <td><input type="text" class="form-control" id="whdate"></td>
	                                <td><input type="date" class="form-control" id="outsstarttime"></td>
	                                <td><input type="date" class="form-control" id="outsendtime"></td>
	                                <td style="text-align: center;"><input type="checkbox" id="faultycheck"></td>
	                            </div>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">저장</button>
                    <button type="button" class="btn btn-danger">삭제</button>
                </div>
            </div>
            </div>
        </div>

        <input type="button" style="display: none;" id="worklogmodalbtn" data-target="#worklogmodal" data-toggle="modal"/>
        <input type="button" style="display: none;" id="outsoumodalbtn" data-target="#outsoumodal" data-toggle="modal"/>
    </body>
</html>

<script>
function dailyWorktsetting(){
	$.ajax({
		type:"GET",
		url:"./dailyWorksearch.jsp",
		data:{page:"1"},
		dataType:"html",
		success:function(data){
			$("#dailyWorkt").html(data);
		}
	});
}

$(document).ready(function(){
	dailyWorktsetting();
});

//가격 입력 시 숫자만 입력 및 자동 콤마
$(document).on("keyup", "#price", function(e) {
	$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
	inputNumberFormat(this);
});

 function inputNumberFormat(obj) {
     obj.value = comma(uncomma(obj.value));
 }

 function comma(str) {
     str = String(str);
     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 }

 function uncomma(str) {
     str = String(str);
     return str.replace(/[^\d]+/g, '');
 }
</script>
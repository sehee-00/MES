<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="standardProcess.StandardProcessPDTO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
    	<meta charset="UTF-8">
    	
    	<jsp:useBean id="dao" class="standardProcess.StandardProcessDAO"/>
	
        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

        <!-- select2 -->
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

        <link rel="stylesheet" href="standardProcess.css?ver01"/>
        
    </head>
    <body>

        <div class="title">기준정보 관리/표준공정 관리</div>
        
		<div class="row">
            <div class="panel panel-default border listbox col-md-6">
                <div class="panel-heading">
                    <table id="sptableheader">
                        <tr>
                            <td id="sptitle"><h5 class="panel-title">표준공정 관리</h5></td>
                            <td id="spbtn">
                                <input class="btn btn-primary" id="stdWtbtn" type="button" value="표준 작업시간" data-toggle="modal" data-target="#stdWtmodal"/>
                                <input class="btn btn-primary" id="insertpc" type="button" value="공정등록"/>
                                <input class="btn btn-primary" id="insertpceq" type="button" value="공정설비등록"/>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="panel-body">
                <div id="boardt">
                    
                </div>
                </div>
            </div>

            <!--표준작업시간 btn 창-->
            <div class="modal fade" id="stdWtmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">표준작업시간</h4>
                    </div>
                    <div class="modal-body">
                        <div id="stdWtinputbody">
                            <div>
                                <div class="form-group stdWtinput">
                                    <label for="stdWtstarttime">시작시간</label>
                                    <input type="time" id="stdWtstarttime" class="form-control" name="pcpname">
                                </div>

                                <div class="form-group stdWtinput">
                                    <label for="stdWtendtime">종료시간</label>
                                    <input type="time" id="stdWtendtime" class="form-control" name="pcpname">
                                </div>
                            </div>
                        </div>
                        <div style="text-align: right;" id="stdWtinputARbtn">
                            <button type="button" class="btn btn-default" id="stdWtaddbtn">+</button>
                            <button type="button" class="btn btn-default" id="stdWtremovebtn">-</button>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="insertstdWtbtn">등록</button>
                        <!--<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>-->
                    </div>
                </div>
                </div>
            </div>

            <!--공정등록 btn 창-->
            <div class="panel panel-default border inputbox col-md-6" id="insertpcpanel">
                <div class="panel-heading">
                    <h5 class="panel-title">공정등록/수정</h5>
                </div>

                <div class="panel-body">
                    <form method="post" id="insertpcform">
                        <table id="insertpceqinputbody">
                            <tr>
                                <td>
                                    <div class="form-group pcinputs">
                                        <label for="pcpnameinput">공정명 <span style="color: red;">*</span></label>
                                        <input type="text" id="pcpnameinput" class="form-control" name="pcpname">
                                    </div>
                                    <div class="form-group pcinputs">
                                        <label for="pcfreratesinput">임률 <span style="color: red;">*</span></label>
                                        <input type="text" id="pcfreratesinput" class="form-control" name="pcfrerates">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="form-group pcinputs">
                                        <label for="pcloadfacinput">부하율 <span style="color: red;">*</span></label>
                                        <input type="text" id="pcloadfacinput" class="form-control" name="pcloadfac">
                                    </div>
                                    <div class="form-group pcinputs">
                                        <label for="pcusingselect">사용유무 <span style="color: red;">*</span></label>
                                        <select class="form-control" id="pcusingselect" name="pcusing">
                                            <option value="1">Y</option>
                                            <option value="0">N</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="form-group pcinputs">
                                        <label for="pcinchargeselect">공정담당자</label>
                                        <select multiple class="form-control" id="pcinchargeselect" name="pcincharge">
                                        </select>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="buttongruops">
                                        <input class="btn btn-default" id="pcchargeinsertbtn" type="button" value="담당자 등록" onclick="alert('공정을 선택해주세요')"/>
                                        <input class="btn btn-primary" id="pcfirstlevelinsertbtn" type="button" value="최상위 등록"/>
                                        <input class="btn btn-danger" id="pcdeletebtn" type="button" value="삭제"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>

            <!--담당자 삽입 창-->
            <div class="modal fade" id="inchargemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">사용자 설정</h4>
                    </div>
                    <div class="modal-body">
                        <table style="border: none; width: 100%; text-align: center;">
                            <tr>
                                <td style="width: 40%;">
                                    <div>
                                        <table class="table table-bordered table-hover inchargelist" id="userslist">
                                            <thead class="tablehead">
                                                <th style="width: 20%;"></th>
                                                <th>사용자</th>
                                            </thead>
                    
                    						<%
                                            List<String> useridlist = dao.getUserID();
                                            if(useridlist != null){
                                           		for(String userid:useridlist){
                                           	%>
                                            <tr class="tablecontent" id="<%=userid %>">
                                                <td><input type="checkbox" checked='checked' value="<%=userid%>"></td>
                                                <td id="username"><%=userid %></td>
                                            </tr>
                                            <%}}%>
                                        </table>
                                    </div>
                                </td>
                                <!--
                                <td style="width: 20%;">
                                    <button class="btn btn-default"><span class="glyphicon glyphicon-menu-right"></span></button>
                                    <br><br>
                                    <button class="btn btn-default"><span class="glyphicon glyphicon-menu-left"></span></button>
                                </td>
                                <td style="width: 40%;">
                                    <div>
                                        <table class="table table-bordered table-hover inchargelist" id="usersselectedlist">
                                            <thead class="tablehead">
                                                <th style="width: 20%;"></th>
                                                <th>선택된 사용자</th>
                                            </thead>
                    
                    						<tr class="tablecontent" id="admin">
                                                <td><input type="checkbox" value="admin"></td>
                                                <td id="username">admin</td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            -->
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">저장</button>
                    </div>
                </div>
                </div>
            </div>
            
            <!--공정 선택 후 공정등록 btn 창-->
            <div class="panel panel-default border inputbox col-md-6" id="insertselpcpanel">
                <div class="panel-heading">
                    <h5 class="panel-title">공정등록/수정</h5>
                </div>

                <div class="panel-body">
                    <form method="post" id="insertselpcform">
                    <input type="text" id="selectedprocessid" style="display:none;"/>
                    <input type="text" id="selectedprocessname" style="display:none;"/>
                        <table id="insertpceqinputbody">
                            <tr>
                                <td>
                                    <div class="form-group pcinputs">
                                        <label for="selpcpnameinput">공정명 <span style="color: red;">*</span></label>
                                        <input type="text" id="selpcpnameinput" class="form-control" name="pcpname">
                                    </div>
                                    <div class="form-group pcinputs">
                                        <label for="selpcfreratesinput">임률 <span style="color: red;">*</span></label>
                                        <input type="text" id="selpcfreratesinput" class="form-control" name="pcfrerates">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="form-group pcinputs">
                                        <label for="selpcloadfacinput">부하율 <span style="color: red;">*</span></label>
                                        <input type="text" id="selpcloadfacinput" class="form-control" name="pcloadfac">
                                    </div>
                                    <div class="form-group pcinputs">
                                        <label for="selpcusingselect">사용유무 <span style="color: red;">*</span></label>
                                        <select class="form-control" id="selpcusingselect" name="pcusing">
                                            <option value="1">Y</option>
                                            <option value="0">N</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="form-group pcinputs">
                                        <label for="selpcinchargeselect">공정담당자</label>
                                        <select multiple class="form-control" id="selpcinchargeselect" name="pcincharge">
                                        </select>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="buttongruops">
                                        <input class="btn btn-default" id="selpcchargeinsertbtn" type="button" value="담당자 등록"/>
                                        <input class="btn btn-primary" id="selpcinsertbtn" type="button" value="동일레벨등록"/>
                                        <input class="btn btn-primary" id="selpcdownlevelinsertbtn" type="button" value="하위레벨등록"/>
                                        <input class="btn btn-danger" id="selpcdeletebtn" type="button" value="삭제"/>
                                        <input type="button" data-target="#inchargemodal" data-toggle="modal" id="modaltogglebtn" style="display: none;"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>

            <!--공정설비등록 btn 창-->
            <div class="panel panel-default border inputbox col-md-6" id="insertpceqpanel">
                <div class="panel-heading">
                    <h5 class="panel-title">공정설비 등록/수정</h5>
                </div>

                <div class="panel-body">
                    <form method="post" id="insertpceqform">
                        <table id="insertpceqinputbody">
                            <tr>
                                <td>
                                    <div class="form-group pceqinputs">
                                        <label for="pceqpnameselect">공정명 <span style="color: red;">*</span></label>
                                        <div class="dropdown">
                                            <select class="btn btn-default selectlist form-control" id="pceqpnameselect" name="pceqpname">
                                                <%
                                                List<String> processnameslist = dao.getProcessNames();
                                                if(processnameslist != null){
                                                	for(String processname:processnameslist){
                                               	%>
                                               	<option value="<%=processname %>"><%=processname %></option>
                                               	<%
                                                }}
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group pceqinputs">
                                        <label for="pceqenameselect">설비명 <span style="color: red;">*</span></label>
                                        <div class="dropdown">
                                            <select class="btn btn-default selectlist form-control" id="pceqenameselect" name="pceqename">
                                                <%
                                                List<String> facilitiesnameslist = dao.getFacilitiesNames();
                                                if(facilitiesnameslist != null){
                                                	for(String facilityname:facilitiesnameslist){
                                               	%>
                                               	<option value="<%=facilityname %>"><%=facilityname %></option>
                                               	<%
                                                }}
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="buttongruops">
                                        <input class="btn btn-primary" id="pceqinsertbtn" type="button" value="저장"/>
                                        <input class="btn btn-danger" id="pceqdeletebtn" type="button" value="삭제"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
		</div>
    </body>

    <script>
        $(document).ready(function(){
            $("#insertpcpanel").hide();
            $("#insertpceqpanel").hide();
            $("#insertselpcpanel").hide();

            $(".selectlist").select2();
            $(".selectlist").val(null).select2();
        });
        
        //기본 테이블 조회
        $(document).ready(function(){
        	tsetting();
        });
        
        function tsetting(){
        	$.ajax({
        		type:"GET",
				url:"./standardProcessPsearch.jsp",
				dataType:"html",
				success:function(data){
					$("#boardt").html(data);
				},
				error:function(){
					alert("error");
				}
        	});
        }

        //공정등록 버튼 이벤트
        $("#insertpc").on("click",function(){
            $("#insertpcpanel").toggle();
            $("#insertpceqpanel").hide();
            $("#insertselpcpanel").hide();
            $(".processcontent").css("background","white");
            
            $("#pcusingselect").val(null);
        });

        //공정설비등록 버튼 이벤트
        $("#insertpceq").on("click",function(){
            $("#insertpcpanel").hide();
            $("#insertpceqpanel").toggle();
            $("#insertselpcpanel").hide();
            $(".processcontent").css("background","white");
        });

        //표준작업시간 추가와 삭제 버튼 이벤트
        $("#stdWtaddbtn").on("click",function(){
            let stdWtaddhtml= $("#stdWtinputbody").html();
            $("#stdWtinputARbtn").before(stdWtaddhtml);
        });

        $("#stdWtremovebtn").on("click",function(){
            if($(this).parent().siblings().length != 1){
                $(this).parent().prev().remove();
            }
        });

        //공정담당자 선택 css 이벤트
        $("#userslist").find("input:checkbox").on("click",function(){
            $(this).parent().parent().toggleClass("selecteduserrow");
            if($(this).attr("checked") == "checked"){
            	$(this).attr("checked","");
            }else{
            	$(this).attr("checked","checked");
            }
        });
        
        //공정 선택 후 담당자 등록 클릭 이벤트
        $("#selpcchargeinsertbtn").on("click",function(){
        	
        	if($("#selectedprocessid").val() == $("#selpcpnameinput").val()){
        		$("#modaltogglebtn").click();
        	}else{
        		alert('공정을 선택해주세요');
        	}
        			
        });
        
        //공정설비 삽삭갱
        $("#pceqinsertbtn").on("click",function(){ //등록, 수정
        	let procn = $("select[name='pceqpname']").val();
        	let subp = $("select[name='pceqename']").val();
        	let st = "f";
        	
			$.ajax({
				type:"POST",
				url:"./standardProcessinsert.jsp",
				data: {proc_name:procn, sortation:st, sub_proc:subp, mode:"processmulti"},
				dataType:"html",
				success:function(data){
					var d = JSON.parse(data);
					if(d.result == 1){
						alert("등록되었습니다");
						tsetting();
						$('form').each(function(){this.reset();});
						$(".selectlist").val(null).select2();
					}
					else{
						alert("실패하였습니다");
					}
				},
				error:function(){
					alert("error");
				}
			});
        });
        
        $("#pceqdeletebtn").on("click",function(){ //삭제
        	let procn = $("select[name='pceqpname']").val();
        	let subp = $("select[name='pceqename']").val();
        	
        	$.ajax({
				type:"POST",
				url:"./standardProcessdelete.jsp",
				data: {proc_name:procn, sub_proc:subp, mode:"processmulti"},
				dataType:"html",
				success:function(data){
					var d = JSON.parse(data);
					if(d.result == 1){
						alert("삭제되었습니다");
						tsetting();
						$(".selectlist").val(null).select2();
					}
					else{
						alert("실패하였습니다");
					}
				},
				error:function(){
					alert("error");
				}
			});
        });
        
        //공정 삽삭갱
        $("#pcfirstlevelinsertbtn").on("click",function(){ //최상위 등록
        	let procn = $("#pcpnameinput").val();
        	let p = $("#pcfreratesinput").val();
        	let lf = $("#pcloadfacinput").val();
        	let us = $("#pcusingselect").val();
        	
        	$.ajax({
				type:"POST",
				url:"./standardProcessinsert.jsp",
				data: {process_name:procn, pay:p, load_factor:lf, using:us, mode:"topprocess"},
				dataType:"html",
				success:function(data){
					var d = JSON.parse(data);
					if(d.result == 1){
						alert("등록되었습니다");
						location.reload();
					}
					else{
						alert("실패하였습니다");
					}
				},
				error:function(){
					alert("error");
				}
			});
        });
        
        $("#selpcinsertbtn").on("click",function(){ //동일레벨 등록
        	let procn = $("#selpcpnameinput").val();
        	let p = $("#selpcfreratesinput").val();
        	let lf = $("#selpcloadfacinput").val();
        	let us = $("#selpcusingselect").val();
        	let up = $("#selectedprocessname").val();
        	
        	if(up == "none"){
        		$.ajax({
    				type:"POST",
    				url:"./standardProcessinsert.jsp",
    				data: {process_name:procn, pay:p, load_factor:lf, using:us, mode:"topprocess"},
    				dataType:"html",
    				success:function(data){
    					var d = JSON.parse(data);
    					if(d.result == 1){
    						alert("등록되었습니다");
    						location.reload();
    					}
    					else{
    						alert("실패하였습니다");
    					}
    				},
    				error:function(){
    					alert("error");
    				}
    			});
        	}else{
	        	$.ajax({
					type:"POST",
					url:"./standardProcessinsert.jsp",
					data: {process_name:procn, pay:p, load_factor:lf, using:us, sortation:"p", proc_name:up, mode:"lowerprocess"},
					dataType:"html",
					success:function(data){
						var d = JSON.parse(data);
						if(d.result == 1){
							alert("등록되었습니다");
							location.reload();
						}
						else{
							alert("실패하였습니다");
						}
					},
					error:function(){
						alert("error");
					}
				});
        	}
        });
        
        $("#selpcdownlevelinsertbtn").on("click",function(){ //하위레벨 등록
        	let procn = $("#selpcpnameinput").val();
        	let p = $("#selpcfreratesinput").val();
        	let lf = $("#selpcloadfacinput").val();
        	let us = $("#selpcusingselect").val();
        	let up = $("#selectedprocessid").val();
        	
        	$.ajax({
				type:"POST",
				url:"./standardProcessinsert.jsp",
				data: {process_name:procn, pay:p, load_factor:lf, using:us, proc_name:up, sortation:"p", mode:"lowerprocess"},
				dataType:"html",
				success:function(data){
					var d = JSON.parse(data);
					if(d.result == 1){
						alert("등록되었습니다");
						location.reload();
					}
					else{
						alert("실패하였습니다");
					}
				},
				error:function(){
					alert("error");
				}
			});
        });
        
        $("#pcdeletebtn").on("click",function(){
        	alert("실패하였습니다");
        })
        
        $("#selpcdeletebtn").on("click",function(){ //삭제
        	let procn = $("#selpcpnameinput").val();
        	
        	$.ajax({
				type:"POST",
				url:"./standardProcessdelete.jsp",
				data: {proc_name:procn, mode:"process"},
				dataType:"html",
				success:function(data){
					var d = JSON.parse(data);
					if(d.result == 1){
						alert("삭제되었습니다");
						tsetting();
						$('form').each(function(){this.reset();});
						$(".selectlist").val(null).select2();
					}
					else{
						alert("실패하였습니다");
					}
				},
				error:function(){
					alert("error");
				}
			});
        });
        
        //그외 셋팅용 함수
        //network 요청 딜레이 처리 sleep 함수
        function sleep(ms) {
	  		  const wakeUpTime = Date.now() + ms;
	  		  while (Date.now() < wakeUpTime) {}
	  	}
        
        //입력 중 숫자만 쳐야하는 곳 숫자만 쳐지도록 함
        $(document).on("keyup", "#pcfreratesinput", function(e) {
    		$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
    	});
        $(document).on("keyup", "#pcloadfacinput", function(e) {
    		$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
    	});
        $(document).on("keyup", "#selpcfreratesinput", function(e) {
    		$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
    	});
        $(document).on("keyup", "#selpcloadfacinput", function(e) {
    		$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
    	});
        
        //공정 하위 레벨 불러오고 toggle하는 이벤트 처리
        $(document).on("click",".processcontent td[name='spopenicon']",function(){
        	let up = $(this).parent().attr("id");
        	let opd = Number($(this).next().css("padding-left").substring(0,1));
        	if(opd == 1){
        		opd = $(this).next().attr("style");
        		opd = Number($(this).next().attr("style").substring(13,15));
        	}
        	let pd = opd + 10;
        	pd = String(pd) + "px";
        	
        	if($(this).parent().next().attr("name") != $(this).parent().attr("id")){
        		$.ajax({
    	    		type:"GET",
    	    		async : false,
    	    		url:"./standardProcessFsearch.jsp",
    	    		data:{"upper":up, "padding":pd},
    	    		dataType:"html",
    	    		success:function(data){
    	    			$("#"+up).after(data);
    	    		},
    	    		error:function(){
    	    			alert("error");
    	    		}
    	    	});
        		
    	    	$.ajax({
    	    		type:"GET",
    	    		async : false,
    	    		url:"./standardProcessPLowersearch.jsp",
    	    		data:{"upper":up, "padding":pd},
    	    		dataType:"html",
    	    		success:function(data){
    	    			$("#"+up).after(data);
    	    		},
    	    		error:function(){
    	    			alert("error");
    	    		}
    	    	});
        	}else{
        		let gparent = $(this).parent().attr("name");
        		if($(this).parent().next("tr[name='"+ up +"']").css("display") == "none"){
        			$(this).parent().nextAll("tr[name='"+ up +"']").show()
        		}else{
        			$(this).parent().nextUntil("tr[name='"+ gparent +"'], tr[name='none']").hide()
        		}
        	}

        });
    </script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="material.MaterialDTO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
    	<jsp:useBean id="dao" class="material.MaterialDAO"/>
    
    	<meta charset="UTF-8">
	
        <!--jquery-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

        <!--bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="material.css?ver02">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

        <!-- select2 -->
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        
        <!-- Excel -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
        
    </head>
    <body id="boardp">
    
	<!-- 큰 제목과 검색 창 + 엑셀 import -->
        <div class="title">자재 제품 관리 / 자재 관리</div>
        <div class="panel panel-default border searchbox">
            <div class="panel-body">
                <span>자재명:&nbsp;&nbsp;&nbsp;<input type="text" class="form-control searchtitle" name="searchdata"></span>
                <label class="btn btn-primary" for="excelbtn">Excel import</label><input type="file" id="excelbtn" onchange="readExcel()"/>
            </div>
        </div>

	<!-- 자재 목록 -->
		<div class="row">
        <div class="panel panel-default border mlistbox col-md-6">
            <div class="panel-heading">
                <h5 class="panel-title" style="display:inline-block;">자재 관리</h5>
                <div class="warningbox" style="float: right;">
                    <div class="warningredbox" style="display:table-cell;"></div>
                    <div class="warningboxexp" style="display:table-cell; background: white;"><h4 style="font-weight: bold; margin: 10px;">재고 부족</h4></div>
                </div>
                
            </div>

            <div class="panel-body">
            <div id="boardt"></div>
            
           
            </div>
        </div>
        
	<!-- 자재 등록 창 -->
        <div class="panel panel-default border minputbox col-md-6">
            <div class="panel-heading">
                <h5 class="panel-title">자재 등록/수정</h5>
            </div>

            <div class="panel-body">
                <form id="mbaordform">
                <input type="text" id="materialidinput" name="materialid" style="display:none"/>
                    <table style="border: 0; width: 98%;">
                        <tr>
                            <td>
                            	<div class="form-group mname">
                                    <label for="materialname">자재명 <span style="color: red;">*</span></label>
                                    <input type="text" id="materialname" class="form-control" name="name">
                                </div>
                                <div class="form-group mprice">
                                    <label for="materialprice">단가(원) <span style="color: red;">*</span></label>
                                    <input type="text" id="materialprice" class="form-control" name="price">
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="form-group mrequire">
                                    <label for="typematerialreq">소요 자재 유형  <span style="color: red;">*</span></label>
                                    <div class="dropdown">
                                        <select class="btn btn-default selectlist" id="tmrselect" name="tmrselect">
                                        <%
                                        	List<String> tlist = dao.getMtypeList();
                                        	
                                        	if(tlist != null){
                                        		for(String i : tlist){
                                        %>
                                        
                                            <option value="<%=i %>"><%=i %></option>
                                            
                                       <%
                                        		}
                                        	}
                                       %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mprocess">
                                    <label for="materialproc">자재 공정  <span style="color: red;">*</span></label>
                                    <div class="dropdown">
                                        <select class="btn btn-default selectlist" id="mpselect" name="mpselect">
                                        <%
                                        	List<String> plist = dao.getMprocList();
                                        	
                                        	if(plist != null){
                                        		for(String i : plist){
                                        %>
                                        
                                            <option value="<%=i %>"><%=i %></option>
                                            
                                       <%
                                        		}
                                        	}
                                       %>
                                        </select>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <div class="form-group mamo">
                                    <label for="materialamo">수량  <span style="color: red;">*</span></label>
                                    <input type="text" id="materialamo" class="form-control" name="amo">
                                </div>
                                <div class="form-group msafeamo">
                                    <label for="materialsafeamo">안전 재고 수량 <span style="color: red;">*</span></label>
                                    <input type="text" id="materialsafeamo" class="form-control" name="safeamo">
                                </div>
                            </td>

                        <tr>
                            <td>
                                <div class="buttongruops">
                                    <input class="btn btn-primary" type="reset" value="초기화" id="inputreset"/>
                                    <input class="btn btn-primary" type="button" value="저장" id="inputsubmit"/>
                                    <input class="btn btn-danger" id="inputdelete" type="button" value="삭제"/>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
		</div>
		</div>

        <script>
        var pnum="1";
        var sda = "";
        
        <!-- select02 설정 (콤보박스에서 검색 가능하게 함) -->
            $(document).ready(function() {
                $('.selectlist').select2();
                $(".selectlist").val(null).select2();
            });
            $("#inputreset").click(function(){
            	$(".tablecontent").css({"background":"white"});
                $(".selectlist").val(null).select2();
            });
            
        <!-- 기본 자재 목록 셋팅 -->
        	$(document).ready(function(){
        		tsetting();
        	});
        	
        	function tsetting(){
        		$.ajax({
        			type:"GET",
        			url:"./materialsearch.jsp",
        			data:{page:"1"},
        			dataType:"html",
        			success:function(data){
        				$("#boardt").html(data);
        			}
        		});
        	}
        	
		<!-- 등록 창 쓰기 형식 지정 -->
        	$(document).on("keyup", "#materialamo", function(e) {
        		$(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
        	});
        	$(document).on("keyup","#materialsafeamo",function(e){
        		$(this).val($(this).val().replace(/[^0-9-]/gi,""));
        	});
        	$(document).on("keyup","#materialprice",function(e){
        		$(this).val($(this).val().replace(/[^0-9-]/gi,""));
        	});
        	
        	<!-- 등록 -->
        	$('#inputsubmit').on("click",function(){
        		let mi = $("#materialidinput").val();
        		let mn = $('input[name="name"]').val();
        		let mpr1 = $('input[name="price"]').val();
        		let mpr = uncomma(mpr1);
        		let mts = $('#tmrselect').val();
        		let mps = $('#mpselect').val();
        		let ma = $('input[name="amo"]').val();
        		let msa = $('input[name="safeamo"]').val();
        		
        		$.ajax({
        			type:"POST",
        			url:"./materialinsert.jsp",
        			data:{mid:mi, mname:mn, mprice:mpr, mtmr:mts, mmp: mps, mamo:ma, msafeamo:msa},
        			dataType:"html",
        			success:function(data){
        				var d = JSON.parse(data);
        				if(d.result == 1){
        					alert("등록되었습니다");
        					tsetting();
        					$('form').each(function(){
    							this.reset();
    						});
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
        	
        	<!-- 삭제 -->
        	$('#inputdelete').on("click",function(){
        		let bnn = $('#materialidinput').val();
        		
        		if(bnn != 0){
        			$.ajax({
        				type:"GET",
        				url:"./materialdelete.jsp",
        				data:{bn:bnn},
        				dataType:"html",
        				success:function(data){
        					var d = JSON.parse(data);
        					if(d.result == 1){
        						alert("삭제하였습니다");
        						tsetting();
        						$('form').each(function(){
        							this.reset();
        						});
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
        		}
        	});
        	
        	<!-- 검색 -->
        	$('input[name="searchdata"]').on("keydown",function(e){
        		
        		if(e.keyCode == 13){
        			sda = $('input[name="searchdata"]').val();
        		
        			$.ajax({
        				type:"GET",
        				url:"./materialsearch.jsp",
        				data:{page:"1", sdata:sda},
        				dataType:"html",
        				success:function(data){
        		            $("#boardt").html(data);
        		        }
        			});
        		};
        	});
        	
        	<!-- Excel -->
        	function readExcel() {
                let input = event.target;
                let reader = new FileReader();
                reader.onload = function () {
                    let data = reader.result;
                    let workBook = XLSX.read(data, { type: 'binary' });
                    let rows = XLSX.utils.sheet_to_json(workBook.Sheets['Sheet1']);
                    //console.log(JSON.stringify(rows));
                    
                    rows.forEach(element => {
                    	let mi = 0;
                    	let mn = element["자재명"]; 
                		let mpr = element["단가"];
                		let mts = element["소요 자재 유형"];
                		let mps = element["자재 공정"];
                		let ma = element["수량"];
                		let msa = element["안전재고수량"];
                		
                		$.ajax({
                			type:"POST",
                			url:"./materialinsert.jsp",
                			data:{mid:mi, mname:mn, mprice:mpr, mtmr:mts, mmp: mps, mamo:ma, msafeamo:msa},
                			dataType:"html",
                			success:function(data){
                				var d = JSON.parse(data);
                				if(d.result == 0){
                					alert("실패하였습니다");
                				}
                			},
                			error:function(){
                				alert("error");
                			}
                		});
                		
                		sleep(200);
                    });
                    
                    tsetting();
                };
                reader.readAsBinaryString(input.files[0]);
            }
        	
		<!-- 등록 창 쓰기 형식 지정 -->
        	$(document).on("keyup", "input[name='price']", function(e) {
        		   $(this).val( $(this).val().replace(/[^0-9-]/gi,"") );
        		   
        		   $(this).val(comma($(this).val()));
        		});
        	
		<!-- 엑셀을 읽을 때 다른 작업과의 충돌을 없애기 위한 sleep -->
        	function sleep(ms) {
        		  const wakeUpTime = Date.now() + ms;
        		  while (Date.now() < wakeUpTime) {}
        	}
		
		<!-- 단가 형식 지정시 사용하는 , 찍기와 , 없애기 -->
        	function comma(str) {
        	    str = String(str);
        	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        	}
        	function uncomma(str) {
        	    str = String(str);
        	    return str.replace(/[^\d]+/g, '');
        	}
        </script>
    </body>
</html>

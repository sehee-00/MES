<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<jsp:useBean id="dao" class="prodProgress.ProdProgressDAO"/>
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

        <!-- select2 -->
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

		<!-- Excel -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>

        <link rel="stylesheet" href="prodProgress.css?ver05">
    </head>
    <body>
        <div class="panel panel-default border searchbox">
            <div class="panel-body">
                <span>금형번호:&nbsp;&nbsp;&nbsp;
                <select class="combobox" id="itemnosel">
                <%
                	List<String> itemnosellist = dao.getItemNO();
                
                	if(itemnosellist != null){
                		for(String itemno : itemnosellist){
                %>
                    <option value="<%=itemno %>"><%=itemno %></option>
                <%}} %>
                </select>
                </span>
                <script>
                    $(document).ready(function(){
                        $("#itemnosel").select2();
                        $("#itemnosel").val(null).select2();
                    });
                </script>

                &nbsp;&nbsp;&nbsp;
                <span>제품상태:&nbsp;&nbsp;&nbsp;
                    <div class="statusbox" style="display:table-cell;">
                        <div class="readybox" style="display:table-cell;"></div>
                        <div class="readyexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">시작대기</h6></div>
                        <div class="progbox" style="display:table-cell;"></div>
                        <div class="progexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">진행중</h6></div>
                        <div class="completebox" style="display:table-cell;"></div>
                        <div class="completeexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">완료</h6></div>
                        <div class="orderbox" style="display:table-cell;"></div>
                        <div class="orderexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">발주</h6></div>                    
                    </div>
                </span>
                &nbsp;&nbsp;&nbsp;
                <span>공정상태:&nbsp;&nbsp;&nbsp;
                    <div class="statusbox" style="display:table-cell;">
                        <div class="readybox" style="display:table-cell;"></div>
                        <div class="readyexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">시작대기</h6></div>
                        <div class="progbox" style="display:table-cell;"></div>
                        <div class="progexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">진행중</h6></div>
                        <div class="completebox" style="display:table-cell;"></div>
                        <div class="completeexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">완료</h6></div>
                        <div class="faultybox" style="display:table-cell;"></div>
                        <div class="faultyexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">불량</h6></div>
                        <div class="outbox" style="display:table-cell;"></div>
                        <div class="outexp" style="display:table-cell; background: white;"><h6 style="font-weight: bold; margin: 10px;">외주</h6></div>                    
                    </div>
                </span>
                &nbsp;&nbsp;&nbsp;
                <input id="partsM_modalTogglebtn" type="button" data-toggle="modal" data-target="#partsMmodal" style="display:none;"/>
                <input id="orderI_modalTogglebtn" type="button" data-toggle="modal" data-target="#orderIbtn" style="display:none;"/>
                <input class="btn btn-primary" type="button" id="partsMbtn" value="부품관리">
                <input class="btn btn-primary" type="button" id="orderIbtn" value="수주정보">
            </div>
        </div>

		<div class="row">
            <div class="panel panel-default border listbox col-md-6" id="prodProgresslist">

                <!--계획 공정표-->
                <div class="panel-body">
                    <div id="prodProgressT"></div>
                </div>
            </div>
        </div>
        
       <!-- 부품관리 modal -->
       <div class="modal fade" id="partsMmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button id="partsMclose" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <input class="btn btn-danger" style="float: right; margin-right: 15px;" type="button" id="alldelbtn" value="전체삭제" onclick="alldelInsert()">
                    <input class="btn btn-primary" style="float: right; margin-right: 5px;" type="button" id="insertrowbtn" value="추가">
                    <input class="btn btn-primary" style="float: right; margin-right: 5px;" type="button" id="excelbtn" value="Excel Import">
                    <h4 class="modal-title" id="myModalLabel">부품등록</h4>
                </div>
                <div class="modal-body">
                    <form id="partsMform">
                        <div id="partsMinputbody">
                            <table id="partsMtable" style="border-spacing: 15px; border-collapse: separate; width:100%;">
                                <thead class="table_head">
                                    <tr>
                                        <th style="width:30%;">LAYER</th>
                                        <th style="width:30%;">부품명</th>
                                        <th style="width:20%;">수량</th>
                                        <th style="width:15%;">발주여부</th>
                                        <th style="width:5%;"></th>
                                    </tr>
                                </thead>
                                <tbody>                   
                                    <tr id="addData"></tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="insertpartsMbtn">저장</button>
                </div>
            </div>
            </div>
        </div>
       
       <script>
       		var indexx = 0;
		    $("#partsMbtn").on("click",function(){
		        let itemno = $("#itemnosel").val();
		        
		        if(itemno != null){
		        	if(itemno.length > 0){
		        		$.ajax({
		        			type:"POST",
		        			url:"./SearchInfo",
		        			data:{mode:"partinfo", "itemno":itemno},
		        			dataType:"JSON",
		        			success:function(data){
		        				for(var i in data){
		        					$("#insertrowbtn").click();
		        					var partinfo = data[i];
		        				}
		        			},
		        			error:function(){
		        				alert("error");
		        			}
		        		});
		        		
		            	$("#partsM_modalTogglebtn").click();
		        	}else{
		        		alert("금형번호를 선택해주세요");
		        	}
		        }else{
		            alert("금형번호를 선택해주세요");
		        }
		    });
		
		    $("#orderIbtn").on("click",function(){
		        let itemno = $("#itemnosel").val();
		        
		        if(itemno != null){
		        	if(itemno.length > 0){
		            	$("#orderI_modalTogglebtn").click();
		        	}else{
		        		alert("금형번호를 선택해주세요");
		        	}
		        }else{
		            alert("금형번호를 선택해주세요");
		        }
		    });
		    
		    document.addEventListener("DOMContentLoaded", function(){
				tsetting();
	    	});
		    
		    function tsetting(){
		    	$.ajax({
        			type:"GET",
        			url:"./prodProgressSearch.jsp",
        			data:{},
        			dataType:"html",
        			success:function(data){
        				$("#prodProgressT").html(data);
        			}
        		});
		    }
		    
		    $("#insertrowbtn").on("click",function(){
		        var rowItem="<tr id='partsMaddbody'>";
		            rowItem+="<td class='form-group'>";
		            rowItem+="<input type='text' id='partsMlayer' class='form-control' name='partsMlayer"+ indexx +"'>";
		            rowItem+="</td>";
		            rowItem+="<td class='form-group'>";
		            rowItem+="<input type='text' id='partsMpartsname' class='form-control' name='partsMinput'>";
		            rowItem+="</td>";
		            rowItem+="<td class='form-group'>";
		            rowItem+="<input type='number' id='partsMquantity' class='form-control' name='partsMinput'>";
		            rowItem+="</td>";
		            rowItem+="<td class='form-group'>";
		            rowItem+="<select id='partsMorderstatus' class='form-control' name='partsMinput'>";
		            rowItem+="<option value='내부'>내부</option>";
		            rowItem+="<option value='외부'>외부</option>";
		            rowItem+="</select>";
		            rowItem+="</td>";
		            rowItem+="<td>";
		            rowItem+="<input type='button' id='partsMdelbtn' class='btn btn-common' name='partsMinput' value='삭제' onclick='delInsert(this)'>";
		            rowItem+="</td>";
		            rowItem+="</tr>";
		            
		            $("#addData").before(rowItem);
		            indexx += 1;
		    });
		    
		    function delInsert(obj){
		        var number = obj.parentNode.parentNode.children[4].children[0].value;

		        var div=$(obj).parent().parent();
		        div.remove();
		     
		     }

		      function alldelInsert(){
		        $("tr[id=partsMaddbody]").remove();
		     }
		</script>
    </body>
</html>
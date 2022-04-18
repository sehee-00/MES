<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.HashMap" %>
<%@ page import = "java.util.Map" %>
<%@ page import = "java.util.Map.Entry" %>
<jsp:useBean id="dao" class="userMenu.UserMenuDAO" />
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

        <link rel="stylesheet" href="userMenu.css?ver03">
        
    </head>
    <body id="boardp">
    
        <div class="title">Admin / 조직도 관리 / 사용자 메뉴 관리</div>
        <div class="panel panel-default border searchbox">
            <div class="panel-body">
                <span>사번:&nbsp;&nbsp;&nbsp;<input type="text" class="form-control searchtext" name="searchid"></span>
                &nbsp;&nbsp;&nbsp;
                <span>이름:&nbsp;&nbsp;&nbsp;<input type="text" class="form-control searchtext" name="searchname"></span>
            </div>
        </div>
        
        

		<div class="row">
            <div class="panel panel-default border listbox col-md-6" id="umUsersList">
                <div class="panel-heading">
                    <h5 class="panel-title">사용자 관리</h5>
                </div>

                <div class="panel-body">
                    <div id="usert"></div>
                </div>
            </div>
            
            <div class="panel panel-default border inputbox displaynone col-md-6 " id="umUsermenuList">
                <div class="panel-heading">
                    <table id="umUsermenuListHeader">
                        <tr>
                            <td id="umtitle"><h5 class="panel-title">사용자별 메뉴</h5></td>
                            <td id="umbtn">
                            	<input class="btn btn-primary" type="button" value="메뉴 설정" id="settingmenubtn"/>
                                <input id="modalbtn" type="button" data-toggle="modal" data-target="#umUsermenuSetting" style="display:none;"/>
                            </td>
                        </tr>
                    </table>
                </div>
    
                <div class="panel-body">
                	<input type="text" id="seluserid" style="display:none;"/>
                    <div id="usermenut"></div>
                </div>
            </div>
        </div>

		<!-- 메뉴 등록 modal -->
        <div class="modal fade" id="umUsermenuSetting" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">역할별 메뉴 등록</h4>
                </div>
                <div class="modal-body">
                    <div id="umUsermenuCheckBody">
                        <table class="table table-bordered table-hover" id="settingmenutable">
                            <thead class="tablehead">
                                <th style="width: 10%;"></th>
                                <th style="width: 20%;"></th>
                                <th style="text-align: center;">메뉴</th>
                            </thead>
   
   							<%
   							Map<String,String[]> allmenu = dao.getAllMenu();
   							for(Entry<String,String[]> menus : allmenu.entrySet()){
   							%>
                            <tr class="tablecontent uppermenu" id="<%= menus.getKey() %>"> 
                                <td id="spicon" style="text-align: center;"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></td>
                                <td id="upmenucheck" style="text-align: center;"><input type="checkbox" value="<%=menus.getKey() %>" id="menucheckbox"></td>
                                <td id="upmenuname"><%=menus.getKey() %></td>
                            </tr>
                            <%
                            	for(String lowermenu : menus.getValue()){
                            %>
                            <tr class="tablecontent displaynone" id="<%= lowermenu %>" name="<%=menus.getKey() %>"> 
                                <td></td>
                                <td id="lowermenucheck" style="text-align: center;"><input type="checkbox" name="<%=menus.getKey() %>" value="<%=lowermenu %>" id="menucheckbox"></td>
                                <td id="lowermeneuname">&nbsp&nbsp<%=lowermenu %></td>
                            </tr>
                            <%
                            	}
   							}
                            %>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="insertUsermenu">저장</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                </div>
            </div>
            </div>
        </div>
    </body>
</html>

<script>
function usertsetting(){
	$.ajax({
		type:"GET",
		url:"./usersearch.jsp",
		data:{page:"1"},
		dataType:"html",
		success:function(data){
			$("#usert").html(data);
		}
	});
}

$(document).ready(function(){
	usertsetting();
});

//검색
$("input[name='searchid']").on("keydown",function(e){
	if(e.keyCode == 13){
		uid = $("input[name='searchid']").val();
		uname = $("input[name='searchname']").val();
		
		$.ajax({
			type:"GET",
			url:"./usersearch.jsp",
			data:{page:"1", sUsername:uname, sUserid:uid},
			dataType:"html",
			success:function(data){
				$("#usert").html(data);
			}
		});
	}
});

$("input[name='searchname']").on("keydown",function(e){
	if(e.keyCode == 13){
		uid = $("input[name='searchid']").val();
		uname = $("input[name='searchname']").val();
		
		$.ajax({
			type:"GET",
			url:"./usersearch.jsp",
			data:{page:"1", sUsername:uname, sUserid:uid},
			dataType:"html",
			success:function(data){
				$("#usert").html(data);
			}
		});
	}
});

//메뉴 설정에서 하위메뉴 열기
$("#settingmenutable .uppermenu #spicon").on("click",function(){
	let n = $(this).parent().attr("id");
	$("#settingmenutable tr[name='"+ n +"']").toggleClass("displaynone");
});

//메뉴 설정 버튼 이벤트
$("#settingmenubtn").on("click",function(){
	
	$("input[type='checkbox']").prop("checked", false);
	$("input[type='checkbox']").removeAttr("checked");
	$("#settingmenutable tr").removeClass("selecteduserrow");
	
	$("#usermenutable tbody").children().each(function(){
		$("input[value='" + this.id.trim() +"']").prop("checked", true);
		$("input[value='" + this.id.trim() +"']").attr("checked","checked");
		$("input[value='" + this.id.trim() +"']").parent().parent().addClass("selecteduserrow");
	});
	
	$("#modalbtn").click();
});

$("#settingmenutable").find("input:checkbox").on("click",function(){
    $(this).parent().parent().toggleClass("selecteduserrow");
    if($(this).attr("checked") == "checked"){
    	$(this).removeAttr("checked");
    }else{
    	$(this).attr("checked","checked");
    }
    
    if($(this).parent().parent().hasClass("uppermenu")){
    	let n = $(this).parent().parent().attr("id");
    	if($(this).attr("checked") == "checked"){
    		$("tr[name='"+ n +"'] #lower menucheck input").prop("checked", true);
    		$("tr[name='"+ n +"'] #lowermenucheck input").attr("checked","checked");
    		$("tr[name='"+ n +"']").addClass("selecteduserrow");
    	}
    	else{
    		$("tr[name='"+ n +"'] #lowermenucheck input").prop("checked",false);
    		$("tr[name='"+ n +"'] #lowermenucheck input").removeAttr("checked");
    		$("tr[name='"+ n +"']").removeClass("selecteduserrow");
    	}
    }
});

//메뉴 등록 저장
$("#insertUsermenu").on("click",function(){
	let user = $("#seluserid").val();
	let menus = new Object();
	
	$("input:checkbox[id='menucheckbox']:checked").each(function(){
		if((this.name).length > 0){
			if(menus[this.name] != undefined){
				menus[this.name] = menus[this.name] + "," + this.value;
			}
			else{
				menus[this.name] = this.value;	
			}
		}
	});

	$.ajax({
		type:"POST",
		async:false,
		url:"./userMenuinsert",
		data:{"userid":user, "sales":menus["영업 관리"], "prod":menus["생산 관리"],
			"work":menus["작업 관리"], "material_prod":menus["자재 제품 관리"], "order_warehousing":menus["발주입고 관리"], 
			"dashboard":menus["Dashboard"], "info_manage":menus["기준정보 관리"], "admin":menus["Admin"]},
		dataType:"JSON",
		success:function(data){
			if(data.result == 1){
				alert("저장되었습니다");
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


</script>
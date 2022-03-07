<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<jsp:useBean id="dao" class="prodProgress.ProdProgressDAO"/>

<!-- 계획공정 표 -->
<div id="pptablediv">
	<table class="table table-bordered pptable">
       <tr class="tablehead">
           <th rowspan="5" style="text-align: right; padding: 0px;">
               <div class="pptableheaddiv">계획공정</div>
               <div class="pptableheaddiv">WT(H)</div>
               <div class="pptableheaddiv">비용(원)</div>
               <div class="pptableheaddiv">완료예상날짜</div>
           </th>
        <%
        	List<String> processlist = dao.getProcess();
        	if(processlist != null){
        		for(String p : processlist){
        %>
           <th><%=p %></th>
		<%
        		}
		%>
       </tr>
       <tr class="tablecontent" id="pptableWT"> 
		<%
				for(int i=0; i<processlist.size(); i++){
		%>
           <td>asdf</td>
       <%
        		}
       %>
       </tr>
       <tr class="tablecontent" id="pptablePrice"> 
		<%
				for(int i=0; i<processlist.size(); i++){
		%>
           <td>asdf</td>
       <%
        		}
       %>
       </tr>
       <tr class="tablecontent" id="pptableExpday"> 
		<%
				for(int i=0; i<processlist.size(); i++){
		%>
           <td><input type="text" class="expdayinput" maxlength="10"/></td>
       <%
        		}
        	}
       %>
       </tr>
   </table>
</div>

<!--진행사항-->
<table class="table table-bordered detailTable">
    <tr>
        <td style="padding-right: 20px;">1</td>
        <td style="background-color: rgb(170, 170, 170); color:white;">
            <div>
                LAYER : abc<br>
                <span style="padding-right:40px;">WT : 0</span><span>제조원가 : 0</span>
            </div>
            <div style="margin-top: 10px; text-align: center;">
                <input type="button" value="공구" class="btn btn-default"/>
                <input type="button" value="작공" class="btn btn-default"/>
                <input type="button" value="인쇄" class="btn btn-default"/>
            </div>
        </td>
        <td style="padding-right: 50px;">
            유형 : 금형부품 <br>
            규격 : <br>
            수량 : 1 <br>
        </td>
        <td>
            공정<br>
            설비<br>
            시작<br>
            종료
        </td>
        <td style="padding:0px;">
            <div style="width: 170px; height: 25px; margin: 3px; margin-bottom: 3px;" class="completebox">
                설계
            </div>
            <div style="width: max-content; text-align: center; margin: 8px; margin-top: 0px;">
                <br>
                2022.02.02<br>
                2022.02.03
            </div>
        </td>
    </tr>
</table>
<script>
$(document).ready(function(){
	$(".expdayinput").hover(
		function(){$(this).attr("placeholder","____-__-__");},
		function(){$(this).removeAttr("placeholder");});
});

$(document).on("keyup", ".expdayinput", function(e) {
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
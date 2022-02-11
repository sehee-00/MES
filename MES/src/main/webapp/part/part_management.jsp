<!-- 부품 관리 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
// 	데이터베이스 연결
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	Statement stmt = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String query= null;
	
	String jdbcDriver = "jdbc:mysql://192.168.0.115:3306/mes?" + "useUnicode=true&characterEncoding=utf8";
	String dbUser = "Usera";
	String dbPass = "1234";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
%>

<%
String temp="";

//rowcount = row갯수
int rowcount=0;
query="select count(*) from part";
rs=stmt.executeQuery(query);
if(rs.next()){rowcount=rs.getInt(1);}
int lastpagenumber=1;
if(rowcount != 0){
	lastpagenumber = (rowcount-1)/10 +1;
}
%>
<%
query = "select * from part";
rs=stmt.executeQuery(query);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
    </script>
<title>MES</title>

<style>
	.card {
		border-top: 5px solid #17a2b8;
		margin: 30px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	.card-header {
		padding-top: 20px;
		padding-bottom: 20px;
	}
	
	.card-body {
		padding-top: 30px;
		padding-bottom: 20px;
	}
	
	.active, .btn-info {
		background-color: #17A2B8;
		color: white;
		border-color: #17A2B8;
	}
	
	thead {
		background-color: #17A2B8;
		color: white;
	}
	
	.float-right {
		float: right;
	}
</style>

</head>
<body>
	<label style="margin-left: 30px; margin-top: 10px;">자재 제품 관리 / 부품 관리</label>
	
<!--------------------------------------------- 윗 섹션 ----------------------------------------------->

	<div class="card">
		<div class="card-body">
			<div class="form-inline">
				<label>부품명:</label> <input id="search" type="text" onKeypress="javascript:if(event.keyCode==13) {pressEnter()}">
				<script>
				function pressEnter(){
					var text = document.getElementById("search").value;
					var trs = document.querySelectorAll(".trs");
					
					if(text!=""){
						for(var i=0; i<trs.length; i++){
							var item = trs.item(i);
							item.style.display="none";
						}
						
						document.getElementById(text).style.display="";
					}
					
					else{
						for(var i=0; i<trs.length; i++){
							var item = trs.item(i);
							item.style.display="";
						}
					}
					
				}
				</script>
			</div>
		</div>
	</div>

	<div class="row">
	
<!----------------------------------------------- 왼쪽 섹션 -------------------------------------------->
		<div class="col-6" style="margin-right: 0px;">
			<div class="card" style="margin-right: 0px;">
				<div class="card-header"
					style="font-size: 20px; background-color: white;">부품 관리</div>
				<div class="card-body">
					<table id="mytable" class="table table-bordered" style="width: 100%;"
						role="grid">
						<thead>
							<tr>
								<th>부품유형</th>
								<th>부품명</th>
								<th>단가(원)</th>
								<th>재고수량</th>
								<th>안전재고수량</th>
								<th></th>
							</tr>
						</thead>
						<tbody style="border-top: none;">
						
						<%
						int count=0;
						int pagegroup=0;
						while(rs.next()){
							count++;
							if(count % 10 ==1){
								pagegroup++;
							}
							temp = rs.getString("part_name");
						%>
						<tr class="trs pagegroup<%=pagegroup%>" id="<%=temp%>" onclick="tableclickevent(this)">
							<td><%=rs.getString("part_type")%></td>
							<td style="display:none"><%=rs.getString("core")%></td>
							<td><%=rs.getString("part_name")%></td>
							<td><%=rs.getString("unit_price")%></td>
							<td><%=rs.getString("stock")%></td>
							<td><%=rs.getString("safety_stock")%></td>
							<td style="display:none"><%=rs.getString("standard")%></td>
							<td style="display:none"><%=rs.getString("unit")%></td>
							<td><button type="button" class="btn btn-secondary">인쇄</button></td>
						</tr>
						
						<%
						}
						%>
						
						<script>
						function tableclickevent(element){
							document.getElementById("part_type").value=element.children[0].innerHTML;
							document.getElementById("core").value=element.children[1].innerHTML;
							document.getElementById("part_name").value=element.children[2].innerHTML;
							document.getElementById("unit_price").value=element.children[3].innerHTML;
							document.getElementById("stock").value=element.children[4].innerHTML;
							document.getElementById("safety_stock").value=element.children[5].innerHTML;
							document.getElementById("standard").value=element.children[6].innerHTML;
							document.getElementById("unit").value=element.children[7].innerHTML;
							
							document.getElementById("submitcheck").value="1";
							
							// 테이블 배경색 설정
							resetbutton();
							element.style.backgroundColor="#17A2B8";
						}
						
						//페지네이션
						function setdisplay(groupnumber){
							var trs = document.querySelectorAll(".trs");
							for(var i=0; i<trs.length; i++){
								var item = trs.item(i);
								item.style.display="none";
							}
							
							trs = document.querySelectorAll(".pagegroup"+groupnumber);
							for(var i=0; i<trs.length; i++){
								var item = trs.item(i);
								item.style.display="";
							}
							
							var pages = document.querySelectorAll(".pages");
							for(var i=0; i<pages.length; i++){
								var item = pages.item(i);
								item.classList.remove('active');
							}
							document.getElementById("page"+groupnumber).className += ' active';
							
							//previous버튼처리
							if(groupnumber==1){
								document.getElementById("previous").className += ' disabled';
								document.getElementById("previous").style.pointerEvents="none";
							}
							else{
								document.getElementById("previous").classList.remove('disabled');
								document.getElementById("previous").style.pointerEvents="auto";
							}
							
							//next버튼처리
							if(groupnumber==document.querySelector(".lastpage").children[0].innerHTML*1){
								document.getElementById("next").className += ' disabled';
								document.getElementById("next").style.pointerEvents="none";
							}
							else{
								document.getElementById("next").classList.remove('disabled');
								document.getElementById("next").style.pointerEvents="auto";
							}
						}
						
						function previousbutton(){
							setdisplay(document.querySelector(".active").children[0].innerHTML*1-1);
						}
						
						function nextbutton(){
							setdisplay(document.querySelector(".active").children[0].innerHTML*1+1);
						}
						</script>
						</tbody>
					</table>
					<ul class="pagination justify-content-end">
						<li class="page-item" id="previous" onclick="previousbutton()"><a class="page-link">Previous</a></li>
						<%
						int pagecount = ((rowcount-1)/10)+1;
						for(int i=0;i<pagecount;i++){
						%>
						<li class="page-item pages<%=(i+1)==pagecount?" lastpage":"" %>" id="page<%=i+1%>" onclick="setdisplay(<%=i+1%>)"><a class="page-link"><%=i+1%></a></li>
						<%
						}
						%>
						
						<li class="page-item" id="next" onclick="nextbutton()"><a class="page-link">Next</a></li>
						
					</ul>
				</div>
			</div>
						<script>
						setdisplay(1);
						</script>
		</div>

<!------------------------------------------------------ 오른쪽 섹션 --------------------------------------------->
		<div class="col-6" style="margin-left: 0px;">
			<div class="col" style="margin-left: 0px;">
				<div class="card">
					<div class="card-header">부품 등록/수정</div>
					<div class="card-body">
					
					<form>
						<div class="row">
							<div class="col-4">
								<label>유형<span class="text-danger">*</span></label>
							</div>
							<div class="col-4">
								<label>CORE<span class="text-danger">*</span></label>
							</div>
							<div class="col-4">
								<label>부품명<span class="text-danger">*</span></label>
							</div>
							<div class="col-4">
								<select class="form-select" name="part_type" id="part_type">
									<option value="CORE">CORE</option>
									<option value="완제품">완제품</option>
									<option value="원자재">원자재</option>
								</select>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" name="core" id="core">
							</div>
							<div class="col-4">
								<input type="text" class="form-control" name="part_name" id="part_name">
							</div>
							<div class="col-4">
								<label>단가(원)<span class="text-danger">*</span></label>
							</div>
							<div class="col-4">
								<label>재고수량<span class="text-danger">*</span></label>
							</div>
							<div class="col-4">
								<label>안전재고수량<span class="text-danger">*</span></label>
							</div>
							<div class="col-4">
								<input type="text" class="form-control" name="unit_price" id="unit_price">
							</div>
							<div class="col-4">
								<input type="text" class="form-control" name="stock" id="stock">
							</div>
							<div class="col-4">
								<input type="text" class="form-control" name="safety_stock" id="safety_stock">
							</div>
							<div class="col-6">
								<label>규격</label>
							</div>
							<div class="col-6">
								<label>단위</label>
							</div>
							<div class="col-6">
								<input type="text" class="form-control" name="standard" id="standard">
							</div>
							<div class="col-6">
								<input type="text" class="form-control" name="unit" id="unit">
							</div>
							<div class="col-12">
								<label>부품이미지</label>
							</div>
							<div class="col-12">
								<button type="button">임시버튼</button>
							</div>
							<input type="text" style="display:none" value="0" name="submitcheck" id="submitcheck">
							<div class="col-12">
								<button class="btn btn-danger float-right" type="button" onclick="deletebutton()">삭제</button>
								<button class="btn btn-info float-right"
									style="margin-right: 5px;" type="submit" formaction="insert.jsp" formmethod="post">등록</button>
								<button class="btn btn-info float-right" type="button" style="margin-right: 5px;">발주</button>
								<button class="btn btn-info float-right" type="reset" style="margin-right: 5px;" onclick="resetbutton()">초기화</button>
								<script>
								function deletebutton(){
									location.href="delete.jsp?p1="+document.getElementById('part_name').value;
								}
								
								//테이블 배경색 초기화
								function resetbutton(){
									var trs = document.querySelectorAll(".trs");
									for(var i=0; i<trs.length; i++){
										var item = trs.item(i);
										item.style.backgroundColor="white";
									}
								}
								</script>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
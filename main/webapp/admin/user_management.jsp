<!-- 사용자 관리 페이지 -->

<!-- 파라미터의미: adminid-테이블클릭했을때 어느사용자인지, name-윗쪽텍스트박스 검색기능, pagenum-pagination을 위한 현재페이지번호 -->

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
	Statement stmt2=null;
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

//pagenumber 파라미터받기
String pagenum = request.getParameter("pagenum");
if(pagenum==null){pagenum="1";}
//rowcount = row갯수
int rowcount=0;
query="select count(*) from user";
rs=stmt.executeQuery(query);
if(rs.next()){rowcount=rs.getInt(1);}
int lastpagenumber=1;
if(rowcount != 0){
	lastpagenumber = (rowcount-1)/10 +1;
}


//username검색기능
String name=request.getParameter("name");
if(name==null){
	name="";
}

if((name==null) || (name.equals(""))){
	query = "select * from user";
	rs=stmt.executeQuery(query);
}
else{
	query = "select * from user where user_name='"+name+"'";
	rs=stmt.executeQuery(query);
}
%>

<%
// 파라미터 adminid받아서 오른쪽 textbox에 값넣기

String adminid = request.getParameter("adminid");
String txtid="";
String txtpw="";
String txtname="";
String txtposition1="";
String txtposition2="";
String txtposition3="";
String txtphone="";
String txtemail="";
String txtnote="";
String state="1";
String use_yn="1";
String temp="";

String tableadminid="";

if ((adminid!=null)){
	if(adminid.equals("0")){
		txtid="";
		txtpw="";
		txtname="";
		txtposition1="";
		txtposition2="";
		txtposition3="";
		txtphone="";
		txtemail="";
		txtnote="";
	}
	else{
		query = "select * from user where user_id='"+adminid+"'";
		stmt2 = conn.createStatement();
		rs2=stmt2.executeQuery(query);
		while(rs2.next()){
			txtid=rs2.getString("user_id");
			txtpw=rs2.getString("user_pw");
			txtname=rs2.getString("user_name");
			txtposition1=rs2.getString("first_position");
			txtposition2=rs2.getString("second_position");
			txtposition3=rs2.getString("third_position");
			txtphone=rs2.getString("phone");
			txtemail=rs2.getString("email");
			txtnote=rs2.getString("note");
			state = rs2.getString("state");
			use_yn=rs2.getString("use_yn");
		}
	}
}
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

<!-- javascript 파라미터받는 함수 -->
<script>
	function getParameter(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
				.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1]
				.replace(/\+/g, " "));
	}
	var adminid = getParameter("adminid");
	var name = getParameter('name');
	
	
</script>
	<label style="margin-left: 30px; margin-top: 10px;">Admin / 사용자
		관리</label>
		
		
<!--------------------------------------------- 윗 섹션 ----------------------------------------------->

	<div class="card">
		<div class="card-body">
			<div class="form-inline">
				<label>이름</label> <input id="nametext" type="text" onKeypress="javascript:if(event.keyCode==13) {location.href='user_management.jsp?name='+this.value}">
				<script>
					document.getElementById('nametext').value=name;
				</script>
			</div>
		</div>
	</div>



	<div class="row">
	
<!----------------------------------------------- 왼쪽 섹션 -------------------------------------------->
		<div class="col-7" style="margin-right: 0px;">
			<div class="card" style="margin-right: 0px;">
				<div class="card-header"
					style="font-size: 20px; background-color: white;">사용자 관리</div>
				<div class="card-body">
					<table id="mytable" class="table table-bordered" style="width: 100%;"
						role="grid">
						<thead>
							<tr>
								<th>사번(아이디)</th>
								<th>이름</th>
								<th>Email</th>
								<th>Phone</th>
								<th>직위</th>
								<th>사용여부</th>
								<th></th>
							</tr>
						</thead>
						<tbody style="border-top: none;">
						<%
// 						테이블 동적 할당
						int pagenumber = Integer.parseInt(pagenum);
						if(pagenumber>=2){
							for(int i=0; i<(pagenumber-1)*10;i++){
								rs.next();
							}
						}
						int whilecount=0;
						while (rs.next()) {
							temp=rs.getString("user_id");
							String YN="";
							if(rs.getString("use_yn").equals("0")){
								YN="N";
							}
							else{
								YN="Y";
							}
						%>
						<tr class="trs" id="<%=rs.getString("user_id")%>" onclick="location.href='user_management.jsp?adminid=<%=temp%>&name=<%=name%>&pagenum=<%=pagenum%>'">
							<td><%=rs.getString("user_id")%></td>
							<td><%=rs.getString("user_name")%></td>
							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("phone")%></td>
							<td><%=rs.getString("first_position")%></td>
							<td><%=YN%></td>
							<td><button type="button" class="btn btn-secondary">인쇄</button></td>
						</tr>
						<%
							whilecount++;
							if(whilecount==10){
								break;
							}
						}
						%>
						<script>
							
// 							선택된 테이블 배경색 설정
						
							if(adminid!=null && adminid!="0" && adminid!=""){
								var selectedtable = document.getElementById(adminid);
								selectedtable.style.backgroundColor = "#17A2B8";
							}
							
							
// 							테이블 mouseenter 이벤트인데 일단 주석처리
// 							const tables = document.querySelectorAll(".trs");
// 							for (const table of tables){
// 								table.addEventListener("mouseenter", function(event){
// 									event.target.style.backgroundColor="#17A2B8";
// 								})
// 								table.addEventListener("mouseleave", function(event){
// 									event.target.style.backgroundColor="white";
// 								})
// 							}
							
							
						</script>
						
						</tbody>
					</table>

					<ul class="pagination justify-content-end">
						<li class="page-item<%=pagenumber==1?" disabled":"" %>"><a class="page-link" href="user_management.jsp?pagenum=<%=pagenumber-1%>">Previous</a></li>
						
						<%
						int pagecount = ((rowcount-1)/10)+1;
						for(int i=0;i<pagecount;i++){
						%>
						<li class="page-item<%=pagenumber==(i+1)?" active":"" %>"><a class="page-link" href="user_management.jsp?pagenum=<%=i+1%>"><%=i+1%></a></li>
						<%
						}
						%>

						<li class="page-item<%=pagenumber==lastpagenumber?" disabled":"" %>"><a class="page-link" href="user_management.jsp?pagenum=<%=pagenumber+1%>">Next</a></li>
					</ul>
				</div>
			</div>
		</div>

<!------------------------------------------------------ 오른쪽 섹션 --------------------------------------------->
		<div class="col-5" style="margin-left: 0px;">
			<div class="col" style="margin-left: 0px;">
				<div class="card">
						<div class="card-header">사용자 등록/수정</div>
						<div class="card-body">
						<form action="insert.jsp" method="post">
							<div class="row">
								<div class="col-4">
									<label> 사번(아이디) <span class="text-danger">*</span>
									</label>
								</div>
								<div class="col-4">
									<label> 비밀번호 <span class="text-danger">*</span>
									</label>
								</div>
								<div class="col-4">
									<label> 이름 <span class="text-danger">*</span>
									</label>
								</div>
								<div class="col-4">
									<input type="text" class="form-control" value="<%=txtid%>" name="user_id" id="user_id">
								</div>
								<div class="col-4">
									<input type="text" class="form-control" value="<%=txtpw%>" name="user_pw" id="user_pw">
								</div>
								<div class="col-4">
									<input type="text" class="form-control" value="<%=txtname%>" name="user_name" id="user_name">
								</div>
								<div class="col-4">
									<label>직위</label>
								</div>
								<div class="col-4">
									<label>직책</label>
								</div>
								<div class="col-4">
									<label>직급</label>
								</div>
								<div class="col-4">
									<input type="text" class="form-control" value="<%=txtposition1%>" name="first_position" id="first_position">
								</div>
								<div class="col-4">
									<input type="text" class="form-control" value="<%=txtposition2%>" name="second_position" id="second_position">
								</div>
								<div class="col-4">
									<input type="text" class="form-control" value="<%=txtposition3%>" name="third_position" id="third_position">
								</div>
								<div class="col-6">
									<label>Phone</label>
								</div>
								<div class="col-6">
									<label>Email</label>
								</div>
								<div class="col-6">
									<input type="text" class="form-control" value="<%=txtphone%>" name="phone" id="phone">
								</div>
								<div class="col-6">
									<input type="text" class="form-control" value="<%=txtemail%>" name="email" id="email">
								</div>
								<div class="col-6">
									<label>비고</label>
								</div>
								<div class="col-3">
									<label>상태</label> <span class="text-danger">*</span>
								</div>
								<div class="col-3">
									<label>사용여부</label> <span class="text-danger">*</span>
								</div>
								<div class="col-6">
									<input type="text" class="form-control" value="<%=txtnote%>" name="note" id="note">
								</div>
								<div class="col-3">
									<select class="form-select" name="state">
										<option value="1" <%="1".equals(state)?"selected":"" %>>Y</option>
										<option value="0" <%="0".equals(state)?"selected":"" %>>N</option>
									</select>
								</div>
								<div class="col-3">
									<select class="form-select" name="use_yn">
										<option value="1" <%="1".equals(use_yn)?"selected":"" %>>Y</option>
										<option value="0" <%="0".equals(use_yn)?"selected":"" %>>N</option>
									</select>
								</div>
								<div class="col-12 mb-3" style="border-bottom: 1px dashed #eee;">
									<label class="form-label"></label>
								</div>
								<div class="col-12">
									<button class="btn btn-danger float-right" type="button"
										onclick="deletebutton();">삭제</button>
									<button class="btn btn-info float-right"
										style="margin-right: 5px;" type="submit">등록</button>
									<button class="btn btn-info float-right" type="button" style="margin-right: 5px;" onclick="resetbutton();">초기화</button>
										
									<script>
// 									삭제버튼함수
										function deletebutton(){
											location.href="delete.jsp?adminid="+document.getElementById('user_id').value;
										}
// 									초기화버튼함수
										function resetbutton(){
											document.getElementById('user_id').value="";
											document.getElementById('user_pw').value="";
											document.getElementById('user_name').value="";
											document.getElementById('first_position').value="";
											document.getElementById('second_position').value="";
											document.getElementById('third_position').value="";
											document.getElementById('phone').value="";
											document.getElementById('email').value="";
											document.getElementById('note').value="";
											
											if(adminid!=null && adminid!="0" && adminid!=""){
												var selectedtable = document.getElementById(adminid);
												selectedtable.style.backgroundColor = "white";
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
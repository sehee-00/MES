<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<title>Insert title here</title>
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
	.float-right {
		float: right;
	}
</style>
</head>
<body>

	<div class="card">
		<div class="card-body">
			<div class="form-inline">
				<label>조회(년월)</label>
				<select id="selectyear">
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
				</select>
				<select id="selectmonth">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<button class="btn btn-info" onclick="buttonclick()">조회</button>
			</div>
			
			<div id="tablediv">
			
			</div>
			
		</div>
	</div>



	<script>
	function buttonclick(){
		var year = document.getElementById("selectyear").value;
		var month = document.getElementById("selectmonth").value;
		$.ajax({
		    type:"GET",
		      url:"./tablediv.jsp",
		      data:{year:year, month:month},
		      dataType:"html",
		      success:function(data){
		          $("#tablediv").html(data);
		    }
		 });
	}
	</script>
</body>
</html>
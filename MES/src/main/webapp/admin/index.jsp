<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>


<script>
var request = new XMLHttpRequest();
function search(){
	   request.open("Post", "http://localhost:8080/MES/temp?p1=aaa", true);
	   request.onreadystatechange = searchfacilities;
	   request.send(null);
	}

	function searchfacilities(element){
	   if(request.readyState == 4 && request.status == 200){
	      var object = eval('(' + request.responseText + ')');
	      var result = object.result;
	      alert(result[1].value);
	      console.log(element);
	   }
	}

search();
</script>
</body>
</html>
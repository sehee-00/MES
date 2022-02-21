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
<input type="text" id="textbox">
<button >ㅁㅁㅁㅁ</button>

<div id="ordert">

</div>
<script>
$("#textbox").on("keydown",function(e){   // 검색 창에 값이 입력됨에 따른 이벤트 처리
    if(e.keyCode==13){   // 엔터가 입력 됐을 때 
       input=$("#searchbox").val();
    
       $.ajax({
          type:"GET",
            url:"./ajax1.jsp",
            data:{input:input},
            dataType:"html",
            success:function(data){
                $("#ordert").html(data);
          }
       });
    }
});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 일단 phone, email 확인 후 메일 전송 -->
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>

<script type="text/javascript">
	 $(document).ready(function(){
	 	$("#findpw").click(function(){
	 		
	 		var phone = $("#phone").val();
	 		if(phone==""){
	 			alert("phone 미입력");
	 			return;
	 		}
	 		
	 		var email = $("#email").val();
	 		if(email==""){
	 			alert("이메일 미입력");
	 			return;
	 		}
	 		
	 		$.ajax({
	 			url:"findInfo",
	 			dataType:"json",
	 			type:"POST",
	 			data:{phone:phone,
	 				email:email},
	 			success:function(result){
	 				if(result!=""){
	 					alert(result);
	 					return;
	 				}
	 				alert("메일 전송 만들자");
	 				//window.close();
	 			},error:function(request,status,error){
	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			}
	 		});
	 		//window.close();
	 	});
	 });
 </script>
</head>
<body>
	<div style="width: 100%; text-align: center; margin-top: 10%">
		<div style="display: inline-block; border: 1px solid black;">
			<div>PW 찾기</div>
			<div>
				<div>Phone</div>
				<input id="phone">
			</div>
			<div>
				<div>Email</div>
				<input id="email">
			</div>
			<br>
			<button type="submit" id="findpw"  >찾기</button>
		</div>
	</div>
</body>
</html>
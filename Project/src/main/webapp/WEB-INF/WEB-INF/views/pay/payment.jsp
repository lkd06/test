<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>결제화면</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/project/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/project/resources/css/animate.css">
    
    <link rel="stylesheet" href="/project/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/project/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/project/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="/project/resources/css/aos.css">

    <link rel="stylesheet" href="/project/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="/project/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/project/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/project/resources/css/flaticon.css">
    <link rel="stylesheet" href="/project/resources/css/icomoon.css">
    <link rel="stylesheet" href="/project/resources/css/style.css">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    
	<script type="text/javascript">

		window.onload = function(){
			$("#proCount").val(1);
			var price = ${dto.getPrice() };
			$("#price").empty();
			$("#price").append(price);
			$("#price").val(price);
		}
		
		$(document).ready(function(){
			
			$("#proCount").click(function(){		
				if($("#proCount").val()<1) $("#proCount").val(1);
				var price = ${dto.getPrice() };
				$.ajax({
					url:"calculate.action",
					dataType:"text",
					data:{
						count:$("#proCount").val(),
						price:price
					},type:"POST",
					success:function(args){
						$("#price").empty();
						$("#price").append(args);
						$("#price").val(args);
					},error:function(){
						alert("error");
					}
				});
			});
			
			 
			//구매
			$("#pay").click(function(){
				alert($("#price").val());
				$.ajax({
					url:"pay.action",
					dataType:"text",
					data:{
						pro_num: $("#pro_num").val(),
						pro_count: $("#proCount").val(),
						price: $("#price").val(),
						paid:"paid",
						pro_type:$("#type").val(),
						subject:$("#subject").val()
					},type:"POST",
					success:function(args){
						location.href="payView.action"; 
					},error:function(){
						alert("paybag error");
					}
					
				});
			});
			
			//장바구니
			$("#bag").click(function(){
				$.ajax({
					url:"pay.action",
					dataType:"text",
					data:{
						pro_num: $("#pro_num").val(),
						pro_count: $("#proCount").val(),
						price: $("#price").val(),
						paid:"unpaid",
						pro_type:$("#type").val()
					},type:"POST",
					success:function(args){
						location.href="bagView.action";
					},error:function(){
						alert("paybag error");
					}
					
				});
			});
			
		});	
		$(document).ready(function(){
			
			
			
		});
	</script>
    
  </head>
  <body>
  <jsp:include page="../header.jsp"/>
  
	<br><Br>
	
	
	
		<div class="form-group row">
		   <label for="staticEmail" class="col-sm-2 col-form-label">Phone</label>
		   <div class="col-sm-10">
		     <div>${mdto.getPhone() }</div>
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
		   <div class="col-sm-10">
		     <div>${mdto.getName() }</div>
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="staticEmail" class="col-sm-2 col-form-label">제품명</label>
		   <div class="col-sm-10">
		     <div id="subject" >${dto.getSubject() }</div>
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="staticEmail" class="col-sm-2 col-form-label">등급</label>
		   <div class="col-sm-10">
		     <div>A/B/C/D</div>
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="staticEmail" class="col-sm-2 col-form-label">count</label>
		   <div class="col-sm-10">
		     <input type="number" class="form-control"  id="proCount" style="width: 30%">
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="staticEmail" class="col-sm-2 col-form-label">할부</label>
		   <div class="col-sm-10">
		     <input type="text" class="form-control"  id="staticEmail" value="대기" style="width: 30%">
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="staticEmail" class="col-sm-2 col-form-label">제품 가격</label>
		   <div class="col-sm-10">
		  		<div>${dto.getPrice() }</div>
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="staticEmail" class="col-sm-2 col-form-label">결제 금액</label>
		   <div class="col-sm-10">
		   		<div id="price"></div>
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="inputPassword" class="col-sm-2 col-form-label">Point</label>
		   <div class="col-sm-10">
		     <div>${mdto.getPoint() }</div>
		   </div>
		 </div>
		 
		 <div class="form-group row">
		   <label for="inputPassword" class="col-sm-2 col-form-label">사용할 Point</label>
		   <div class="col-sm-10">
		     <input type="number" class="form-control" id="inputPassword" style="width: 30%">
		   </div>
		 </div>
		
		
		<div>
			<input type="hidden" id="subject" value="${dto.getSubject() }">
			<input type="hidden" id="pro_num" value="${dto.getNum() }">
			<input type="hidden" id="type" value="${type }">
			<button type="button" class="btn btn-primary" id="pay">구매</button>
			<button type="button" class="btn btn-primary" id="bag">장바구니</button>
		</div>
		
	<jsp:include page="../footer.jsp"/>	
	<!-- loader -->

  <script src="/project/resources/js/jquery.min.js"></script>
  <script src="/project/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/project/resources/js/popper.min.js"></script>
  <script src="/project/resources/js/bootstrap.min.js"></script>
  <script src="/project/resources/js/jquery.easing.1.3.js"></script>
  <script src="/project/resources/js/jquery.waypoints.min.js"></script>
  <script src="/project/resources/js/jquery.stellar.min.js"></script>
  <script src="/project/resources/js/owl.carousel.min.js"></script>
  <script src="/project/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/project/resources/js/aos.js"></script>
  <script src="/project/resources/js/jquery.animateNumber.min.js"></script>
  <script src="/project/resources/js/bootstrap-datepicker.js"></script>
  <script src="/project/resources/js/jquery.timepicker.min.js"></script>
  <script src="/project/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/project/resources/js/google-map.js"></script>
  <script src="/project/resources/js/main.js"></script>
    
  </body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
	String pageNum = request.getParameter("pageNum");
%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<html>
  <head>
    <title>3조 통신사 프로젝트</title>
    <style type="text/css">
    	.a{
    		font-size: 30px;
    		color: #000000;
    	}
    	
    	tr{
    		border-bottom: 1px solid;
    		height: 80px;
    	}
    	
    	.font{
    		color: red;
    		font-weight: bold;
    		
    	}
    	
    </style>
    
    <script type="text/javascript">
    
    $(function(){
    	listPage(1);
    });
    
   
    
    $(document).ready(function(){
    	var order="";
    
	    
    	$("#low").click(function(){
    		
	   		$.ajax({   			
	   			type:"POST",
				url:"active.action?order=low",
	   			success:function(result){
	   				alert(result);
	   				$("#listData").html(result);
	   			},
	   			error:function(e){
					alert(e.responseText);
				}    		
	    	});
	    });
    	
		$("#hi").click(function(){
    		
	   		$.ajax({
	   			type:"POST",
				url:"active.action?order=hi",
	   			success:function(result){
	   				$("#listData").html(result);
	   			},
	   			error:function(e){
					alert(e.responseText);
				}    		
	    	});
	    });
    });
	
	function listPage(page){
		var url = "<%=cp%>/active.action";

		$.post(url,{pageNum:<%=pageNum%>}, function(e){
		$("#listData").html(e);
	});
	$("#listData").show();
	}
	
    </script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
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
    <link rel="stylesheet" href="/project/resources/js/bootstrap.min.js">
  </head>

  <body class="prod">
	  
	  <jsp:include page="../header.jsp"/>
    
    <div class="hero-wrap" style="background-image: url('/project/resources/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-start align-items-center">
          <div class="col-lg-6 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text">
	            <h1 class="mb-4">Now <span>It's easy for you</span> <span>rent a car</span></h1>
	            <p style="font-size: 18px;">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts</p>
            </div>
          </div>
        </div>
      </div>
    </div>

   	
   	<div class="container" style="height: AUTO; padding-top: 20px;">
   		<span class="a"> 
   		<b>모든 요금제${order }</b>
   		</span>
   		
   		<br><br>
   		<div>
   		<form action="" name="myForm" method="post">
			<div id="myDIV" align="right">
				<input type="hidden" value="low"/>
				<input type="hidden" value="hi"/>
				<input type="button" class="btn" value="낮은 가격순" id="low"/>|
				<input type="button" class="btn" value="높은 가격순" id="hi"/><br>
			</div>
			<div id="listData" style="display: none;"></div>
		</form>
		
   		</div>

	</div>

    
    <jsp:include page="../footer.jsp"/>
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="/project/resources/js/list.js"></script>
  </body>
</html>
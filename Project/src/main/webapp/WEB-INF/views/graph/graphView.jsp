<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>Autoroad - Free Bootstrap 4 Template by Colorlib</title>
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
  </head>
  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
  <script type="text/javascript">

  function printGraph(){
  		$.ajax({url:"graph_test.action",
  			data:{year:'${year}',month:'${month}'},
  			success:function(result){
  				$("#graphPrinter").html(result);
  			}});
  		setTimeout("printGraph()",5000);
  		
  	}
  
    $(document).ready(function(){
    	printGraph();
    	$("#year").change(function(){
        	window.location.href="graphview.action?year="+$("#year option:selected").val()+
        			"&month="+$("#month option:selected").val();
        });

        $("#month").change(function(){
        	window.location.href="graphview.action?year="+$("#year option:selected").val()+
			"&month="+$("#month option:selected").val();
        });
  	});
    
    
  </script>
  
  <body>
<jsp:include page="../header.jsp"/>
	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/5G.jpg'); height: 100px" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>다이렉트 샵 <i class="ion-ios-arrow-forward"></i></span>
          	</p>
            <h1 class="mb-3 bread">결제</h1>
          </div>
        </div>
      </div>
    </section>
    <br><br>
	<select id=year>
		<c:forEach var="i" begin="1" end="3">
			<option value="${year-4+i }">${year-4+i }</option>
		</c:forEach>
		<option value="${year }" selected="selected">${year }</option>
		<c:forEach var="i" begin="1" end="3">
			<option value="${year+i }">${year+i }</option>
		</c:forEach>
	</select>년 &nbsp


	<select id=month>
		<c:forEach var="i" begin="1" end="12">
			<c:if test="${i==month }">
				<option value="${i }" selected="selected">${i }</option>
			</c:if>
			<c:if test="${i!=month }">
				<option value="${i }">${i }</option>
			</c:if>
		</c:forEach>
	</select>월

	<!-- <><><><><><><><><><><><><><><><><><> <c:import url="/graph_test.action"/> -->
   <span id="graphPrinter"><c:import url="/graph_test.action"/></span>
	
	
    <section class="ftco-section services-section">
      <div class="container">
      	
      </div>
    </section>
    
  

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
    
  </body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
  <head>
    <title>3조 통신사 프로젝트</title>
    
    <style>
    	.a{
    		font-size: 30px;
    		color: #000000;
    		
    		
    	}
    	
    	tr{
    		border-bottom: 1px solid #c0c0c0;
    		height: 80px;
    	}
    	
    </style>
    
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

   	
   	<div class="container" style="padding-top: 20px;">
   		<span class="a"> 
   		<b>요금제</b>
   		</span>
   		
   		<br><br>
		
		<jsp:include page="image.jsp"/>

   		<br><br>
   		
	<table style="width: 100%; height: 500px;">
		<tr align="left"> 
			<td colspan="3"  style="font-size: 20pt; color: #000000;"><input type="hidden" name="searchKey" value="5GX"/>5GX 플랜<img src="/project/resources/image/5g.png"/></td>
			<td style="font-size: 15pt;">데이터도 콘텐츠도 자유롭게! 초시대의 요금 플랜</td>
			<td><a href="#"><img src="/project/resources/image/3.png"/></a></td>
			<c:forEach var="dto" items="lists">
			
			</c:forEach>
		</tr>
		
		<tr align="left"> 
			<td colspan="3" style="font-size: 20pt; color: #000000;"><input type="hidden" name="searchKey" value="T플랜"/>T 플랜<img src="/project/resources/image/lte.png"/></td>
			<td style="font-size: 15pt;">막강한 데이터&콘텐츠 혜택, LTE 라이프의 완성!</td>
			<td><a href="#"><img src="/project/resources/image/3.png"/></a></td>
		</tr>
		<tr align="left"> 
			<td colspan="3" style="font-size: 20pt; color: #000000;"><input type="hidden" name="searchKey" value="0플랜"/>0 플랜<img src="/project/resources/image/lte.png"/></</td>
			<td style="font-size: 15pt;">무엇이든 할 수 있는 '0을 위한 혜택'</td>
			<td><a href="#"><img src="/project/resources/image/3.png"/></a></td>
		</tr>
		<tr align="left"> 
			<td colspan="3" style="font-size: 20pt; color: #000000;"><input type="hidden" name="searchKey" value="주말"/>주말엔 팅<img src="/project/resources/image/lte.png"/></</td>
			<td style="font-size: 15pt;">주말전용 데이터를 더 드리는 청소년 요금제</td>
			<td><a href="#"><img src="/project/resources/image/3.png"/></a></td>
		</tr>
		<tr align="left"> 
			<td colspan="3" style="font-size: 20pt; color: #000000;"><input type="hidden" name="searchKey" value="히어로"/>0플랜 히어로<img src="/project/resources/image/lte.png"/></</td>
			<td style="font-size: 15pt;">초시대의 병영생활, 0히어로 군인요금제</td>
			<td><a href="#"><img src="/project/resources/image/3.png"/></a></td>
		</tr>
		<tr align="left"> 
			<td colspan="3" style="font-size: 20pt; color: #000000;"><input type="hidden" name="searchKey" value="Tab"/>T Tab<img src="/project/resources/image/2nd.png"/></</td>
			<td style="font-size: 15pt;">내게 맞는 혜택을 마음대로 골라쓰는 태블릿 요금제</td>
			<td><a href="#"><img src="/project/resources/image/3.png"/></a></td>
		</tr>
	</table>
	<br><Br>
	
	<div align="right">
   		<a href="list.action"><img src="/project/resources/image/4.png"/></a>
   	</div>
   	<br><br><br>
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
  </body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>3조 통신사 프로젝트</title>
    
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
  
	  	$(document).ready(function(){
	  		$("#order").click(function(){
	  			
	  			if(${empty phone }){
	  				alert("로그인이 필요합니다.");
	  				window.location="/project/";
	  				return;
	  			}
	  			
	  			var num = ${dto.num };
	  			window.location="payment.action?pro_num="+num+"&pro_type=pshop";
	  		});
	  	});
  
	</script>
	    
  </head>
  <body>
    
	  <jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/아이폰11Pro.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>다이렉트 샵 <i class="ion-ios-arrow-forward"></i></span> 
	          	<span><a href="phone_shop_list.action">휴대폰 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">상품 상세보기</h1>
          </div>
        </div>
      </div>
    </section>
    <br><br>
    
    
    <table align="center" style="padding: 20;" width="1200px;">
    	<tr>
    		<td rowspan="5"><img src="/project/resources/images/phone_shop/${dto.imageName }" style="width: 600px;"></td>
    		<td width="800px">
    			<h2 style="color: #FF0000;">${dto.subject }</h2><br>
    			출고가 
    			
    		</td>
    	</tr>
    	
    	<tr>
    		<td><hr></td>
    	</tr>
    	
    	<tr>
    		<td>${dto.content }</td>
    	</tr>
    	
    	<tr>
    		<td><hr></td>
    	</tr>
    	
    	<tr>
    		<td align="right"><h3 style="color: #000000;">가격: ${dto.price }원</h3></td>
    	</tr>
    	
    	<tr>
    		<td align="right"><a id="order" class="btn btn-primary">주문하기</a></td>
    	</tr>
    </table>
    <br><br><br>
    
    
    
    
    
    
    <%-- 
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url('/project/resources/images/phone_shop/${dto.imageName }');">
					
					</div>
					<div class="col-md-6 wrap-about py-md-5 ftco-animate">
			          <div class="heading-section mb-5 pl-md-5">
			          	<!-- <span class="subheading">About us</span> -->
			            <h2 class="mb-4">${dto.subject }</h2>
						 ${dto.num }
			            <p>${dto.content }</p>
			            <p>${dto.price }원</p>
			            
			            <p><!-- <a href="경도형 해주세요~~" class="btn btn-primary">장바구니</a> -->
			            <a id="order" class="btn btn-primary">주문하기</a>
			            </p>
			          </div>
					</div>
				</div>
			</div>
		</section>
	 --%>

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
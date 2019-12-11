<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
    
    String brandName=request.getParameter("brandName");    
    String brandCate=request.getParameter("brandCate"); 
%>
<!DOCTYPE html> 
<html>
<head>

<meta charset=UTF-8>
<title>Insert title here</title>
<style type="text/css">

table{
	width:80%;
	align:center;
	margin-left:auto;
	margin-right: auto;
}

div{	
	width:80%;
	align:center;
	margin:auto;
	background-color:#cccff;
}

.tg{
valign:middle;
text-align:center;
padding:30px;
margin:auto;
border:1px solid;
border-collapse:collapse
}
</style>
<script async="false" defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQqFM_hclfszzFPW_7DpOHkSFN4_0rCtg&callback=initialize" ></script>
<script type="text/javascript" src="/project/resources/js/httpRequest.js"></script>
<!-- <link rel="stylesheet" href="/project/resources/css/kmap.css" type="text/css"/> -->
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	
	window.onload = function(){
		var brandC = ${brandCate };
		var brandCate = ${brandCate};
		$("#brand_Cate").val(brandCate).attr("selected", "selected");
		
		$.ajax({
			url:"test.action",
			dataType:"text",
			data:{
				brandCate: brandC
			},
			type:"POST",
			success:function(args){ //list
				//alert(args);
				$("#brandName").append(args);
			},
			error:function(request,status,error){
		        alert(" error = " + error); // 실패 시 처리
		       }
		});//ajax	
	}
	 


	 function initialize(){
	 
		 var latitude=37.566536;
		 var longitude=126.97797;

		 var seoul={lat:latitude, lng:longitude};
	
		 //서울로 기본위치 설정
		 var map=new google.maps.Map(document.getElementById('map'),{	
		 	zoom:15,
		 	center:seoul
		 });
	
	
		 //마커의 위치와 제목 설정 --마커를 여러개 만들 경우 배열로 만들어 적용
		 var marker = new google.maps.Marker({
		 	position:seoul,
		 	title: "hello marker"
		 });
	
		 //마커 추가
		 marker.setMap(map)
	
	}  
	
	$("#btn-mapchange").click(function(){
		var address_text=$('#address').val();
		var trans_object = {
				'address':address_text
		}
		var trans_json=JSON.stringify(trans_object); //json 으로 반환
		
		$.ajax({
			url:"http://localhost:8080/controller/geocoderajax",
			type:'POST',
			dataType:'json',
			data:trans_json,
			contentType:'application/json',
			mimeType:'application/json',
			success:function(retval){
				reloadMap(retval.latitude,retval.longitude);	
				},error:function(retval,status,er){
					alert("error:"+retval+"status:"+status+"er:"+er);
				}		
		});
		
	});
	
	$(function(){
		
		$('#brand_Cate').change(function(){
			//var param = ("#brand_Cate option:selected").val();
				$('#brandName').find('option').remove();
			$.ajax({
				url:"test.action",
				dataType:"text",
				data:{
					brandCate: $('#brand_Cate').val()
				},
				type:"POST",
				success:function(args){ //list
					//alert(args);
					$("#brandName").append(args);
				},
				error:function(request,status,error){
			        alert(" error = " + error); // 실패 시 처리
			       }
			});//ajax						
		});//change	
	});
</script>

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
<body>

    <section>
    	<div class="container"></div>
   
    </section>
    
    
	 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="hi.jsp">Auto<span>road</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item active"><a href="tmem.action" class="nav-link">T멤버쉽</a></li>
	          <li class="nav-item"><a href="pricing.html" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="car.html" class="nav-link">Our Car</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	       <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>About us <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">About Us</h1>
          </div>
        </div>
      </div>
    </section> 
        
<br/><br/><br/>

<table>
  <tr>     
    <th align="left" style="font-size:16px; font-weight:bold">${Hmap.get('brandName')} <br/></th>
    <th  rowspan="2" ><img src="/project/resources/images/${Hmap.get('image') }"> </th>
  </tr>
 
  <tr>
    <td class="tg-cly1"><br/>${Hmap.get('info1')}<br>${Hmap.get('info2')}</td>
   
  </tr>
</table>
<br/><br/>
<form action="" enctype="application/x-www-form-urlencoded"></form>

<div style="background-color: #FFFFF0; padding:15px; text-align:center; font-weight:bold; font-size:20px; height:80px; width:80%" >

고객님이 선택하신 제휴사는 &nbsp;

 <!-- <form action="" name="myForm1">
<div id="select1">

</div>
 </form>
 -->
<select id="brand_Cate" onchange="categoryChange(this)">
	<option>카테고리</option>
	<option value="1">영화</option>
	<option value="2">베이커리</option>
	<option value="3">편의점</option>
	<option value="4">까페</option>
</select>

<select id="brandName" name="brandName">
	<!-- <option value="">전체</option> -->
</select>


<!-- 
	<select id="select1" style="width:120px; height:30px;  border-width: 0px 0px 1px 0px; text-align:center;" onchange="categoryChange()">
		<option  selected="selected" style="text-align:center;">영화</option>
		<option >베이커리</option>
		<option >편의점</option>
		<option>카페</option>
	</select> -->

	
	<!-- <select id="select2" style="width:200px; height:30px;  border-width: 0px 0px 1px 0px; text-align:center;">	
	</select> 	 -->
	&nbsp; 입니다. 
</div>



<br/><br/>


<table class="tg">
  <tr>
    <th colspan="2" style="text-align:left; background-color:grey; color:white; font-size:14px;padding:15px;" >영화사 <!-- $(dto.sector) -->  랭킹 * 위 <!-- $(dto.rank) --></th>
  </tr>
  <tr>
    <td  class="tg"><span style="font-weight:700">혜택</span></td>
    <td class="tg">${Hmap.get('benefit')}</td>
  </tr>
  <tr>
    <td  class="tg"><span style="font-weight:700">유의사항</span></td>
    <td  class="tg">${Hmap.get('note')}</td>
  </tr>
  <tr>
    <td  class="tg"><span style="font-weight:700">문의 및 상담</span></td>
    <td  class="tg">${Hmap.get('tel')}</td>
  </tr>
</table>

<br/><br/><br/>


<table class="tg">
<tr> 
	<th>어느 지역 T 멤버십 가맹점을 찾으시나요?<br/> 
		<select style="width:120px; height:30px;  border-width: 0px 0px 1px 0px; text-align:center;">
			<option selected="selected">서울</option>
			<option>인천</option>
		</select>
	
		<select style="width:120px; height:30px;  border-width: 0px 0px 1px 0px; text-align:center;"> 
			<option selected="selected">강남구</option>
			<option>중구</option>
		</select>
	  	 에서 T 멤버십 메가박스 가맹점을 찾고 있어요.   
	</th>
 </table>


 <!-- 	<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div> -->

<div id="mapdiv">
<div id="map"></div>
</div>
<input type="text" id="address">
<button name="subject" id="btn-mapchange" value="trans">지도변경</button>

<br/><br/><br/>

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">About Autoroad</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Services</a></li>
                <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear())</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

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
 <!--  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
 <!--  <script src="/project/resources/js/google-map.js"></script> -->
  <script src="/project/resources/js/main.js"></script>
    
  </body>
</html>

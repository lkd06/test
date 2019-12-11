<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
    
    String brandName=request.getParameter("brandName");    
    String brandCate=request.getParameter("brandCate"); 
   //String SbrandName=(String) session.getAttribute("SbrandName"); 아래까지 안감
%>
<!DOCTYPE html> 
<html>
<head>

<meta charset=UTF-8">
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
border-collapse:collapse;
/* width:100%; */
}

 select{

width:120px; 
height:30px;  
border-width: 0px 0px 1px 0px; 
text-align:center;
font-size:20px;

} 
option{
font-size:20px;
}
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}

</style>
<!-- <script async="false" defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQqFM_hclfszzFPW_7DpOHkSFN4_0rCtg&callback=initialize" ></script> -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53684bf4f72b8b55427017b8d4f36a16&libraries=services"></script>

<script type="text/javascript" src="/project/resources/js/httpRequest.js"></script>
 <script src="/project/resources/js/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="/project/resources/css/kmap.css" type="text/css"/> -->

<script type="text/javascript">

	window.onload = function() {
	
		loadPage();
	} 

	function loadPage() {
			
			
			var brandCate = ${brandCate};
			var brandName= "${brandName}"; //megabox	
			
			//tmem에서 받은 값으로 brandcate = selected
			//brandname 읽어와(.action) selected
			$("#brandCate").val(brandCate).attr("selected", "selected");
		//	$("#brandName").val(brandName).prop("selected", "selected"); 고정안됨
					
			var url="select.action"; //op list추가 ->selectBox.jsp에서 option만들어 옴

			$.post(url,{brandCate:"${brandCate}",brandName:"${brandName}"},function(args){	//영화관선택되어 있음		
				$("#brandName").val(brandName).prop("selected", "selected");
				if(args.length>0){			
						for(var i=0;i<args.length;i++){
							$('#brandName').find('option').remove();
							$("#brandName").append(args);					 
						}		
				}
			}); //post

			var defaultregion= "regionop.action";
			$.post(defaultregion,{areaop:"1"},function(args){	//서울로 map 지정
				
				if(args.length>0){			
					for(var i=0;i<args.length;i++){		
						$('#regionop').find('option').remove();
						$("#regionop").append(args);	
						$("#regionop").val("중구").attr("selected", "selected");	
						//sessionStorage.clear(); //시작페이지 null 됨
						sessionStorage.setItem("sRegion",$("#regionop option:selected").text());
						//sessionStorage.removeItem('sRegion');
					}		
				}
			}); //post		
		};
		
		$(function(){	
			$('#brandCate').change(function(){
				
				var brandCate = $("#brandCate").val();
				$('#brandName').find('option').remove();
				
				$.ajax({
					url:"select.action", //op list추가 ->selectBox.jsp에서 option만들어 옴
					dataType:"text",
					data:{brandCate: $('#brandCate').val()},
					type:"POST",
					success:function(args){ 		
						$("#brandName").append(args);				
					},
					error:function(request,status,error){
				        alert(" error = " + error); 
				    }
				});//ajax						
			});//change
		});		

		$(function(){
			
			$("#brandName").change(function(){
			
			 $.ajax({
					url:"coupon.action", 
					dataType:"text",
					type:"POST",
					data:{brandCate:$('#brandCate').val(),brandName:$('#brandName').val()},
					success:function(args){ //페이지 reload		
						var brandCate = $('#brandCate').val();
						var brandName = $('#brandName').val();			
						window.location.assign("tcoupon.action?brandCate="+brandCate+"&brandName="+brandName); 					
						//$("#brandName").val(brandName).attr("selected", "selected"); 안됨 option 생성 jsp 에서 해야함
					},
					error:function(request,status,error){
						alert("selecterror"+ error);
					}
				});//ajax						
			});//change	
		}); 
		
$(function(){
	$("#areaop").change(function(){		
	
		$.ajax({			
			url:"regionop.action",
			dataType:"text",
			type:"post",
			data:{areaop:$("#areaop").val()},
			success:function(result){	
				alert("areaop 성공 ");
				for(var i=0;i<result.length;i++){
					
					$('#regionop').find('option').remove();
					$("#regionop").append(result);					 
				}							
			},
			error:function(request,status,error){
				alert("지역 선택 오류");
			}		
		});	
	});
});

$(function(){
	$("#regionop").change(function(){	
		
		localStorage.removeItem('sRegion');
		sessionStorage.setItem("sRegion",$("#regionop option:selected").text());
		searchPlaces();	
		//$("#regionop").val($('#regionop').val()).attr("selected", "selected");안해도 됨
		//alert($('#regionop').val());//시흥
		//sessionStorage.removeItem('sRegion'); //시작 페이지 null 됨
		//sessionStorage.setItem('sRegion',$('#regionop').val()); //text로 나옴	
	});
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
    <th rowspan="2"><img src="/project/resources/images/${Hmap.get('image') }"> </th>
  </tr>
 
  <tr>
    <td class="tg-cly1"><br/>${Hmap.get('info1')}<br>${Hmap.get('info2')}</td>   
  </tr>
</table>

<form action="" enctype="application/x-www-form-urlencoded"></form>

<div style="background-color: #FFFFF0; padding:15px; text-align:center; font-weight:bold; font-size:20px; height:80px; width:80%" >

고객님이 선택하신 제휴사는 &nbsp;

 
<select id="brandCate"> 
	<option>카테고리</option>
	<option value="1">영화</option>
	<option value="2">베이커리</option>
	<option value="3">편의점</option>
	<option value="4">까페</option>
</select>

<select id="brandName" name="brandName">

</select>

	&nbsp; 입니다. 
</div>

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
<br/><br/>

<div class="container">
<table>
<tr> 
	<th><h3 style="text-align:center;">어느 지역 T 멤버십 가맹점을 찾으시나요?</h3>
	<span style="font-size:20px; text-align:center;"> &nbsp;&nbsp;	나는 &nbsp;&nbsp; </span>
		
		<select id="areaop">
			<option value="1">강원</option>
			<option value="2">경기</option>
			<option value="3">대구</option>
			<option value="4">부산</option>
			<option value="5" selected="selected">서울</option>	
		</select>
	
		<select id="regionop" style="width:120px; height:30px;  border-width: 0px 0px 1px 0px; text-align:center;"> 
			
		</select>
	  	<span style="font-size:20px;text-align:center;"> 에서 T 멤버십&nbsp; <span style="color:red"> ${Hmap.get('brandName')} </span> 가맹점을 찾고 있어요. </span>
	</th>
 </table>
  <br><br>
  
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
          <%--   <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="${Hmap.get('brandName')}" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div> --%>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div> 
</div></div>
<br><br>


<script type="text/javascript">

var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
	
	var Sregion= sessionStorage.getItem("sRegion");			
	//alert(Sregion);// 강남
    var keyword = Sregion+"${Hmap.get('brandName')}";
    //alert("키워드:" +keyword);
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
 </script>
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
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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

<%@ page contentType="text/html; charset=UTF-8"%>
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
  </head>
  <body>
    
	<jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/Galaxy.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>고객지원 <i class="ion-ios-arrow-forward"></i></span> 
	          	<span><a href="qna_list.action">Q&A <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">Q&A 질문하기</h1>
          </div>
        </div>
      </div>
    </section>
	
	
<!-- 상단제목 -->
<table width="1100" style="margin: auto;">
	<tr style="height: 90px;">
		<td style="font-size: 40px; font-weight: bold; color: #333333;">무엇이든 물어보세요</td>
	</tr>
	<tr>
		<td style="font-size: 25px; padding-left: 15px;">
			질문 작성하기
		</td>
	</tr>
</table>


<!-- 본문내용 -->
<form action="qna_created_ok.action" method="post">

	<table width="1100" style="margin: auto;" border="0">
		<tr><td bgcolor="#ea002c" colspan="4"></td></tr>
		<tr style="height: 10px;"><td colspan="4"></td></tr>
		
		<tr>
			<td style="font-size: 30px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6" align="center">
				<b>구&nbsp;&nbsp;분</b>
			</td>
			<td style="font-size: 25px; padding-left: 15px; width: 130px;">
				<input type="radio" name="category" value="휴대폰">&nbsp;&nbsp;휴대폰
			</td>
			<td style="font-size: 25px; padding-left: 15px; width: 200px;">
				<input type="radio" name="category" value="스마트기기">&nbsp;&nbsp;스마트기기
			</td>
			<td style="font-size: 25px; padding-left: 15px;">
				<input type="radio" name="category" value="요금제">&nbsp;&nbsp;요금제
			</td>
		</tr>
		
		<tr height="15"><td colspan="4"></td></tr>
		<tr height="15"><td style="border-bottom: 1px solid #e6e6e6;" colspan="4"></td></tr>
		<tr height="15"><td colspan="4"></td></tr>
		
		<tr>
			<td style="font-size: 30px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6" align="center">
				<b>제&nbsp;&nbsp;목</b>
			</td>
			<td colspan="3" style="padding-left: 15px;">
				<input type="text" name="subject" style="width: 900px;">
			</td>
		</tr>
		
		<tr height="15"><td colspan="4"></td></tr>
		<tr><td style="border-bottom: 1px solid #e6e6e6;" colspan="4"></td></tr>
		<tr height="15"><td colspan="4"></td></tr>
	
		<tr>
			<td style="font-size: 30px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6" align="center">
				<b>내&nbsp;&nbsp;용</b>
			</td>
			<td colspan="3" style="padding-left: 15px;">
				<textarea rows="30" cols="100" class="boxTA" style="height: 500px; width: 900px;" name="content"></textarea>
			</td>
		</tr>
		
		<tr height="15"><td colspan="4"></td></tr>
		<tr height="15"><td style="border-bottom: 1px solid #e6e6e6;" colspan="4"></td></tr>
		<tr height="15"><td colspan="4"></td></tr>
		
		<tr>
			<td align="center" colspan="4">
				<input type="button" class="btn btn-primary" style="width: 200px; height: 50px; font-size: 20px;" 
				value="리스트" onclick="javascript:location.href='qna_list.action';">&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary" style="width: 200px; height: 50px; font-size: 20px;">작성하기</button>
			</td>
		</tr>
	</table>

</form>
<br/><br/><br/>
	
	
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
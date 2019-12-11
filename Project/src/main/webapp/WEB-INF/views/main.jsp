<%@page import="com.exe.dto.MemberDTO"%>
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
    
    <script type="text/javascript">
    	function login(){
    		var f = document.mem;
    		f.action="login.action";
    		f.submit();
    	}
    	
    	function logout(){
    		var f = document.mem;
    		f.action="logout.action";
    		f.submit();
    	}
    </script>
    
  </head>
  <body>
    
	<jsp:include page="header.jsp"/>
    
    <div class="hero-wrap" style="background-image: url('/project/resources/images/5G(1).jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-start align-items-center">
          <div class="col-lg-6 col-md-6 ftco-animate d-flex align-items-end">
          	<div class="text">
	            <h1 class="mb-4">이제 <br>초시대 <br>생활이 되다</h1>
	            <p style="font-size: 18px;">모두의 생활을 바꾸는 거대한 변화</p>
	            <a href="https://www.youtube.com/watch?v=O9QJ4ucdtkw" class="icon-wrap popup-vimeo d-flex align-items-center mt-4">
	            	<div class="icon d-flex align-items-center justify-content-center">
	            		<span class="ion-ios-play"></span>
	            	</div>
	            	<div class="heading-title ml-5">
		            	<span>5G 광고 보기</span>
	            	</div>
	            </a>
            </div>
          </div>
          <div class="col-lg-2 col"></div>
          <div class="col-lg-4 col-md-6 mt-0 mt-md-5 d-flex">
          	<form action="" name="mem" method="post" class="request-form ftco-animate">
          	<%
          		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
          		String message = (String)session.getAttribute("message");
          		if(dto==null){
          	%>
          			<h2>로그인</h2>
	    			<div class="form-group">
	    				<label for="" class="label">아이디(Phone)</label>
	    				<input type="text" class="form-control" name="phone" placeholder="휴대폰 번호">
	    			</div>
	    			<div class="form-group">
	    				<label for="" class="label">비밀번호</label>
	    				<input type="password" class="form-control" name="pw" placeholder="비밀번호">
	    			</div>
			        <div class="form-group">
			            <input type="button" value="로그인" class="btn btn-primary py-3 px-4" 
			            onclick="login();">
			        </div>
			        
			         <div class="form-group">
			            <a href="signup.action">회원가입</a>
			        </div>
			        
				<%}else { %>
			      	<h2>로그인</h2>
		    		<div class="form-group">
		    			<%=dto.getPhone() %>
		    		</div>
		    		<div class="form-group">
		    			<%=dto.getName() %>
		    		</div>
				    <div class="form-group">
				        <input type="button" value="로그아웃" class="btn btn-primary py-3 px-4" onclick="logout();">
				    </div>
			        
					<%if(dto.getAdmin().equals("O")) { %>
					    <div class="form-group">
					        <a href="userinfo.action">정보조회</a>
					    </div>
						<div class="form-group">
							<a href="admin.action">회원관리</a>
						</div>
			       	<%}else { %>
					    <div class="form-group">
					        <a href="userinfo.action">정보조회</a>
					    </div>
					    <div class="form-group">
					        <a href="graphview.action">데이터조회</a>
					    </div>
			       	<%} %>
				<%} %>
	    	</form>
	      </div>
        </div>
      </div>
    </div>

    <section class="ftco-section services-section ftco-no-pt ftco-no-pb">
      <div class="container">
      	<center>
      	<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          	<span class="subheading">우리의 서비스</span>
            <h2 class="mb-2">우리의 서비스</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
              	<div class="d-flex mb-3 align-items-center">
	              	<div class="icon"><span class="flaticon-customer-support"></span></div>
	                <h3 class="heading mb-0 pl-3">연중무휴</h3>
                </div>
                <p>1년 365일 쉬는날 없이 가능</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
              	<div class="d-flex mb-3 align-items-center">
	              	<div class="icon"><span class="flaticon-route"></span></div>
	                <h3 class="heading mb-0 pl-3">위치</h3>
                </div>
                <p>전국 어디든지 있는 대리점</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
              	<div class="d-flex mb-3 align-items-center">
	              	<div class="icon"><span class="flaticon-online-booking"></span></div>
	                <h3 class="heading mb-0 pl-3">혜택</h3>
                </div>
                <p>여러가지 혜택과 할인</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
              	<div class="d-flex mb-3 align-items-center">
	              	<div class="icon"><span class="flaticon-rent"></span></div>
	                <h3 class="heading mb-0 pl-3">멤버십</h3>
                </div>
                <p>쌓일수록 좋은 멤버십</p>
              </div>
            </div>      
          </div>
        </div>
        </center>
      </div>
    </section>

    <section class="ftco-section">
    	<div class="container-fluid px-4">
    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          	<span class="subheading">다이렉트 샵</span>
            <h2 class="mb-2">휴대폰(최신순)</h2>
          </div>
        </div>
        
    	<center>
        	<table>
    		<c:forEach var="i" begin="1" end="8" step="1">
				<div class="row">
				    <div class="col-md-3">
						<c:if test="${lists.size()>i-1 }">
				    	<c:if test="${i%4==1 }">
							<tr>
						</c:if>
							<td width="400" align="center" style="padding: 20px;">
					    		<div class="car-wrap ftco-animate">
					    			<div class="img d-flex align-items-end">
					    				<a href="phone_shop_article.action?num=${lists.get(i-1).num }" title="${lists.get(i-1).imageName }">
											<img src="/project/resources/images/phone_shop/${lists.get(i-1).imageName }" width="400" height="250">
										</a>
				    				</div>
				    				<div class="text p-4 text-center">
				    					<h2 class="mb-0"><a href="car-single.html">${lists.get(i-1).subject }</a></h2>
				    					<span>${lists.get(i-1).price }원</span>
				    					<a href="phone_shop_article.action?num=${lists.get(i-1).num }" class="btn btn-black btn-outline-black mr-1">상세보기</a>
				    				</div>
				    			</div>
				    		</td>
	    				</c:if>
	    				<c:if test="${i%4==0 } || ${i%4==4 }">
							</tr>
						</c:if>
				    </div>
				</div>
    		</c:forEach>
    		</table>
        </center>
        
    		<!-- 
    		<div class="row">
    			<div class="col-md-3">
    				<div class="car-wrap ftco-animate">
    					<div class="img d-flex align-items-end" style="background-image: url(/project/resources/images/car-1.jpg);">
    						<div class="price-wrap d-flex">
    							<span class="rate">$25</span>
    							<p class="from-day">
    								<span>From</span>
    								<span>/Day</span>
    							</p>
    						</div>
    					</div>
    					<div class="text p-4 text-center">
    						<h2 class="mb-0"><a href="#">Mercedes Grand Sedan</a></h2>
    						<span>Audi</span>
    						<p class="d-flex mb-0 d-block"><a href="#" class="btn btn-black btn-outline-black mr-1">Book now</a> <a href="#" class="btn btn-black btn-outline-black ml-1">Details</a></p>
    					</div>
    				</div>
    			</div>
    		</div>
    		 -->
    	</div>
    </section>

    <section class="ftco-section services-section img" style="background-image: url(/project/resources/images/5G.jpg);">
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row justify-content-center mb-5">
	          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
	          	<span class="subheading">편의기능</span>
	            <h2 class="mb-3">많이 찾는 기능</h2>
	          </div>
	        </div>
    		<div class="row">
    		  <div class="col-md-3 d-flex align-self-stretch ftco-animate">
	            <div class="media block-6 services services-2">
	              <div class="media-body py-md-4 text-center">
	                <div class="icon d-flex align-items-center justify-content-center">
	                <a href="@@@@@.action"><span class="flaticon-route"></span></a>
	                </div>
	                <h3>매장 및 대리점 찾기</h3>
	                <p>가까운 매장 및 대리점을<br> 찾아보세요.</p>
	              </div>
	            </div>      
	          </div>
	          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
	            <div class="media block-6 services services-2">
	              <div class="media-body py-md-4 text-center">
	              	<div class="icon d-flex align-items-center justify-content-center">
	              	<a href="qna_list.action"><span class="flaticon-select"></span></a>
	              	</div>
	                <h3>Q&A</h3>
	                <p>고객님이 궁금하신 점을<br> 물어보고 찾아보세요.</p>
	              </div>
	            </div>      
	          </div>
	          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
	            <div class="media block-6 services services-2">
	              <div class="media-body py-md-4 text-center">
	              	<div class="icon d-flex align-items-center justify-content-center">
	              	<a href="@@@@@.action"><span class="flaticon-rent"></span></a>
	              	</div>
	                <h3>멤버십</h3>
	                <p>멤버십으로 받을 수 있는<br> 혜택을 알아보세요.</p>
	              </div>
	            </div>      
	          </div>
	          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
	            <div class="media block-6 services services-2">
	              <div class="media-body py-md-4 text-center">
	              	<div class="icon d-flex align-items-center justify-content-center">
	              	<a href="s_index.action"><span class="flaticon-review"></span></a>
	              	</div>
	                <h3>혜택</h3>
	                <p>현재 받을 수 있는 혜택을<br> 확인해보세요.</p>
	              </div>
	            </div>      
	          </div>
    		</div>
    	</div>
    </section>

    <!-- <section class="ftco-section testimony-section ftco-no-pt ftco-no-pb"> -->
    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">상품 서비스</span>
            <h2 class="mb-3">요금제</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
                <div class="testimony-wrap text-center py-4 pb-5">
                  <div class="user-img mb-4" style="background-image: url(/project/resources/images/person_1.jpg)">
                  </div>
                  <div class="text pt-4">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">Marketing Manager</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center py-4 pb-5">
                  <div class="user-img mb-4" style="background-image: url(/project/resources/images/person_2.jpg)">
                  </div>
                  <div class="text pt-4">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">Interface Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center py-4 pb-5">
                  <div class="user-img mb-4" style="background-image: url(/project/resources/images/person_3.jpg)">
                  </div>
                  <div class="text pt-4">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">UI Designer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center py-4 pb-5">
                  <div class="user-img mb-4" style="background-image: url(/project/resources/images/person_1.jpg)">
                  </div>
                  <div class="text pt-4">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">Web Developer</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center py-4 pb-5">
                  <div class="user-img mb-4" style="background-image: url(/project/resources/images/person_1.jpg)">
                  </div>
                  <div class="text pt-4">
                    <p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    <p class="name">Roger Scott</p>
                    <span class="position">System Analyst</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section services-section ftco-no-pt ftco-no-pb">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">고객지원</span>
            <h2>공지사항</h2>
          </div>
        </div>
        <div class="row d-flex">
	        <c:forEach var="i" begin="1" end="1">
		        <c:forEach var="dto" items="${lists2 }">
					<h3 class="heading mt-2"><a href="${articleUrl2}&num=${dto.num}">${dto.subject }</a></h3>
			        <p>${dto.content }</p><br>
			        <p style="padding-left: 80%;"><a href="noti_list.action">공지사항 더보기 ></a></p>
				</c:forEach>
	    	</c:forEach>
        </div>
      </div>
    </section>
    
	<jsp:include page="footer.jsp"/>
 
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
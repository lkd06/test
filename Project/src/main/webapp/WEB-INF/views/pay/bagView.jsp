<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/5G.jpg');" data-stellar-background-ratio="0.5">
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
    
	<div class="container">
	
	<br><br><br>
<h1><b>장바구니</b></h1>
    <table height="auto;" width="50%;">
    	<tr style="border-bottom: 1px solid;">
    		<td >상품명</td>
    		<td>상품종류</td>
    		<td>수량</td>
    		<td>가격</td>
    		<td>구매일</td>    		
    	</tr>
    	<c:forEach var="pdto" items="${bagList }">
    	<tr>
    		<td>${pdto.subject }</td>
    		 <td>${pdto.pro_type }</td>
    		<td>${pdto.pro_count }</td>    	
    		<td>${pdto.price }</td>    		
    		<td>${pdto.pay_day }</td>
    		<td><a href="product.action?type=${pdto.pro_type }&num=${pdto.pro_num }">상품내역</a></td>
    	</tr>
    	</c:forEach>
    	
    	
    </table>
	<br><br><br>
    </div>
    
    



</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>3조 통신사 프로젝트</title>
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
	          	<span>관리자 페이지 <i class="ion-ios-arrow-forward"></i></span>
	          	<span><a href="admin.action">관리자 페이지 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">회원 관리</h1>
          </div>
        </div>
      </div>
    </section>
	<br><br><br>
	
	
	<table width="1300" style="margin: auto;">
		<tr><td bgcolor="#ea002c" colspan="8"></td></tr>
		<tr style="height: 10px;"><td colspan="8"></td></tr>
		
		<tr align="center" style="font-weight: bold;">
			<td width="200">아이디</td>
			<td width="150">이름</td>
			<td width="100">관리자</td>
			<td width="150">생일</td>
			<td width="250">이메일</td>
			<td width="100">등급</td>
			<td width="150">포인트</td>
			<td width="200">강제 탈퇴</td>
		</tr>
		
		<tr style="height: 10px;"><td colspan="8"></td></tr>
		<tr><td bgcolor="#e8e8e8" colspan="8"></td></tr>
		
		<c:forEach var="dto" items="${lists }">
			<tr style="border-bottom: 1px solid #e8e8e8; height: 50px;">
				<td align="center">${dto.phone }</td>
				<td align="center">${dto.name }</td>
				<td align="center">${dto.admin }</td>
				<td align="center">${dto.birth }</td>
				<td align="center">${dto.email }</td>
				<td align="center">${dto.tmemberGrade }</td>
				<td align="center">${dto.point }</td>
				<td align="center">
					<%-- <input type="hidden" name="phone" value="${dto.phone }"> --%>
					<input type="button" onclick="javascript:location.href='/project/signout2.action?phone=${dto.phone }';" class="btn btn-primary py-3 px-4" value="회원 강제 탈퇴">
				</td>
			</tr>
		</c:forEach>
		
		<tr><td bgcolor="#ea002c" colspan="8"></td></tr>
	</table>
	<br><br><br>
	
	<jsp:include page="../footer.jsp"/>


</body>
</html>
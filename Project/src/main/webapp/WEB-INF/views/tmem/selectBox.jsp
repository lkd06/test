<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
%>
<% //tcoupon 에서 #brandName==megabox 를 한글로 
	/* String cate=null;
	if("${selectmap.getkey()}"==1) cate="movie";
	//else if()
		 */
		
	
%>

<option value="">전체</option>
<c:forEach var="it" items="${it}">
	<option value="${it }">${selectmap.get(it)} </option>
</c:forEach>


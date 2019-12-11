<%@ page session="false" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/project/resources/js/ajaxUtil.js"></script>
<style>
.btn {
  border: none;
  outline: none;
  background-color: #ffffff;
  cursor: pointer;
  font-size: 15px;
}

.active{
  color:red;
  font-weight: bold;
}
</style>

<script type="text/javascript">

	var header = document.getElementById("myDIV"); 
	var btns = header.getElementsByClassName("btn");
	 for (var i = 0; i < btns.length; i++) {
		btns[0]=" active";
	  btns[i].addEventListener("click", function() {
	  var current = document.getElementsByClassName("active");
	  current[0].className = current[0].className.replace(" active", " ");
	  this.className += " active";
	  });
	} 
	 
	 
</script>

</head>
<body>

		<div>
   			<span class="font" style="float: left">전체(${dataCount }) >${str2 }</span>의 요금제 리스트입니다. 
   		</div>

	<table style="width: 100%; color: #000000;">
		<tr align="center" style="height: 50px; background-color: #f7f7f7; border-top:1px solid;  border-bottom: 1px solid #c0c0c0;"> 
			<td colspan="7"><b>상품명</b></td>
			<td><img src="/project/resources/image/d.png"/></td>
			<td><img src="/project/resources/image/tel.png"/></td>
			<td><img src="/project/resources/image/msg.png"/></td>
			<td><b>월정액</b></td>
			<td><b>24개월약정시</b></td>
			<td></td>
		</tr>

		<c:forEach var="dto" items="${lists }">

		<tr align="center" style="border-bottom: 1px solid #c0c0c0;">
			<td colspan="7" class="subject">${dto.subject }</td>
			<td class="gb"><b>${dto.gb }</b></td>
			<td class="tel">${dto.tel }</td>
			<td class="content">${dto.content }</td>
			<td class="price"><b><fmt:formatNumber value="${dto.price }" pattern="#,##0"/>원</b></td>
			<td class="list">${dto.list }</td>
			<td style="padding-top: 20px;">
			<a href="view.action?num=${dto.num}&content2=${dto.content2}&subject=${dto.subject}"><img src="/project/resources/image/5.png"/></a>
			<a href="view.action"><img src="/project/resources/image/6.png"/></a><Br><br>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<div id="footer" align="center">
		<p>
		<br>
			<c:if test="${dataCount!=0 }">
				${pageIndexList }
			</c:if>
			<c:if test="${dataCount==0 }">
				등록된게시물이 없습니다.
			</c:if>
		</p>
	</div>
   
	

</body>
</html>

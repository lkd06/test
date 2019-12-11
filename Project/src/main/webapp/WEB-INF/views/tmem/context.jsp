<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
%>
<script type="text/javascript">

$(function(){
		
	$('#brandCate').change(function(){
		var brandCate = $("#brandCate").val();
		//var param = ("#brand_Cate option:selected").val();
	
		$('#brandName').find('option').remove();
		
		$.ajax({
			url:"select.action",
			dataType:"text",
			data:{
				brandCate: $('#brandCate').val()
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

$(function(){
	
	$("#brandName").change(function(){
		
	//	$("#brandName").val("#brandName").prop("selected", "true"); 에러
		
		var brandCate = $("#brandCate").val();
		var brandName=$("#brandName").val(); //toure
		//alert(brandName);
		var index= $("#brandName option").index($("#brandName option:selected"));
		//alert(index); //1
		
		var state = jQuery('#brandName option:selected').val();	
		//alert(state); //toure
		
		/* var select_options = $('#brandName option');
		alert(select_options); //object object
		var i= select_options[index]; //html objectoption
		alert(i);
		 select_options[index].attr("selected", "true"); */
		
		//$("#brandName").val(brandName).prop("selected", "true"); //에러
		
		$.ajax({
			url:"context.action",
			dataType:"text",
			type:"POST",
			data:{brandName:brandName,brandCate:brandCate},
			success:function(args){ //list
				//alert(args);
		
				//$("#brandName > option[@value=state]").attr("selected", "true");
				
				$("#Con").html(args);
				
				
			
				/* if(args.length>0){
					$('#brandName').find('option').remove();
					$('#brandName').append(args);			
				}else{
					$('#brandName').find('option').remove();
					$('#brandName').append("<option value=''>선택</option>");
				} //else				 */
			}, //success	
			error:function(request,status,error){
				alert("selecterror"+ error);
			}
		});//ajax						
	});//change	

});
</script>
<table>
  <tr>     
    <th align="left" style="font-size:16px; font-weight:bold">${Hmap.get('brandName')} <br/></th>
    <th  rowspan="2" ><img src="/project/resources/images/tmem/${Hmap.get('image') }"> </th>
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
<select id="brandCate"> 
	<option>카테고리</option>
	<option value="1">영화</option>
	<option value="2">베이커리</option>
	<option value="3">편의점</option>
	<option value="4">까페</option>
</select>

<select id="brandName" name="brandName"  >
 	<option value="">전체</option>
</select>

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


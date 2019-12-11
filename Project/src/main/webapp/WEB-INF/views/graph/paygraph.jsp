<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
  <head>
  <script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawBackgroundColor);

    function drawBackgroundColor() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'X');
          data.addColumn('number', '원');

          data.addRows([
            ['1월', ${price[1]}],   ['2월', ${price[2]}],  ['3월', ${price[3]}],  ['4월', ${price[4]}],  ['5월', ${price[5]}],  ['6월',${price[6]}],
            ['7월', ${price[7]}],  ['8월', ${price[8]}],  ['9월', ${price[9]}],  ['10월', ${price[10]}],  ['11월', ${price[11]}], ['12월', ${price[12]}]
          ]);

          var options = {
            hAxis: {
              title: 'Month'
            },
            vAxis: {
              title: '사용금액'
            },
            backgroundColor: '#f1f8e9'
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
          chart.draw(data, options);
    }
    
    $(document).ready(function(){
	    $("#year").change(function(){
	    	alert($("#year").val());
	    	window.location.href="paygraph.action?year="+$("#year option:selected").val();
	    });
	});
    </script>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['월', '구매액(만원)', '월정액(요금제 + 부가서비스)(원)', '????'],
          ['1월', ${price[1]}/10000, ${monthPay[1]}, 2000],
          ['2월', ${price[2]}/10000, ${monthPay[2]}, 2500],
          ['3월', ${price[3]}/10000, ${monthPay[3]}, 3000],
          ['4월', ${price[4]}/10000, ${monthPay[4]}, 3500],
          ['5월', ${price[5]}/10000, ${monthPay[5]}, 3500],
          ['6월', ${price[6]}/10000, ${monthPay[6]}, 3500],
          ['7월', ${price[7]}/10000, ${monthPay[7]}, 3500],
          ['8월', ${price[8]}/10000, ${monthPay[8]}, 3500],
          ['9월', ${price[9]}/10000, ${monthPay[9]}, 3500],
          ['10월', ${price[10]}/10000, ${monthPay[10]}, 3500],
          ['11월', ${price[11]}/10000, ${monthPay[11]}, 3500],
          ['12월', ${price[12]}/10000, ${monthPay[12]}, 3500]
        ]);

        var options = {
          chart: {
            title: '금액(만원)',
            subtitle: '',
          },
          bars: 'vertical',
          vAxis: {format: 'decimal'},
          height: 400,
          colors: ['#1b9e77', '#d95f02', '#7570b3']
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
  </head>
  <body>
	<select id=year>
		<c:forEach var="i" begin="1" end="3">
			<option value="${year-4+i }">${year-4+i }</option>
		</c:forEach>
		<option value="${year }" selected="selected">${year }</option>
		<c:forEach var="i" begin="1" end="3">
			<option value="${year+i }">${year+i }</option>
		</c:forEach>
	</select>년 &nbsp

	<div style="text-align: center; margin-top: 50px;">
		<div id="chart_div"
			style="width: 900px; height: 500px; display: inline-block;"></div>
	</div>
	<br><Br>
	
	<div style="text-align: center; margin-top: 50px;">
		<div id="columnchart_material" style="width: 800px; height: 500px;  display: inline-block;"></div>
	</div>
	 
</body>
</html>

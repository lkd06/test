<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
	Gson gsonObj = new Gson();
	Map<Object,Object> map = null;
	int totalVisitors = 883000;
	List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
	 
	map = new HashMap<Object,Object>(); map.put("y", 803000); map.put("name", "남은 데이터"); map.put("color", "#E7823A"); list.add(map);
	map = new HashMap<Object,Object>(); map.put("y", 80000); map.put("name", "데이터 사용량"); map.put("color", "#546BC1"); list.add(map);
	
	String newVsReturningVisitorsDataPoints = gsonObj.toJson(list);
	/* 
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object,Object>(); map.put("x", 1420050600000L); map.put("y", 33000); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1422729000000L); map.put("y", 35960); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1425148200000L); map.put("y", 42160); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1427826600000L); map.put("y", 42240); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1430418600000L); map.put("y", 43200); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1433097000000L); map.put("y", 40600); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1435689000000L); map.put("y", 42560); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1438367400000L); map.put("y", 44280); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1441045800000L); map.put("y", 44800); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1443637800000L); map.put("y", 48720); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1446316200000L); map.put("y", 50840); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1448908200000L); map.put("y", 51600); list.add(map);
	 
	String newVisitorsDataPoints = gsonObj.toJson(list);
	 
	list = new ArrayList<Map<Object,Object>>();
	map = new HashMap<Object,Object>(); map.put("x", 1420050600000L); map.put("y", 22000); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1422729000000L); map.put("y", 26040); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1425148200000L); map.put("y", 25840); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1427826600000L); map.put("y", 23760); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1430418600000L); map.put("y", 28800); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1433097000000L); map.put("y", 29400); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1435689000000L); map.put("y", 33440); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1438367400000L); map.put("y", 37720); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1441045800000L); map.put("y", 35200); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1443637800000L); map.put("y", 35280); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1446316200000L); map.put("y", 31160); list.add(map);
	map = new HashMap<Object,Object>(); map.put("x", 1448908200000L); map.put("y", 34400); list.add(map);
	 
	String returningVisitorsDataPoints  = gsonObj.toJson(list);
	 */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function () {
 /* 
 inner : 안에 공간
 radius : 전체 크기
 */
 
 alert(${totalData});
var totalVisitors = <%out.print(totalVisitors);%>;
var visitorsData = {
	"New vs Returning Visitors": [{
		click: visitorsChartDrilldownHandler,
		cursor: "pointer",
		explodeOnClick: false,
		innerRadius: "75%",
		legendMarkerType: "square",
		name: "New vs Returning Visitors",
		radius: "100%",
		showInLegend: true,
		startAngle: 90,
		type: "doughnut",
		dataPoints: <%out.print(newVsReturningVisitorsDataPoints);%>
	}],
	"New Visitors": [{
		color: "#E7823A",
		name: "New Visitors",
		type: "column",
		xValueType: "dateTime"
		<%-- dataPoints: <%out.print(newVisitorsDataPoints);%> --%>
	}],
	"Returning Visitors": [{
		color: "#546BC1",
		name: "Returning Visitors",
		type: "column",
		xValueType: "dateTime"
		<%-- dataPoints: <%out.print(returningVisitorsDataPoints);%> --%>
	}]
};
 
var newVSReturningVisitorsOptions = {
	animationEnabled: true,
	theme: "light2",
	title: {
		text: "?? 월 데이터 사용량"
	},
	subtitles: [{
		text: "Click on Any Segment to Drilldown",
		backgroundColor: "#2eacd1",
		fontSize: 16,
		fontColor: "white",
		padding: 5
	}],
	legend: {
		fontFamily: "calibri",
		fontSize: 14,
		itemTextFormatter: function (e) {
			return e.dataPoint.name + ": " + Math.round(e.dataPoint.y / totalVisitors * 100) + "%";  
		}
	},
	data: []
};
 
var visitorsDrilldownedChartOptions = {
	animationEnabled: true,
	theme: "light2",
	axisX: {
		labelFontColor: "#717171",
		lineColor: "#a2a2a2",
		tickColor: "#a2a2a2"
	},
	axisY: {
		gridThickness: 0,
		includeZero: false,
		labelFontColor: "#717171",
		lineColor: "#a2a2a2",
		tickColor: "#a2a2a2",
		lineThickness: 1
	},
	data: []
};
 
var chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
chart.options.data = visitorsData["New vs Returning Visitors"];
chart.render();
 
function visitorsChartDrilldownHandler(e) {
	chart = new CanvasJS.Chart("chartContainer", visitorsDrilldownedChartOptions);
	chart.options.data = visitorsData[e.dataPoint.name];
	chart.options.title = { text: e.dataPoint.name }
	chart.render();
	$("#backButton").toggleClass("invisible");
}
 
$("#backButton").click(function() { 
	$(this).toggleClass("invisible");
	chart = new CanvasJS.Chart("chartContainer", newVSReturningVisitorsOptions);
	chart.options.data = visitorsData["New vs Returning Visitors"];
	chart.render();
});
 
}
</script>
<style>
  #backButton {
	border-radius: 4px;
	padding: 8px;
	border: none;
	font-size: 16px;
	background-color: #2eacd1;
	color: white;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
  }
  .invisible {
    display: none;
  }
</style>

</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<button class="btn invisible" id="backButton">&lt; Back</button>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<p>total: ${totalData }</p>
<form action="" name="graph" method="post">
	<input type="text">
	<input type="hidden" name="phone" value="123">
	<input type="button" onclick="" value="using">
</form>
</body>
</html>
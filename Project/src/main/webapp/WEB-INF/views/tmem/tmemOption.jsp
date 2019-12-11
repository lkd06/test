<%@page import="java.util.Arrays"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
%>

<%! 
String[] movie ={"메가박스","CGV","롯데시네마"};
String[] bakery={"파리크로와상","파리바게트","뚜레쥬르"};
String[] convie={"CU","7일레븐","미니스톱"};
String[] cafe ={"스타벅스","공차","투썸플레이스"};

public List<String> search(String option2){
	
	List<String> list =null;

	if(option2=="1"){
		list= Arrays.asList(movie);	
		
	}else if(option2=="2"){
		list=Arrays.asList(bakery);
		
	}
	
	return list;
}
%>
<% 
	String option2 = request.getParameter("option2");
	out.print(option2);
	List<String> lists = search(option2);

	out.print(lists.size());
	out.print("|");
	
	Iterator it = lists.iterator();
	
	while(it.hasNext()){
		String option = (String)it.next();
		out.print(option2);
		
		if(lists.size()-1 > 0){
			out.print(",");
		}
	}

%>

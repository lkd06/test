package com.exe.project;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.dto.MemberDTO;
import com.exe.dto.PackageDTO;
import com.exe.dto.payDTO;
import com.exe.graph.Graph;

@Controller
public class graphController {
	
	@Autowired
	@Qualifier("graphDAO")
	Graph dao;
	
	@RequestMapping(value = "/graph_test.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String graph_test(HttpServletRequest request) {
		Calendar calen = new GregorianCalendar();
		String year = Integer.toString(calen.get(Calendar.YEAR));
		String month = Integer.toString(calen.get(Calendar.MONTH)+1);

		if(request.getParameter("year")!=null) {
			year = request.getParameter("year");
			month = request.getParameter("month");
		}
		
		String ym = year+month;
		
		HttpSession session = request.getSession();
		MemberDTO memdto = (MemberDTO)session.getAttribute("memDTO");
		
		String phone=memdto.getPhone();
		int usingData=0;

		if(request.getParameter("usingData")!=null) {
			usingData = Integer.parseInt(request.getParameter("usingData"));
		}
		Map<String, Object> map = null;
		try {
			//딴 package 테이블 이용
			map = dao.graphTest(phone, usingData,ym);
			String newVsReturningVisitorsDataPoints=(String)map.get("newVsReturningVisitorsDataPoints");
			int totalData=(Integer)map.get("totalData");
			usingData = (Integer)map.get("usingData");
			request.setAttribute("newVsReturningVisitorsDataPoints", newVsReturningVisitorsDataPoints);
			request.setAttribute("totalData", totalData);
			request.setAttribute("usingData", usingData);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		

		
		return "graph/graphtest";
	}
	
	@RequestMapping(value = "/graphview.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String view(HttpServletRequest request) {
		Calendar calen = new GregorianCalendar();
		String year = Integer.toString(calen.get(Calendar.YEAR));
		String month = Integer.toString(calen.get(Calendar.MONTH)+1);
		if(request.getParameter("year")!=null) {
			year = request.getParameter("year");
			month = request.getParameter("month");
		}
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		return "graph/graphView";
	}
	
	@RequestMapping(value = "/paygraph.action", method = RequestMethod.GET)
	public String payGraph(HttpServletRequest request) {
		Calendar calen = new GregorianCalendar();
		String year = Integer.toString(calen.get(Calendar.YEAR));
		if(request.getParameter("year")!=null) {
			year = request.getParameter("year");
		}
		request.setAttribute("year", year);
		
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		String phone= dto.getPhone();
		//월 구매량
		List<payDTO> lists = dao.pay(year, phone);
		int price[]=new int[13];
		
		for(int i=0;i<lists.size();i++) {
			payDTO pdto = lists.get(i);
			int month = Integer.parseInt(pdto.getPay_day());
			price[month] = pdto.getPrice();
		}
		
		
		//월정액량
		//package 테이블의 price 이용 예정
		
		int monthPay[]= new int[13];
		List<PackageDTO> plists = dao.monthPay(year, phone);
		for(int i=0;i<plists.size();i++) {
			PackageDTO pdto = plists.get(i);
			String ym = pdto.getYm();
			int month =Integer.parseInt(ym.substring(4));
			monthPay[month]=pdto.getPrice();
		}
		
		request.setAttribute("price", price);
		request.setAttribute("monthPay", monthPay);
		
		return "graph/paygraph";
	}
}

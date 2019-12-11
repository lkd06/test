package com.exe.project;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.exe.dao.PriceDAO;
import com.exe.dto.PriceDTO;
import com.exe.util.MyUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

@Controller
public class PriceController {
	
	@Autowired
	@Qualifier("priceDAO")
	PriceDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value = "/price.action", method = RequestMethod.GET)
	public String price() throws Exception {
		return "product/price";
	}
	
	@RequestMapping(value = "/service.action", method = RequestMethod.GET)
	public String service() {
		return "product/service";
	}
	@RequestMapping(value = "/image.action", method = RequestMethod.GET)
	public String image() {
		return "product/image";
	}
	
	@RequestMapping(value = "/active.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String active(HttpServletRequest request, HttpServletResponse resqonse,String str,String order, String basic)  throws Exception  {
		
		str="desc";
		String str2="";
		
		order = request.getParameter("order");
		
		if(order==null|| order.equals("")) {
			str = "desc";
			str2="기본순";
			System.out.println(str + " , " + str2);
		}else if(order=="low"|| order.equals("low")) {
			str = "asc";
			str2="낮은 가격순";
			System.out.println(str + " , " + str2);
		}else if(order=="hi" || order.equals("hi")) {
			str= "desc";
			str2="높은 가격순";
			System.out.println(str + " , " + str2);
		}
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
//		System.out.println(pageNum+ " pageNum");
		
		int currentPage = 1;
		
		if(pageNum != null && pageNum!="") {
			currentPage = Integer.parseInt(pageNum);
		}
//		System.out.println(currentPage+" curr");
		//�쟾泥대뜲�씠�꽣媛��닔
		int dataCount = dao.getDataCount();
		
		//�쟾泥댄럹�씠吏��닔
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<PriceDTO> lists =
			dao.getList(str, start, end);
		
		//�럹�씠吏� 泥섎━
		System.out.println(lists.size());
		String listUrl = cp + "/list.action";
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//湲�蹂닿린 二쇱냼 �젙由�
		String articleUrl =cp + "/list.action?pageNum="+pageNum;
		
//		System.out.println(pageNum);

		//�룷�썙�뵫 �맆 �럹�씠吏��뿉 �뜲�씠�꽣瑜� �꽆湲대떎
		request.setAttribute("str2", str2);
		request.setAttribute("str", str);
		request.setAttribute("pageNum", currentPage);
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("listUrl", listUrl);
		request.setAttribute("order", order);
	
		return "product/active";
	}
	
	@RequestMapping(value = "/list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String list(HttpServletRequest request, HttpServletResponse resqonse,String low, String hi,String str) throws Exception {
		String order = request.getParameter("order");
		
		request.setAttribute("order", order);
		
		return "product/list";
	}
	@RequestMapping(value = "/view.action", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(HttpServletRequest request) throws Exception {
		
		int num = Integer.parseInt(request.getParameter("num"));
		PriceDTO dto = dao.getReadData(num);
		
		String content2 = request.getParameter("content2");
		String subject = request.getParameter("subject");
		System.out.println("content2= " + content2);
		System.out.println("subject=" + subject);
		
		String xml=null;
		File file = null;
		
		if(content2.equals("5GX"))
			xml = "5gx.xml";
		else if(content2.equals("T플랜"))
			xml = "tplan.xml";
		else if(content2.equals("0플랜"))
			xml = "0plan.xml";
		else if(content2.equals("주말"))
			xml = "week.xml";
		else if(content2.equals("히어로"))
			xml = "hero.xml";
		else if(content2.equals("Tab"))
			xml = "tab.xml";
		
		file = new File(xml);
		
		System.out.println(xml);
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();  
		Document document = documentBuilder.parse(file);
		document.getDocumentElement().normalize();
		Element element = document.getDocumentElement();
		
		NodeList nodeList = element.getElementsByTagName(subject);

		String xmlName[] = {"subject", "content1", "content2", "content3","info1","image","content4", "vip","free","flo","content5","image2"};
		
		Element ele = (Element)nodeList.item(0); 
		System.out.println(ele); 
 
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i = 0; i<xmlName.length; i++) { 
			System.out.println(xmlName[i]);
			String[] str = xmlName[i].split("-");
			
			System.out.println(str);
			
			String result =ele.getElementsByTagName(xmlName[i]).item(0).getFirstChild().getNodeValue();
			
			System.out.println(result);
			map.put(xmlName[i], result);
			 
		}
		 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/view");
		mav.addObject("dto",dto);
		mav.addObject("hMap", map);
		mav.addObject("content2", content2);
		mav.addObject("subject",subject);
		
		return mav;
	}
	
	@RequestMapping(value = "/test1.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String test(HttpServletRequest request) throws Exception {
		return "product/test";	
	}
}

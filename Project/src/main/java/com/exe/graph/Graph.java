package com.exe.graph;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.Subject;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.PackageDTO;
import com.exe.dto.payDTO;
import com.google.gson.*;

public class Graph {
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public Map<String, Object> graphTest(String phone,int usingData,String ym) {
		Gson gsonObj = new Gson();
		Map<String, Object> insert = new HashMap<String, Object>();
		insert.put("usingData", usingData);
		insert.put("phone",phone);
		insert.put("ym",ym);
		sessionTemplate.update("graphmapper.dataUsing", insert);
		//insert.remove("usingData");
		GraphDTO dto = sessionTemplate.selectOne("graphmapper.totalData",insert);
		
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		//���⼭ �� �����ͷ� ���ؼ� map�� ����Ʈ�� �ְ�
		//int totalData
		map = new HashMap<Object, Object>();
		if(dto.getTotalData()==-1) {
			dto.setTotalData(9999999);
		}
		map.put("y", dto.getTotalData()-dto.getUsingData());
		map.put("name", "���� ������");
		map.put("color", "#E7823A");
		list.add(map);
		//usingData�� ����(update) ���� �ڿ� 
		//�굵 map�� list�� �ش�
		map = new HashMap<Object, Object>();
		map.put("y", dto.getUsingData());
		map.put("name", "������ ��뷮");
		map.put("color", "#546BC1"); 
		list.add(map);
		
		String newVsReturningVisitorsDataPoints = gsonObj.toJson(list);
		
		Map<String, Object> result=new HashMap<String, Object>();
		result.put("totalData",dto.getTotalData());
		result.put("usingData",dto.getUsingData());
		result.put("newVsReturningVisitorsDataPoints",newVsReturningVisitorsDataPoints);
		
		return result;
	}
	
	public List<payDTO> pay(String year,String phone){
		List<payDTO> lists = new ArrayList<payDTO>();
		//�⵵�� �˻��ؼ� ������ �з�
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("phone",phone);
		map.put("year",  year.substring(2));
		//Ȯ�ο�
		System.out.println(year.substring(2));
		
		//resultType�� ��� �޾ƾ� �� �� ���
		lists = sessionTemplate.selectList("graphmapper.payment", map);
		
		return lists;
	}
	
	public List<PackageDTO> monthPay(String year,String phone){
		List<PackageDTO> lists = new ArrayList<PackageDTO>();
		//�⵵�� �˻��ؼ� ������ �з�
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("phone",phone);
		map.put("year",  year);
		
		
		//resultType�� ��� �޾ƾ� �� �� ���
		lists = sessionTemplate.selectList("graphmapper.monthpay", map);
		
		return lists;
	}
}

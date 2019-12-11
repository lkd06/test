package com.exe.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.MemberDTO;
import com.exe.dto.payDTO;

public class payDAO {
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int MaxNum() {
		int max=sessionTemplate.selectOne("paymapper.maxNum");
		return max+1;
	}
	
	//�������� �� ���̺� �߰�
	public void addProduct(payDTO dto) {
		int num = MaxNum();
		dto.setNum(num);
		sessionTemplate.insert("paymapper.buyProduct", dto);
	}
	
	//������ ��ǰ ��¿�
	//���� phone�� ��µǴ� ��
	//ac�� ���Ŵ� �Ǵµ� ����� �� ��
	/*
	 * public List<payDTO> buyList(String phone) { Map<String , String> hm = new
	 * HashMap<String, String>(); hm.put("phone", phone); List<payDTO> lists =
	 * sessionTemplate.selectList("paymapper.buyList", hm);
	 * 
	 * return lists; }
	 */
	public List<payDTO> buyList(String phone,int start,int end,String pro_type) {
		Map<String , Object> hm = new HashMap<String,  Object>();
		hm.put("phone", phone);
		hm.put("start", start);
		hm.put("end", end);
		hm.put("pro_type",pro_type);
		hm.put("paid", "paid");
		List<payDTO> lists = sessionTemplate.selectList("paymapper.buyListSel", hm);
		
		return lists;
	}
	
	//��Ƶ� ��ǰ ��¿�
	public List<payDTO> bagList(String phone,int start,int end,String pro_type) {
		Map<String , Object> hm = new HashMap<String, Object>();
		hm.put("phone", phone);
		hm.put("start", start);
		hm.put("end", end);
		hm.put("pro_type",pro_type);
		hm.put("paid", "unpaid");
		List<payDTO> lists = sessionTemplate.selectList("paymapper.buyListSel", hm);
		
		return lists;
	}
	
	
	public int getDataCount(String phone,String paid,String pro_type) {
		Map<String, Object> hm = new HashMap<String, Object>();
		hm.put("phone", phone);
		hm.put("paid", paid);
		hm.put("pro_type",pro_type);
		return sessionTemplate.selectOne("paymapper.getDataCount", hm);
	}
}

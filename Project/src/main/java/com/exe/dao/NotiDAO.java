package com.exe.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.dto.NotiDTO;

public class NotiDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate=sessionTemplate;
	}
	
	public int getMaxNum(){
		
		int maxNum = 0;
		
		maxNum = sessionTemplate.selectOne("notimapper.maxNum");
		
		return maxNum;
	}
	
	public void insertData(NotiDTO dto){
		
		sessionTemplate.insert("notimapper.insertData",dto);
	}
	
	//��ȸ������
	public void updateHitCount(int num){

		sessionTemplate.update("notimapper.updateHitCount",num);
	}
	
	//��ü������
	public List<NotiDTO> getList(String searchKey,String category,int start, int end){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("start", start);
		params.put("end", end);
		
		List<NotiDTO> lists = sessionTemplate.selectList("notimapper.getLists",params);
		
		return lists;
	}
	
	//��ü �����ͼ� ���ϱ�
	public int getDataCount(String searchKey,String category){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		
		int result = sessionTemplate.selectOne("notimapper.getDataCount",params);
		
		return result;
	}
	
	//�Ѹ��� ������ ���
	public NotiDTO getReadData(String searchKey,String category,int num){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("category", category);
		params.put("num", num);
		
		NotiDTO dto = sessionTemplate.selectOne("notimapper.getReadData",params);
		
		return dto;
	}
	
	//����
	public void deleteData(int num){
		
		sessionTemplate.update("notimapper.deleteData",num);
	}
}
